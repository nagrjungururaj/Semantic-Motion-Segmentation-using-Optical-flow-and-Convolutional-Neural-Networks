clc;
clear all;

imageSetVector = imageSet('root_folder_path_containing_subfolders_of_images','recursive');
siz = size(imageSetVector);

for i = 1:siz(:,2)
    
    imgfolder = imageSetVector(1,i);
    newfolder = imgfolder.Description;
    path = fullfile('path_to_save_subfolders_of_OF-orientations',newfolder);
   
        for j = 1:(imgfolder.Count-1)
            
            img1 = read(imgfolder,j);
            img2 = read(imgfolder,j+1);
            uv = estimate_flow_interface(img1,img2,'classic+nl-fast');   % code from Black et.al
            or = atan(uv(:,:,2) ./ uv(:,:,1));    % OF orientation
            filename = sprintf('%d.jpg',j);
            imagesc(or);
            set(gca,'XTick',[]);
            set(gca,'YTick',[]);
            set(gca,'Position',[0 0 1 1]);
            saveas(gcf,fullfile(path,filename),'jpg');         
        end        
end
