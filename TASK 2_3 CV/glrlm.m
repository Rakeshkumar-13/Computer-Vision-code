function [SRE1,LRE1,GLN1,RP1,RLN1,LGRE1,HGRE1]  = glrlm(image,quantize,mask)

% output: texture features
%
%    1. SHORT RUN EMPHASIS (SRE) 
%    2. LONG RUN EMPHASIS(LRE)
%    3. GRAY LEVEL NON-UNIFORMITY (GLN)
%    4. RUN PERCENTAGE (RP)
%    5. RUN LENGTH NON-UNIFORMITY (RLN)
%    6. LOW GRAY LEVEL RUN EMPHASIS (LGRE)
%    7. HIGH GRAY LEVEL RUN EMPHASIS (HGRE)
%

% (c) Wout Oude Elferink, 13-5-2015
% University Of Twente, The Netherlands

% if color => make gray scale
if size(image,3)>1
   image = im2gray(image); 
end

image = im2double(image); % to double

% crop the image to the mask bounds for faster processing
stat = regionprops(mask,'BoundingBox');
ax = int16(floor(stat.BoundingBox)) + int16(floor(stat.BoundingBox)==0);
image = image(ax(2):ax(2)+ax(4)-1,ax(1):ax(1)+ax(3)-1);
mask = mask(ax(2):ax(2)+ax(4)-1,ax(1):ax(1)+ax(3)-1);

% adjust range
mini = min(image(:));   % find minimum
image = image-mini;       % let the range start at 0
maxi = max(image(:));   % find maximum

% quantize the image to discrete integer values in the range 1:quantize
level = maxi/quantize:maxi/quantize:maxi-maxi/quantize;
image = imquantize(image,level);

% apply the mask
image(~mask) = 0;

% initialize glrlm: p(i,j)
% -  i the amount of bin value (quantization levels)
% -   j the max run len. 
% -  four diff orientation are used (0 degree, 45 degree, 90 degree and 135 degrees)
p0_degree = zeros(quantize,max(size(image)));
p45_degree = zeros(quantize,max(size(image)));
p90_degree = zeros(quantize,max(size(image)));
p135_degree = zeros(quantize,max(size(image)));

% initializing the maximum value for j
maximage = max(size(image));

% adding zeros to the borders
image = padarray(image,[1 1]);

% initializing the rotation
image45 = imrotate(image,45);

% finding the run length for every quantization level
for i = 1:quantize
    % finding the pixels that are corresponding to the quantization level
    BW = int8(image == i);
    BWr = int8(image45 == i);    
    
    % finding the start point and end points of the run length
    Gr0e = (BW(2:end-1,2:end-1) - BW(2:end-1,3:end)) == 1;
    Gr0s = (BW(2:end-1,2:end-1) - BW(2:end-1,1:end-2)) == 1;
    Gr45e = (BWr(2:end-1,2:end-1) - BWr(2:end-1,3:end)) == 1;
    Gr45s = (BWr(2:end-1,2:end-1) - BWr(2:end-1,1:end-2)) == 1;
    Gr90e = (BW(2:end-1,2:end-1) - BW(3:end,2:end-1)) == 1;
    Gr90s = (BW(2:end-1,2:end-1) - BW(1:end-2,2:end-1)) == 1;
    Gr135e = (BWr(2:end-1,2:end-1) - BWr(3:end,2:end-1)) == 1;
    Gr135s = (BWr(2:end-1,2:end-1) - BWr(1:end-2,2:end-1)) == 1;
    
    % finding the indexes
    Gr0s = Gr0s'; Gr0s = find(Gr0s(:));
    Gr0e = Gr0e'; Gr0e = find(Gr0e(:));
    Gr45s = Gr45s'; Gr45s = find(Gr45s(:));
    Gr45e = Gr45e'; Gr45e = find(Gr45e(:));
    Gr90s = find(Gr90s(:));
    Gr90e = find(Gr90e(:));
    Gr135s = find(Gr135s(:));
    Gr135e = find(Gr135e(:));
 
    % finding the lengths
    length_0 = Gr0e - Gr0s + 1;
    length_45 = Gr45e - Gr45s + 1;
    length_90 = Gr90e - Gr90s + 1;
    length_135 = Gr135e - Gr135s + 1;
    
    % filling the matrix
    p0_degree(i,:) = hist(length_0,1:maximage);
    p45_degree(i,:) = hist(length_45,1:maximage);
    p90_degree(i,:) = hist(length_90,1:maximage);
    p135_degree(i,:) = hist(length_135,1:maximage);    
end

% adding all orientations
pos = p0_degree + p45_degree + p90_degree + p135_degree;

% calculating the features
totalSum = sum(pos(:));
SRE1 = sum(sum(pos,1) ./ ((1:maximage).^2)) / totalSum;
LRE1 = sum(sum(pos,1) .* ((1:maximage).^2)) / totalSum;
RLN1 = sum(sum(pos,1) .^2) / totalSum;
RP1 = totalSum / sum(mask(:));
GLN1 = sum(sum(pos,2) .^2) / totalSum;
LGRE1 = sum(sum(pos,2) .* ((1:quantize)'.^2)) / totalSum;
HGRE1 = sum(sum(pos,2) .^2) / totalSum;
end




    