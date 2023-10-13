classdef Factory_odeData < handle
    properties
        network
        Ymat_rproduce
        Ymat_all
        logical = struct('x',[],'xcl',[],'xcg',[],'V',[],'Iconst',[],'Vconst',[]);
        logivec = struct('x',[],'xcl',[],'xcg',[],'V',[],'Iconst',[],'Vconst',[]);
        logimat = struct('x',[],'xcl',[],'xcg',[],'V',[],'Iconst',[],'Vconst',[]);
        
        t
        V
        I
        x
        xcl
        xcg
        Vvir
        sols
    end
    methods
        function obj = Factory_odeData(net)
            obj.network = net;
            obj.initialize;
        end

        function initialize(obj)
            net = obj.network;
            nbus = numel(net.a_bus);
            nx   = numel(net.x_equilibrium);
            nxcl = sum( tools.vcellfun(@(c) c.get_nx, net.a_controller_local ));
            nxcg = sum( tools.vcellfun(@(c) c.get_nx, net.a_controller_global));
            obj.V = zeros(nbus*2,0);
            obj.I = zeros(nbus*2,0);
            obj.x = zeros(nx,0);
            obj.xcl = zeros(nxcl,0);
            obj.xcg = zeros(nxcg,0);
        end

        function setidx(obj,tool,Ymat_rep,Ymat,no_reduced_bus,Iconst_bus,Vconst_bus)
            obj.Ymat_rproduce = Ymat_rep;
            obj.Ymat_all      = Ymat;
            
            prop = {'x','xcl','xcg'};
            for i = 1:3
                p = prop{i};
                obj.logical.(p) = tool.(['logical_',p]);
                obj.logimat.(p) = tool.(['logimat_',p]);
                obj.logivec.(p) = any(obj.logimat.(p),2);
            end
            
            a_mat = kron((1:numel(obj.network.a_bus))',[1;1]);
            
            obj.logical.V = ismember(a_mat,no_reduced_bus);
            obj.logivec.V = true(2*numel(no_reduced_bus),1);

            obj.logical.Iconst = ismember(a_mat,Iconst_bus);
            obj.logivec.Iconst = true(2*numel(Iconst_bus),1);

            obj.logical.Vconst = ismember(a_mat,Vconst_bus);
            obj.logivec.Vconst = true(2*numel(Vconst_bus),1);
            
        end

        function [x0,const0] = get_x0(obj,x0,xcl0,xcg0,V0,I0,Vvir0)

            x0   = x0(  obj.logical.x  );
            xcl0 = xcl0(obj.logical.xcl);
            xcg0 = xcg0(obj.logical.xcg);

            net = obj.network;
            V0comp = V0(1:2:end)+1j*V0(2:2:end);
            I0comp = I0(1:2:end)+1j*I0(2:2:end);
            for i = 1:numel(net.a_bus)
                if isempty(x0) || any(isnan(x0(obj.logimat.x(:,i))))
                    warning('off')
                    c = net.a_bus{i}.component.copy;
                    x0(obj.logimat.x(:,i)) = c.set_equilibrium(V0comp(i),I0comp(i));
                    warning('on')
                end
            end
            for i = 1:numel(net.a_controller_local)
                if isempty(xcl0) || any(isnan(xcl0(obj.logimat.xcl(:,i))))
                    xcl0(obj.logimat.xcl(:,i)) = net.a_controller_local{i}.get_x0;
                end
            end
            for i = 1:numel(net.a_controller_global)
                if isempty(xcg0) || any(isnan(xcg0(obj.logimat.xcg(:,i))))
                    xcg0(obj.logimat.xcg(:,i)) = net.a_controller_global{i}.get_x0;
                end
            end
            
            x0 = [x0;xcl0;xcg0];

            Vvir0(isnan(Vvir0))=0;
            const0 = [V0(   obj.logical.V     ) ;...
                      I0(   obj.logical.Vconst) ;...
                      Vvir0(obj.logical.Iconst) ];
        end
            
        function [x0,xcl0,xcg0,V0,I0,Vvir0] = add_data(obj,sol)
            obj.t = [obj.t,sol.x(:).'];

            odeX = sol.y;
            ntime = size(odeX,2);

            logimat_all = blkdiag( obj.logivec.x      ,...
                                   obj.logivec.xcl    ,...
                                   obj.logivec.xcg    ,...
                                   obj.logivec.V      ,...
                                   obj.logivec.Iconst ,...
                                   obj.logivec.Vconst );
            
            obj.x(   :,end+(1:ntime)) = nan_completion(odeX(logimat_all(:,1),:),obj.logical.x     );
            obj.xcl( :,end+(1:ntime)) = nan_completion(odeX(logimat_all(:,2),:),obj.logical.xcl   );
            obj.xcg( :,end+(1:ntime)) = nan_completion(odeX(logimat_all(:,3),:),obj.logical.xcg   );
            obj.Vvir(:,end+(1:ntime)) = nan_completion(odeX(logimat_all(:,6),:),obj.logical.Vconst);
            
            Vred = odeX(logimat_all(:,4),:) ;
            Vall = obj.Ymat_rproduce * Vred;
            Iall = obj.Ymat_all      * Vall;
            Iall(obj.logical.Iconst,:) = odeX(logimat_all(:,5),:);
            obj.V = [obj.V,Vall];
            obj.I = [obj.I,Iall];
        
            Vvir0= obj.Vvir(:,end);
            V0   = obj.V(:,end);
            I0   = obj.I(:,end);
            x0   = obj.x(:,end);
            xcl0 = obj.xcl(:,end);
            xcg0 = obj.xcg(:,end);

            obj.sols = [obj.sols,{sol}];
        end

    end
end

function out = nan_completion(data,logimat)
    out = nan(size(logimat,1),size(data,2));
    out(logimat,:) = data;
end