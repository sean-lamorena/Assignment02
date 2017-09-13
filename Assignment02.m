clear all; close all; clc;

StartingFrame =1;
EndingFrame = 489;

Xcentroidblue = [];
Ycentroidblue = [];

Xcentroidgreen = [];
Ycentroidgreen = [];

for k = StartingFrame : EndingFrame-1
 
rgb = imread(['balls/img',sprintf('%2.3d',k),'.jpg']);
BWblue = createMask(rgb);
BWgreen = createMaskGreen(rgb);

SE = strel('disk',2,8);            
BW1 = imopen(BWblue,SE);
BW2 = imopen(BWgreen,SE);
          
[labelsblue,numberblue] = bwlabel(BWblue,8); 

if numberblue > 0
    
Istatsblue = regionprops(labelsblue,'basic','Centroid'); 
[valuesblue, indexblue] = sort([Istatsblue.Area],'descend');
[maxValblue,maxIndexblue] = max([Istatsblue.Area]); 

 Xcentroidblue = [Xcentroidblue Istatsblue(maxIndexblue).Centroid(1)];
 Ycentroidblue = [Ycentroidblue Istatsblue(maxIndexblue).Centroid(2)];
 
end
[labelsgreen,numbergreen] = bwlabel(BWgreen,8);
if numbergreen > 0
    
Istatsgreen = regionprops(labelsgreen,'basic','Centroid'); 
[valuesgreen, indexgreen] = sort([Istatsgreen.Area],'descend');
[maxValgreen,maxIndexgreen] = max([Istatsgreen.Area]); 

 Xcentroidgreen = [Xcentroidgreen Istatsgreen(maxIndexgreen).Centroid(1)];
 Ycentroidgreen = [Ycentroidgreen Istatsgreen(maxIndexgreen).Centroid(2)];
 
end
end
 
close all;
rgb = imread('balls/img001.jpg');
imshow(rgb);
hold on; 
scatter(Xcentroidblue,Ycentroidblue);
scatter(Xcentroidgreen,Ycentroidgreen);
 
 