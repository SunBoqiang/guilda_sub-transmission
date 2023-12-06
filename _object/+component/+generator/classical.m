classdef classical < component.generator.base
    
    methods
        function obj = classical(parameter)
            arguments
                parameter = 'NGT2';
            end
            obj@component.generator.base(parameter)
            
            obj.parameter = obj.parameter(:, {'Xd', 'Xq', 'M', 'D'});
            obj.set_avr( component.generator.avr.base() );
            obj.set_governor( component.generator.governor.base() );
            obj.set_pss( component.generator.pss.base() );
            obj.system_matrix = struct();
        end
        
        function name_tag = naming_state(obj)
            gen_state = {'delta','omega'};
            avr_state = obj.avr.naming_state;
            pss_state = obj.pss.naming_state;
            governor_state = obj.governor.naming_state;
            name_tag = horzcat(gen_state,avr_state,pss_state,governor_state);
        end

        function u_name = naming_port(obj)
            u_avr = obj.avr.naming_port;
            u_pss = obj.pss.naming_port;
            u_gov = obj.governor.naming_port;
            u_name = [u_avr,u_pss,u_gov];
        end

        function out = get_nx(obj)
            out = 2 + obj.avr.get_nx() + obj.pss.get_nx() + obj.governor.get_nx();
        end
        
        function nu = get_nu(obj)
            nu = obj.avr.get_nu() + obj.pss.get_nu() + obj.governor.get_nu();
        end
        
        % 機器のダイナミクスを決めるメソッド
            function [dx, con] = get_dx_constraint(obj, t, x, V, I, u)%#ok
                % Vfdは定数であるため、界磁電圧に関する入力は必要ないのですが、AGCのコードで入力が１つの発電機が入ると面倒臭そうなので２つのままにしておきます
                p = obj.parameter;
                nx_avr = obj.avr.get_nx();
                nx_pss = obj.pss.get_nx();
                nx_gov = obj.governor.get_nx();
                
                x_gen = x(1:2);
                x_avr = x(2+(1:nx_avr));
                x_pss = x(2+nx_avr+(1:nx_pss));
                x_gov = x(2+nx_avr+nx_pss+(1:nx_gov));
                
                Vabs = norm(V);
                %Vangle = atan2(V(2), V(1));
                
                delta = x_gen(1);
                omega = x_gen(2);
                
                Efd = 0;

                [dx_pss, v] = obj.pss.get_u(x_pss, omega);
                [dx_avr, Vfd] = obj.avr.get_Vfd(x_avr, Vabs, Efd, u(1)-v);
                [dx_gov, P] = obj.governor.get_P(x_gov, omega, u(2));

                Vd  = V(1)*sin(delta)-V(2)*cos(delta);
                Vq  = V(1)*cos(delta)+V(2)*sin(delta);
                Id  = (Vfd-Vq)/p.Xd;...
                Iq  = Vd/p.Xq;

                Ir  =   Id*sin(delta) + Iq*cos(delta);
                Ii  = - Id*cos(delta) + Iq*sin(delta);

                ddelta = obj.omega0 * omega;
                domega = ( P - p.D*omega - Vq*Iq - Vd*Id )/p.M;

                con = I - [Ir;Ii];
                dx = [ddelta; domega; dx_avr; dx_pss; dx_gov];
            end

        % 定常潮流状態からモデルの平衡点と定常入力値を求めるメソッド
            function [x_st,u_st] = get_equilibrium(obj, V, I)
                p = obj.parameter;
    
                Vangle = angle(V);
                Vabs =  abs(V);
                Pow = conj(I)*V;
                P = real(Pow);
                Q = imag(Pow);
    
                delta = Vangle + atan(P/(Q+Vabs^2/p.Xq));
    
                Id = real(  1j*I*exp(-1j*delta) );
                Vq = imag(  1j*V*exp(-1j*delta) );
                Vfd = Id*p.Xd+Vq;
                [x_avr,u_avr] = obj.avr.initialize(Vfd, Vabs);
                [x_gov,u_gov] = obj.governor.initialize(P);
                [x_pss,u_pss] = obj.pss.initialize();
    
                x_st = [delta; 0; x_avr; x_gov; x_pss];
                u_st = [u_avr;u_pss;u_gov];
            end

        % GFMIのリファレンスモデルとして実装するために必要なメソッド
            function [delta,omega,Vdq] = get_Vterminal(obj,x,V,I,u)%#ok
                delta  = x(1);
                domega = x(2);
                omega  = domega + 1;

                nx_avr = obj.avr.get_nx();
                nx_pss = obj.pss.get_nx();
                x_avr = x(2+(1:nx_avr));
                x_pss = x(2+nx_avr+(1:nx_pss));

                [~,  v ] = obj.pss.get_u(x_pss, domega);
                [~, Vfd] = obj.avr.get_Vfd(x_avr, norm(V), 0, u(1)-v);

                Vdq = [0;Vfd];
            end
    end
end


