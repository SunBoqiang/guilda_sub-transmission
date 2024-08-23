classdef PV_2comp < bus
% モデル  ：PV母線（発電機と負荷が接続されている母線）
%親クラス：busクラス
%実行方法：obj = bus.PV(P, V, shunt)
%　引数　：・　Pg　：発電機の有効電力Pの潮流設定値
%　　　　　・　PQload　：負荷の有効電力Plと無効電力Qlの潮流設定値
%　　　　　・　V　：電圧の絶対値|V|の潮流設定値
%　　　　　・　shunt　：母線とグラウンドの間のアドミタンスの値
%　出力　：busクラスのインスタンス
    
    properties(SetAccess = protected)
        Vabs
        P
        Pload
        Qload
    end
    
    methods
        function obj = PV_2comp(Pg, V, PQload, shunt)
            % PQload = [Pload, Qload];

            obj@bus(shunt);
            obj.Vabs = V;
            
            obj.Pload = PQload(1);
            obj.Qload = PQload(2);

            obj.P = Pg+PQload(1);%P -> Pg-Pl
            obj.set_component(component.empty());
        end
        
        function out = get_constraint(obj, Vr, Vi, P, Q)
            Vabs = norm([Vr; Vi]); %#ok
            out = [Vabs-obj.Vabs; P-obj.P]; %#ok
        end

        function set_P(obj,P)
            obj.P = P;
            obj.editted("P")
        end
        
        function set_Vabs(obj,Vabs)
            obj.Vabs = Vabs;
            obj.editted("Vabs")
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

