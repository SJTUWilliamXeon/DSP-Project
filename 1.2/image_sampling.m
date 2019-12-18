%%DSP1.2 
I = imread('rashford.jpg'); 
I = rgb2gray(I); 
figure(1); 
imagesc(I); 
title('原图像'); 
% 图像降采样 
 figure; 
for ii = 2:2:8 
 Idown = dsample(I,ii); 
 subplot(2,2,ii/2); 
 imagesc(Idown); 
 str = ['downsample at N = ' num2str(ii)]; 
 title(str); 
end 
% 图像升采样 
 figure; 
for ii = 2:2:8 
 Iup =usample(I,ii); 
 subplot(2,2,ii/2); 
 imagesc(abs(Iup)); 
 str = ['upsample at N = ' num2str(ii)]; 
 title(str); 
end