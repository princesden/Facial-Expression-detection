
     %% AUTHOR    :  Alex, Sona, Princewill Eneh
     %% $DATE     : 11-Now-2014
     %% $Revision : 1.00 
     %% Project   : Facial expression recognition
     %% FILENAME  : fExpressions.m
     %%
      
     
%%****************FACE DETECTION**************%%
clear all
clc
%Detect objects using Viola-Jones Algorithm

%To detect Face
FDetect = vision.CascadeObjectDetector;

%Read the input image
I = imread('4383782195_d0cf891244_b.jpg');

%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);

figure,imshow(I); 
rectangle('Position',BB,'LineWidth',5,'LineStyle','-','EdgeColor','r');
title('Face Detection');

%%*************NOSE DETECTION***************%%

%To detect Nose
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',64);

BB=step(NoseDetect,I);

figure,
imshow(I); 
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','b');
end
title('Nose Detection');
hold off;


%%*************MOUTH DETECTION***************%%

%To detect Mouth
MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',64);

BB=step(MouthDetect,I);

figure,imshow(I);

rectangle('Position',BB,'LineWidth',4,'LineStyle','-','EdgeColor','r');
title('Mouth Detection');

Mouth=imcrop(I,BB);
imshow(Mouth);



%%*************EYE DETECTION***************%%

%To detect Eyes
EyeDetect = vision.CascadeObjectDetector('EyePairBig','MergeThreshold',16);

BB=step(EyeDetect,I);

figure,imshow(I);
rectangle('Position',BB,'LineWidth',4,'LineStyle','-','EdgeColor','g');
title('Eyes Detection');


