%matlab
%马俊辉
clear all; close all;
dbstop if error;
% dbstop if error;
img=imread('C:\Users\junma\Desktop\tmp\images\e.tif');
subplot(3,5,1);
imshow(img);title('原图');

% 转化为hsi
addpath('E:\Doc\Code\Matlab\tools','E:\Doc\Code\Matlab\project\function');
[hsi,H,S,I]=rgb2hsi(img);

%HSI
subplot(3,5,6);
imshow(hsi),title('hsi');

% 找到H的峰值
subplot(3,5,2);
imshow(H);title('H分量');
%R的折线图-32level
[count_H,x_H]=imhist(H,32);
% 初始化gray_level
[x_H]=init_int(x_H);
subplot(3,5,3);
plot(x_H,count_H);title('H的折线图');
%调用函数，实现寻找峰值
[H_left,H_right]=findInit(x_H,count_H);

%显示初步截取的部分（50%）
subplot(3,5,4);
H_left=H_left/32;
H_right=H_right/32;
% s=
imshow(H,[H_left,H_right]);title('H分量初步分割');

% S
subplot(3,5,7);
imshow(S);title('S分量');
% S的折线图
[count_S,x_S]=imhist(S,32);
% 初始化gray_level
[x_S]=init_int(x_S);
subplot(3,5,8);
plot(x_S,count_S);title('S的折线图');
 %调用函数，实现寻找峰值
[S_left,S_right]=findInit(x_S,count_S);

%显示初步截取的部分（50%）
subplot(3,5,9);
S_left=S_left/32;
S_right=S_right/32;
imshow(S,[S_left,S_right]);title('S分量初步分割');

% I
subplot(3,5,12);
imshow(I);title('I分量');
% I的折线图
[count_I,x_I]=imhist(I,32);
% 初始化gray_level
[x_I]=init_int(x_I);
subplot(3,5,13);
plot(x_I,count_I);title('I的折线图');

 %调用函数，实现寻找峰值
[I_left,I_right]=findInit(x_I,count_I);

%显示初步截取的部分（50%）
subplot(3,5,14);
I_left=I_left/32;
I_right=I_right/32;
imshow(I,[I_left,I_right]);title('I分量初步分割');

 
