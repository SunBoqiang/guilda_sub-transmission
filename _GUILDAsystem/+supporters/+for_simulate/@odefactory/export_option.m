% オプション設定を出力するためのメソッド
function option = export_option(obj) 
    option = struct(...
        'linear', obj.network.linear           ,...
        'fault' , obj.fault.export_option      ,...
        'input' , obj.input.export_option      ,...
        ...% 'V0'    , obj.initial.V0               ,...
        ...% 'I0'    , obj.initial.I0               ,...
        ...% 'x0_sys', obj.initial.sys              ,...
        ...% 'x0_con_local' , obj.initial.con_local ,...
        ...% 'x0_con_global', obj.initial.con_global,...
        ...% 'parallel_component' , popt.mac        ,...
        ...% 'parallel_branch'    , popt.baranch    ,...
        ...% 'parallel_con_local' , popt.con_local  ,...
        ...% 'parallel_con_global', popt.con_global ,...
        ...%'grid_code'   , obj.gridcode.mode      ,...
        ...%'OutputFcn'   , obj.response.mode      ,...
        ...%'report'      , obj.progress.mode      ,...
        'reset_time'   , obj.progress.time_limit,...
        'tools_readme' , obj.readme             ,...
        'do_retry'     , obj.do_retry           ,...
        'AbsTol'       , obj.odeoptions.AbsTol  ,...
        'RelTol'       , obj.odeoptions.RelTol  ,...
        'MaxOrder'     , obj.odeoptions.MaxOrder,...
        'sampling_time', obj.sampling_time       ...
        );
end