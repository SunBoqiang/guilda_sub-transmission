%% IEEE14bus systrem is expanded to 20 bus model!

function net = IEEE14bus_expanded()
    fname = mfilename("fullpath");
    fn = fullfile(fname);
    net = network.build(fn);
end