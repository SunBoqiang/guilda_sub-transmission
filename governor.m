classdef governor < handle
    
    properties
        P
        sys
    end
    
    methods
        function obj = governor()
            sys = ss(eye(2));
            sys.InputGroup.omega_governor = 1;
            sys.InputGroup.u_governor = 2;
            sys.OutputGroup.omega_governor = 1;
            sys.OutputGroup.Pmech = 2;
            obj.sys = sys;
        end
        
        function x = initialize(obj, P)
            obj.P = P;
            x = [];
        end
        
        function nx = get_nx(obj)
            nx = 0;
        end
        
        function [dx, P] = get_P(obj, x_gov, omega, u)
            P = obj.P + u;
            dx = [];
        end
        
        function sys = get_sys(obj)
            sys = obj.sys;
        end
    end
end

