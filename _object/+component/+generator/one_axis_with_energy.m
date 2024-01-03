classdef one_axis_with_energy < component.generator.base
% モデル  ：同期発電機の一軸モデル
%         ・状態：３つ「回転子偏角"δ",周波数偏差"Δω",内部電圧"E"」
%               *AVRやPSSが付加されるとそれらの状態も追加される
%         ・入力：２ポート「界磁入力"Vfield", 機械入力"Pmech"」
%               *定常値からの追加分を指定
% 親クラス：componentクラス
% 実行方法：obj =　component.generator.1axis(omega, parameter)
% 　引数　：・omega     : double値．系統周波数(50or60*2pi)
% 　　　　　・parameter : table型．「'Xd', 'Xd_prime','Xq','T','M','D'」を列名として定義
% 　出力　：componentクラスのインスタンス
    
    
    methods
        function obj = one_axis_with_energy(parameter)
            arguments
                parameter = 'NGT2';
            end
            obj@component.generator.base(parameter)
            
            obj.parameter = obj.parameter(:, {'Xd', 'Xd_prime', 'Xq', 'Tdo', 'M', 'D'});
            obj.set_avr( component.generator.avr.base() );
            obj.set_governor( component.generator.governor.base() );
            obj.set_pss( component.generator.pss.base() );
            obj.system_matrix = struct();
        end
        
        function name_tag = naming_state(obj)
            gen_state = {'delta','omega','Ed','WF','WG'};
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

        function [dx, con] = get_dx_constraint(obj, ~, x, V, I, u)
            omega0 = obj.omega0;

            Xd  = obj.parameter.Xd;
            Xdp = obj.parameter.Xd_prime;
            Xq  = obj.parameter.Xq;
            d   = obj.parameter.D;
            Tdo = obj.parameter.Tdo;
            M = obj.parameter.M;
            
            nx = 3;
            nx_avr = obj.avr.get_nx();
            nx_pss = obj.pss.get_nx();
            nx_gov = obj.governor.get_nx();
            
            x_gen = x(1:nx);
            x_avr = x(nx+(1:nx_avr));
            x_pss = x(nx+nx_avr+(1:nx_pss));
            x_gov = x(nx+nx_avr+nx_pss+(1:nx_gov));
            
            Vabs = norm(V);
            Vangle = atan2(V(2), V(1));
            
            delta = x_gen(1);
            omega = x_gen(2);
            E = x_gen(3);
            
            Vabscos = V(1)*cos(delta)+V(2)*sin(delta);
            Vabssin = V(1)*sin(delta)-V(2)*cos(delta);
            
            Ir =  (E-Vabscos)*sin(delta)/Xdp + Vabssin*cos(delta)/Xq;
            Ii = -(E-Vabscos)*cos(delta)/Xdp + Vabssin*sin(delta)/Xq;
            
            con = I - [Ir; Ii];
            
            Efd = Xd*E/Xdp - (Xd/Xdp-1)*Vabscos;
            
            [dx_pss, v] = obj.pss.get_u(x_pss, omega);
            [dx_avr, Vfd] = obj.avr.get_Vfd(x_avr, Vabs, Efd, u(1)-v);
            [dx_gov, Pmech] = obj.governor.get_P(x_gov, omega, u(2));
            
            
            dE = (-Efd + Vfd)/Tdo;
            ddelta = omega0 * omega;
            P = -(- Vabs*E*sin(delta-Vangle)/Xdp + Vabs^2*(1/Xdp-1/Xq)*sin(2*(delta-Vangle))/2);
            domega = (Pmech - d*omega -P)/M;

            dWF = M * omega0 * omega * domega;
            dWG = (P-Pmech) * ddelta + (Efd-Vfd)/(Xd-Xdp)*dE;
            
            dx = [ddelta; domega; dE; dWF; dWG; dx_avr; dx_pss; dx_gov];
            
        end
        
        
        function [x_st,u_st] = get_equilibrium(obj,V,I)
            if nargin<2
                V = obj.V_equilibrium;
                I = obj.I_equilibrium;
            end
            Vangle = angle(V);
            Vabs =  abs(V);
            Pow = conj(I)*V;
            P = real(Pow);
            Q = imag(Pow);
            Xd  = obj.parameter{:, 'Xd'};
            Xdp = obj.parameter{:, 'Xd_prime'};
            Xq  = obj.parameter{:, 'Xq'};
            delta = Vangle + atan(P/(Q+Vabs^2/Xq));
            Enum = Vabs^4 + Q^2*Xdp*Xq + Q*Vabs^2*Xdp + Q*Vabs^2*Xq + P^2*Xdp*Xq;
            Eden = Vabs*sqrt(P^2*Xq^2 + Q^2*Xq^2 + 2*Q*Vabs^2*Xq + Vabs^4);
            E = Enum/Eden;
            Vfd = Xd*E/Xdp - (Xd/Xdp-1)*Vabs*cos(delta-Vangle);
            [x_avr,u_avr] = obj.avr.initialize(Vfd, Vabs);
            [x_gov,u_gov] = obj.governor.initialize(P);
            [x_pss,u_pss] = obj.pss.initialize();
            x_st = [delta; 0; E; 0; 0; x_avr; x_pss; x_gov];
            u_st = [u_avr;u_pss;u_gov];
        end
    end
end


