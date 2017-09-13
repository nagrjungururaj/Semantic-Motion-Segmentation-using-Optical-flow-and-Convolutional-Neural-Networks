clc;
clear all;

% dataset images
files = dir(fullfile('path_containing_images', '*.jpg'));
filenames = {files(:).name}; % All the images are now in a cell array
% groundtruth
% files1 = dir(fullfile('/cdtemp/nagarjun/DAVIS_train/Annotations/480p/bear', '*.png'));
% filenames1 = {files1(:).name}; % All the images are now in a cell array
        
%% Visualization of scores from getScoresSemantic.m

N=21;
cmap = zeros(N,3);
for i=1:N
  id = i-1; r=0;g=0;b=0;
  for j=0:7
    r = bitor(r, bitshift(bitget(id,1),7 - j));
    g = bitor(g, bitshift(bitget(id,2),7 - j));
    b = bitor(b, bitshift(bitget(id,3),7 - j));
    id = bitshift(id,-3);
  end
  cmap(i,1)=r; cmap(i,2)=g; cmap(i,3)=b;
end
%cmap = (cmap/255) * 255;
cmap = cmap / 255;



for i =1:numel(filenames)
%     for k = 1:numel(filenames1)
%     im = imread(fullfile('/cdtemp/nagarjun/DAVIS_train/Annotations/480p/bear',filenames1{k}));

    img = imread(fullfile('path_containing_images', filenames{i}));
    [~, imgname, ~] = fileparts(filenames{i});
    outfilepathname = fullfile('path_of_folder_to_store_scores', [imgname, '.mat']);
    load(outfilepathname, 'scores');
    [~, predicted_labels] = max(scores, [], 3);
        
%         subplot(2,2,1)
%         image(uint8(im-1));
%         axis image;
%         title('GroundTruth');
        
%         subplot(2,2,1)
%         image(uintcd mat8(img-1));
%         axis image;
%         title('training images');

%         subplot(2,2,2)
        h=figure;
        imagesc(uint8(predicted_labels-1)) ;
        set(gca,'XTick',[]) % Remove the ticks in the x axis!
        set(gca,'YTick',[]) % Remove the ticks in the y axis
        set(gca,'Position',[0 0 1 1])
        %axis image ;
        %title('Semantic Segmentation') ;
        %colormap(cmap);
        %freezeColors
        saveas(h,sprintf('path_of_folder_to_store_semantic_segments/img_%d.jpg',i));
        %imwrite(uint8(predicted_labels-1),['/cdtemp/nagarjun/DAVIS_train/JPEGImages/480p/bear_segments/','bear' ,num2str(i),'.jpg'])
        drawnow;
        %pause(1);
        
%         subplot(2,2,3)
%         image(uint8(predicted_labels-1) - (uint8(im-1)));
%         axis image;
%         title('Error');
%     end
end
