classdef PQ < bus
% モデル  ：PQ母線
%親クラス：busクラス
%実行方法：obj = bus.PQ(P, Q, shunt)
%　引数　：・　P　：有効電力Pの潮流設定値
%　　　　　・　Q　：無効電力Qの潮流設定値
%　　　　　・　shunt　：母線とグラウンドの間のアドミタンスの値
%　出力　：busクラスのインスタンス
    
    properties(SetAccess=protected)
        P
        Q
    end
    
    methods
        function obj = PQ(P, Q, shunt)
            obj@bus(shunt);
            obj.P = P;
            obj.Q = Q;
            obj.set_component(component.empty());
        end
        
        function out = get_constraint(obj, Vr, Vi, P, Q)
            Q_shunt = complex(Vr,Vi).*complex(Vr,Vi).*obj.shunt;
            out = [P-obj.P; Q-obj.Q - abs(Q_shunt)]; %add a constraint for Q which is produced by shunt
            disp(out)
        end

        function set_P(obj,P)
            obj.P = P;
            obj.editted("P")
        end

        function set_Q(obj,Q)
            obj.Q = Q;
            obj.editted("Q")
        end
    end
    methods(Access=protected)
        function PropEditor_Set(obj,prop,val)
            obj.(prop) = val;
        end
        function val = PropEditor_Get(obj,prop)
            val = obj.(prop);
        end
    end
end

