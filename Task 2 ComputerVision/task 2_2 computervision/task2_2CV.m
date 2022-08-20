close all
clc

a = imread('ImgPIA(1).jpg');
figure;
b=imhist(a);
imshow(a);
a = rgb2gray(a);
title('our ImgPIA image')

gray_lvl_co_occurence_matrix_0_s = graycomatrix(a, 'offset', [0 1],'NumLevels', 256, 'Symmetric', true);
statistics_0_s = graycoprops(gray_lvl_co_occurence_matrix_0_s,{'contrast','correlation','energy','homogeneity'});
Angsecondmomnt0deg = Angularsecondmomentum(gray_lvl_co_occurence_matrix_0_s);
invdiffmomnt0deg = inversedifferencemoment(gray_lvl_co_occurence_matrix_0_s);
figure;
subplot(2,2,1);
imshow(gray_lvl_co_occurence_matrix_0_s);
title('deg= 0 , gray_level_co_occurence_matrix_ 0 _ s _ offset[0 1]')

gray_lvl_co_occurence_matrix_45_s = graycomatrix(a, 'offset', [-1 1],'NumLevels', 256, 'Symmetric', true);
statistics_45_s = graycoprops(gray_lvl_co_occurence_matrix_45_s,{'contrast','correlation','energy','homogeneity'});
Angsecondmomnt45deg = Angularsecondmomentum(gray_lvl_co_occurence_matrix_45_s);
invdiffmomnt45deg = inversedifferencemoment(gray_lvl_co_occurence_matrix_45_s);
figure;
subplot(2,2,2);
imshow(gray_lvl_co_occurence_matrix_45_s);
title('deg= 45 , gray_level_co_occurence_matrix_ 0 _ s _ offset[-1 1]')

gray_lvl_co_occurence_matrix_90_s = graycomatrix(a, 'offset', [-1 0],'NumLevels', 256, 'Symmetric', true);
statistics_90_s = graycoprops(gray_lvl_co_occurence_matrix_90_s,{'contrast','correlation','energy','homogeneity'});
Angsecondmomnt90deg = Angularsecondmomentum(gray_lvl_co_occurence_matrix_90_s);
invdiffmomnt90deg = inversedifferencemoment(gray_lvl_co_occurence_matrix_90_s);
figure;
subplot(2,2,3);
imshow(gray_lvl_co_occurence_matrix_90_s);
title('deg= 90 , gray_level_co_occurence_matrix_ 0 _ s _ offset[-1 0]')

gray_lvl_co_occurence_matrix_135_s = graycomatrix(a, 'offset', [-1 -1],'NumLevels', 256, 'Symmetric', true);
statistics_135_s = graycoprops(gray_lvl_co_occurence_matrix_135_s,{'contrast','correlation','energy','homogeneity'});
Angsecondmomnt135deg = Angularsecondmomentum(gray_lvl_co_occurence_matrix_135_s);
invdiffmomnt135deg = inversedifferencemoment(gray_lvl_co_occurence_matrix_135_s);
figure;
subplot(2,2,3);
imshow(gray_lvl_co_occurence_matrix_135_s);
title('deg= 135 , gray_level_co_occurence_matrix_ 0 _ s _ offset[-1 -1]')