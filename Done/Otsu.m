%rgb转化为HSI
%大律法，最大阈值分割Otsu
%马俊辉
f=imread('C:\Users\junma\Desktop\tmp\artificial(1)\sea\b.jpg');
%原图
subplot(3,5,1)
imshow(f)
% OriImage=imread('lena.jpg');
%高斯滤波
sigma = 3;
grayImg=rgb2gray(f);
gausFilter = fspecial('gaussian',[1 5],sigma);%创建高斯滤波算子
blur=imfilter(grayImg,gausFilter,'replicate'); %进行滤波
subplot(3,5,11)
imshow(blur)
%调用函数
addpath('E:\Doc\Code\Matlab\tools');
[hsi,H,S,I]=rgb2hsi(f)
%hsi
subplot(3,5,2)
imshow(hsi)
%H
subplot(3,5,3)
imshow(H)
%s
subplot(3,5,4)
imshow(S)
%i
subplot(3,5,5)
imshow(I)

subplot(3,5,6);
Y=rgb2gray(f);
imhist(Y);title('原图直方图');
ylim('auto')

%H的直方图和分割
subplot(3,5,8);imhist(H);title('H直方图');ylim('auto')
level=graythresh(H);
g_h=im2bw(H,level);%最佳阈值level
subplot(3,5,13);imshow(g_h);title('阈值分割');
%在Command窗口输出灰度阈值
disp(strcat('graythresh 计算灰度阈值：',num2str(uint8(level*255))))

%S的直方图和分割
subplot(3,5,9);ylim('auto');imhist(S);title('S直方图');ylim('auto')
level=graythresh(S);
g_s=im2bw(S,level);%最佳阈值level
subplot(3,5,14);imshow(g_s);title('阈值分割');
%在Command窗口输出灰度阈值
disp(strcat('s graythresh 计算灰度阈值：',num2str(uint8(level*255))))

%I的直方图和分割
subplot(3,5,10);ylim('auto');imhist(I);title('I直方图');ylim('auto')
level=graythresh(I);
g_i=im2bw(I,level);%最佳阈值level
subplot(3,5,15);imshow(g_i);title('阈值分割');
%在Command窗口输出灰度阈值
disp(strcat('i graythresh 计算灰度阈值：',num2str(uint8(level*255))))
