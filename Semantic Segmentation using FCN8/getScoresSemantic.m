clc;
clear all;
DATA_DIR = 'path_to_image_folder';
NET_DIR = 'path_to_the_network';
SCORE_DIR = 'path_to_folder_to_store_scores';

files = dir(fullfile(DATA_DIR, '*.jpg'));
filenames = {files(:).name}; % All the images are now in a cell array

%% Load the network and setup normalization functions for input images

net = load(fullfile(NET_DIR, 'pascal-fcn8s-dag.mat'));  % pre-trained FCN8
net = dagnn.DagNN.loadobj(net);
% net.move('gpu');  Move the network to GPU #GPU 

normalize_fn = @(x) bsxfun(@minus, single(x), net.meta.normalization.averageImage);

%% Run through the images and save the semantic class scores

ts = tic;
for i=1:numel(filenames)
    if(toc(ts) > 1)
        fprintf(1, 'image %d/%d\n', i, numel(filenames));
        ts = tic;
    end
    % Read the image and normalize it
    img = imread(fullfile(DATA_DIR, filenames{i}));
    img_normalized = normalize_fn(img);
    
    % Use the net to evaluate the image and extract the variable value for 
    % score
    % net.eval({'data', img_normalized}); 
    %net.eval({'data', gpuArray(img_normalized)});  #GPU
    net.eval({'data', img_normalized});
    scores = gather(net.vars(net.getVarIndex('upscore')).value);
    % The variable name is not always upscore. You'll need to look at the
    % network using net.print and figure out which variable you want.
    
    % Form the output filename and save it in a mat file
    [~, imgname, ~] = fileparts(filenames{i});
    outfilepathname = fullfile(SCORE_DIR, [imgname, '.mat']);
    save(outfilepathname, 'scores');
    
end
