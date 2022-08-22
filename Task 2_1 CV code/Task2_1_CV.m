clear all
clc
Img = imread('ImgPIA.jpg');
figure;
imshow(Img);
Img = rgb2gray(Img);
title('our ImgPIA image')

%transform the loaded image
B = fft2(Img,256,256);
figure;
imshow(B)

% Segmenting the loaded image INTO four different SECTION 
I = Img;
b1=I(1:size(I,1)/2,1:size(I,2)/2,:);subplot(2,2,1);imshow(b1);
subplot(2,2,1);
title('figure-1')
b2=I(size(I,1)/2+1:size(I,1),1:size(I,2)/2,:);subplot(2,2,2);imshow(b2);
subplot(2,2,2);
title('figure-2')
b3=I(1:size(I,1)/2,size(I,2)/2+1:size(I,2),:);subplot(2,2,3);imshow(b3);
subplot(2,2,3);
title('figure-3')
b4=I(size(I,1)/2+1:size(I,1),size(I,2)/2+1:size(I,2),:);subplot(2,2,4);imshow(b4);
subplot(2,2,4);
title('figure-4')

% by fourier transform 
B = fft2(Img,256,256);
figure;
imshow(B);
B = fftshift(B); % applying discrete fourier transform function for the four sections
figure;
imshow(B);

% Measure the minimum and maximum values of transform amplitudes.
min(min(abs(B)))
max(max(abs(B)))
figure;
imshow(abs(B),[0 100]); colormap(jet); colorbar
figure;
imshow(log(1+abs(B)),[0,3]); colormap(jet); colorbar
% Look the phases
figure;
imshow(angle(B),[-pi,pi]); colormap(jet); colorbar

%applying inverse of fourier transform
I = ifft2(B,256,256);
figure;
imshow(I);

% apply the fourier with inverse function together
B = fft2(Img,256,256);
figure;
imshow(B);
B = fftshift(B); % applying discrete fourier transform function for four sections
figure;
imshow(B);

% Measure the min and max value of the transform amplitude.
min(min(abs(B)))
max(max(abs(B)))
figure;
imshow(abs(B),[0 100]); colormap(jet); colorbar
figure;
imshow(log(1+abs(B)),[0,3]); colormap(jet); colorbar
% Looking for phases
figure;
imshow(angle(B),[-pi,pi]); colormap(jet); colorbar

B = fft2(Img,256,256);
figure;
imshow(B);

I = ifft2(B,256,256);
figure;
imshow(I);

% TASK 2 part 1:  selecting the features for both radius and direction
% as described in the Spectral Approach session from the Feature Extraction
%notes.

figure;
imshow(Img);
figure;
%%offset value 1,3,5,7
%  offset = 1
offset_val = [0 1];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,1);imshow(co_occurmatrix); 
title('Angle of degree = 0 degree, offset = 1')

offset_val = [-1 1];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,2);imshow(co_occurmatrix);
title('Angle of degree = 45 degree, offset = 1')

offset_val = [-1 0];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,3);imshow(co_occurmatrix);
title('Angle of degree = 90 degree, offset = 1')

offset_val = [-1 -1];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,4);imshow(co_occurmatrix);
title('Angle of degree = 135 degree, offset = 1')


figure;
% offset =3
offset_val = [0 3];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,1);imshow(co_occurmatrix); 
title('Angle of degree = 0 degree, offset = 3')

offset_val = [-3 3];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,2);imshow(co_occurmatrix);
title('Angle of degree = 45 degree, offset = 3')

offset_val = [-3 0];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,3);imshow(co_occurmatrix);
title('Angle of degree = 90 degree, offset = 3')

offset_val = [-3 -3];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,4);imshow(co_occurmatrix);
title('Angle of degree = 135 degree, offset = 3')

figure;
% offset =5
offset_val = [0 5];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,1);imshow(co_occurmatrix); 
title('Angle of degree = 0 degree, offset = 5')

offset_val = [-5 5];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,2);imshow(co_occurmatrix);
title('Angle of degree = 45 degree, offset = 5')

offset_val = [-5 0];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,3);imshow(co_occurmatrix);
title('Angle of degree = 90 degree, offset = 5')

offset_val = [-5 -5];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,4);imshow(co_occurmatrix);
title('Angle of degree = 135 degree, offset = 5')


figure;
% offset =7
offset_val = [0 7];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,1);imshow(co_occurmatrix); 
title('Angle of degree = 0 degree, offset = 7')

offset_val = [-7 7];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,2);imshow(co_occurmatrix);
title('Angle of degree = 45 degree, offset = 7')

offset_val = [-7 0];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,3);imshow(co_occurmatrix);
title('Angle of degree = 90 degree, offset = 7')

offset_val = [-7 -7];
co_occurmatrix = graycomatrix(Img, 'offset', offset_val,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,4);imshow(co_occurmatrix);
title('Angle of degree = 135 degree, offset = 7')


% plot values = ["Angle of Degree";"Offset_1";"Offset_2";"Offset_3";"Offset_4"];

Angle_of_Degree = [0;45;90;135];
Offset_1 = [0 1; -1 1; -1 0; -1 -1];
Offset_3 = [0 3; -3 3; -3 0; -3 -3];
Offset_5 = [0 5; -5 5; -5 0; -5 -5];
Offset_7 = [0 7; -7 7; -7 0; -7 -7];
%T = table("Angle_of_Degree";"Offset_1";"Offset_3";"Offset_5";"Offset_7")
T = table(Angle_of_Degree,Offset_1,Offset_3,Offset_5, Offset_7)