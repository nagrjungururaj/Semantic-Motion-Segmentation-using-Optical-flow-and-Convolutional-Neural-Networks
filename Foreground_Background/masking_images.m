images = imageSet('path_containing_images');
for i = 1:images.Count
    I = read(images,i);
    imageSegmenter(I);
    pause(20);            % give suitable time in secs to pause the tool
    imwrite(maskedImage,strcat('path/img',num2str(i),'.jpg'));
    clear maskedImage;
    imageSegmenter close;
end
