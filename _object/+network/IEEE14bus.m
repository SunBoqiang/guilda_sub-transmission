%% IEEE14bus systrem

function net = IEEE14bus()
    fname = mfilename("fullpath");
    fn = fullfile(fname);
    net = network.build(fn);
end