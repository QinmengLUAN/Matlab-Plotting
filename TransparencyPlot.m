%% Plot Pics with transparent background
% f4 = figure;
% clf;
% gB = grains.boundary
% plot(gB,'edgecolor','k','linewidth',.5)
% saveas(f4,[pname '\\','1A_GBs'],'png')
I = imread([pname '\\','1A_GBs.png'])
G=rgb2gray(I);  %Grey  
ima=imadjust(G);    %set the image to matrix 
bw=im2bw(ima);  %set the bitwidth:0.5  
% figure,imshow(bw)  
  
level=graythresh(G);    %find the range
bw2=im2bw(ima,level);     
% figure,imshow(bw2)  
  
bw3=~bw2;   %  
bw4 =bwareaopen(bw3, 20);  
%bw4=imfill(~bw4,'hole');  
% figure,imshow(bw4)  
  
bw5=~bw4;  
R=I(:,:,1);%choose value from the matrix 
G=I(:,:,2);  
B=I(:,:,3);  
  
% %Word colour  %set the word (value 0) to red
% R(~bw5)=255;     
% G(~bw5)=0;        
% B(~bw5)=0;  
%set the word (value 0) to black
R(~bw5)=0;     
G(~bw5)=0;        
B(~bw5)=0;  
%Background colour %set the background (value = 1) to white
R(bw5)=255;  
G(bw5)=255;  
B(bw5)=255;  
rgb=cat(3,R,G,B);   %make the matrix, 3 is the dimension  
% figure,imshow(rgb)  
  
%Transparency  
siz=size(I);  
alpha=ones(siz(1),siz(2));  
alpha(B==255)=0;    %set the background (value = 0) to transparent  
imwrite(rgb,[pname '\\','1A_GBs_Transparent.png'],'Alpha',alpha) 
