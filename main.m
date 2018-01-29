%matlab
%����
clear all; close all;
dbstop if error;
% dbstop if error;
img=imread('C:\Users\junma\Desktop\tmp\images\e.tif');
subplot(3,5,1);
imshow(img);title('ԭͼ');

% ת��Ϊhsi
addpath('E:\Doc\Code\Matlab\tools','E:\Doc\Code\Matlab\project\function');
[hsi,H,S,I]=rgb2hsi(img);

%HSI
subplot(3,5,6);
imshow(hsi),title('hsi');

% �ҵ�H�ķ�ֵ
subplot(3,5,2);
imshow(H);title('H����');
%R������ͼ-32level
[count_H,x_H]=imhist(H,32);
% ��ʼ��gray_level
[x_H]=init_int(x_H);
subplot(3,5,3);
plot(x_H,count_H);title('H������ͼ');
%���ú�����ʵ��Ѱ�ҷ�ֵ
[H_left,H_right]=findInit(x_H,count_H);

%��ʾ������ȡ�Ĳ��֣�50%��
subplot(3,5,4);
H_left=H_left/32;
H_right=H_right/32;
% s=
imshow(H,[H_left,H_right]);title('H���������ָ�');

% S
subplot(3,5,7);
imshow(S);title('S����');
% S������ͼ
[count_S,x_S]=imhist(S,32);
% ��ʼ��gray_level
[x_S]=init_int(x_S);
subplot(3,5,8);
plot(x_S,count_S);title('S������ͼ');
 %���ú�����ʵ��Ѱ�ҷ�ֵ
[S_left,S_right]=findInit(x_S,count_S);

%��ʾ������ȡ�Ĳ��֣�50%��
subplot(3,5,9);
S_left=S_left/32;
S_right=S_right/32;
imshow(S,[S_left,S_right]);title('S���������ָ�');

% I
subplot(3,5,12);
imshow(I);title('I����');
% I������ͼ
[count_I,x_I]=imhist(I,32);
% ��ʼ��gray_level
[x_I]=init_int(x_I);
subplot(3,5,13);
plot(x_I,count_I);title('I������ͼ');

 %���ú�����ʵ��Ѱ�ҷ�ֵ
[I_left,I_right]=findInit(x_I,count_I);

%��ʾ������ȡ�Ĳ��֣�50%��
subplot(3,5,14);
I_left=I_left/32;
I_right=I_right/32;
imshow(I,[I_left,I_right]);title('I���������ָ�');

 
