close all
clc
%loading the skin lesion dataset of org images and GroundTruth images
Image_folder = dir('org data\*.jpg');
GTImage_folder=dir('GT\*.png');
for i=1:numel(Image_folder)
    file_Image = Image_folder(i);
    file_name = fullfile(file_Image.folder, file_Image.name);
    Image_segment = GTImage_folder(i);
    
    disp(file_name);
    fileseg=fullfile(Image_segment.folder,Image_segment.name);
    segment_images=imread(fileseg);
    Segmented_images=logical(segment_images);
    I = imread(file_name);
    Grayscale_images=rgb2gray(I)
    
    Binary_img= im2bw(Grayscale_images)
    complimenting_images=imcomplement(Binary_img)

    imshow(complimenting_images)
    impixelinfo
    imwrite(complimenting_images,file_Image.name)
    k(i)=dice(complimenting_images,Segmented_images)
end

mean_value_of_skin_lesion_images=mean(k)
standard_deviation_of_skin_lesion_images=std(k)
bar(k)
Image_folder = Image_folder(~[Image_folder.isdir]);
Image_folder = {Image_folder.name}
dice_score1= categorical(Image_folder);
dice_similarity_score= categorical(k(i))
bar(dice_score1,k())
xlabel('Segmented Images')
ylabel('Dice scores of Segmented Images')