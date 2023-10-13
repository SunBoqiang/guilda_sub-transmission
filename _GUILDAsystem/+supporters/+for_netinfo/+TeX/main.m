function main(net,data)
    if nargin<2
        data = net.information('do_report',false);
    end
    path = uigetdir;
    time_text = datestr(datetime('now'),'yyyy_mm_dd_HH_MM_ss');
    subpath = [path,'/Texfile',time_text];
    mkdir(subpath)
    mkdir([subpath,'/data'])

    copyfile([pwd,'/+tools/+make_tex_data/tex_template/main.tex'],subpath)
    copyfile([pwd,'/+tools/+make_tex_data/tex_template/latexmkrc'],subpath)

    saveas(data.graph.GCF,[subpath,'/data/network_graph'],'epsc')
    
    text_data = tools.make_tex_data.get_component_dynamics(net);
    writelines(text_data,[subpath,'/data/component_dynamics.txt'])

    text_data = tools.make_tex_data.table2tex(data.bus);
    writelines(text_data,[subpath,'/data/bus.txt'])

    text_data = tools.make_tex_data.table2tex(data.branch);
    writelines(text_data,[subpath,'/data/brnch.txt'])

    text_data = tools.make_tex_data.struct2text(data.component_para);
    writelines(text_data,[subpath,'/data/component_parameter.txt'])

    text_data = tools.make_tex_data.struct2text(data.x_equilibrium);
    writelines(text_data,[subpath,'/data/component_equilibrium.txt'])

    zip([path,'/GUILDAreport',time_text,'.zip'],subpath)
    
    rmdir(subpath,'s')
end



