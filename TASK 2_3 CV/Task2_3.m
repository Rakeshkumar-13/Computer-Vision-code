clc
clear all
close all

image = imread('ImgPIA.jpg');
image = rgb2gray(image);

%i used glrlm toolbox in determining the features of the GLRLM

%bit_depth = 2

bit_depth = 2;
mask = ones(size(image(:,:,1)));

[SRE1,LRE1,GLN1,RP1,RLN1,LGRE1,HGRE1] = glrlm(image,bit_depth,mask);
y = [SRE1 LRE1 GLN1 RP1 RLN1 LGRE1 HGRE1];
x = categorical({'SRE1','LRE1','GLN1','RP1' ...
    , 'RLN1', 'LGRE1', 'HGRE1'});
x = reordercats(x,{'SRE1','LRE1','GLN1','RP1', 'RLN1', 'LGRE1', 'HGRE1'});
subplot(2,3,1)
bar(x,y)
title('Bit_depth at 2')


%bit_depth = 4

bit_depth = 4;
mask = ones(size(image(:,:,1)));

[SRE1,LRE1,GLN1,RP1,RLN1,LGRE1,HGRE1] = glrlm(image,bit_depth,mask);
y = [SRE1 LRE1 GLN1 RP1 RLN1 LGRE1 HGRE1];
x = categorical({'SRE1','LRE1','GLN1','RP1' ...
    , 'RLN1', 'LGRE1', 'HGRE1'});
x = reordercats(x,{'SRE1','LRE1','GLN1','RP1', 'RLN1', 'LGRE1', 'HGRE1'});
subplot(2,3,2)
bar(x,y)
title('Bit_depth at 4')

%bit_depth = 6

bit_depth = 6

[SRE1,LRE1,GLN1,RP1,RLN1,LGRE1,HGRE1] = glrlm(image,bit_depth,mask);
y = [SRE1 LRE1 GLN1 RP1 RLN1 LGRE1 HGRE1];
x = categorical({'SRE1','LRE1','GLN1','RP1' ...
    , 'RLN1', 'LGRE1', 'HGRE1'});
x = reordercats(x,{'SRE1','LRE1','GLN1','RP1', 'RLN1', 'LGRE1', 'HGRE1'});
subplot(2,3,3)
bar(x,y)
title('Bit_depth at 6')

%bit_depth = 8

bit_depth = 8;

[SRE1,LRE1,GLN1,RP1,RLN1,LGRE1,HGRE1] = glrlm(image,bit_depth,mask);
y = [SRE1 LRE1 GLN1 RP1 RLN1 LGRE1 HGRE1];
x = categorical({'SRE1','LRE1','GLN1','RP1' ...
    , 'RLN1', 'LGRE1', 'HGRE1'});
x = reordercats(x,{'SRE1','LRE1','GLN1','RP1', 'RLN1', 'LGRE1', 'HGRE1'});
subplot(2,3,4)
bar(x,y)
title('Bit_depth at 8')
