%rgbת��ΪHSI
%���ɷ��������ֵ�ָ�Otsu
%����
f=imread('C:\Users\junma\Desktop\tmp\artificial(1)\sea\b.jpg');
%ԭͼ
subplot(3,5,1)
imshow(f)
% OriImage=imread('lena.jpg');
%��˹�˲�
sigma = 3;
grayImg=rgb2gray(f);
gausFilter = fspecial('gaussian',[1 5],sigma);%������˹�˲�����
blur=imfilter(grayImg,gausFilter,'replicate'); %�����˲�
subplot(3,5,11)
imshow(blur)
%���ú���
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
imhist(Y);title('ԭͼֱ��ͼ');
ylim('auto')

%H��ֱ��ͼ�ͷָ�
subplot(3,5,8);imhist(H);title('Hֱ��ͼ');ylim('auto')
level=graythresh(H);
g_h=im2bw(H,level);%�����ֵlevel
subplot(3,5,13);imshow(g_h);title('��ֵ�ָ�');
%��Command��������Ҷ���ֵ
disp(strcat('graythresh ����Ҷ���ֵ��',num2str(uint8(level*255))))

%S��ֱ��ͼ�ͷָ�
subplot(3,5,9);ylim('auto');imhist(S);title('Sֱ��ͼ');ylim('auto')
level=graythresh(S);
g_s=im2bw(S,level);%�����ֵlevel
subplot(3,5,14);imshow(g_s);title('��ֵ�ָ�');
%��Command��������Ҷ���ֵ
disp(strcat('s graythresh ����Ҷ���ֵ��',num2str(uint8(level*255))))

%I��ֱ��ͼ�ͷָ�
subplot(3,5,10);ylim('auto');imhist(I);title('Iֱ��ͼ');ylim('auto')
level=graythresh(I);
g_i=im2bw(I,level);%�����ֵlevel
subplot(3,5,15);imshow(g_i);title('��ֵ�ָ�');
%��Command��������Ҷ���ֵ
disp(strcat('i graythresh ����Ҷ���ֵ��',num2str(uint8(level*255))))
