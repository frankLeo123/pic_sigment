clear all; close all;
img=imread('C:\Users\junma\Desktop\tmp\images\e.jpg');
subplot(3,5,1);
imshow(img);title('ԭͼ');

% ת��Ϊhsi
addpath('E:\Doc\Code\Matlab\tools','E:\Doc\Code\Matlab\project\function');
% [hsi,H,S,I]=rgb2hsi(img);
R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);

%�ҵ�R�ķ�ֵ
subplot(3,5,2);
imshow(R);title('R����');
%R������ͼ
[count_R,x_R]=imhist(R);
subplot(3,5,3);
plot(x_R,count_R);title('R������ͼ');
%��˹�˲�
signma=3;
guass_R=fspecial('gaussian',[1,5],signma);
guass_R2=imfilter(R,guass_R,'replicate');
subplot(3,5,4);
[count_R,x_R]=imhist(guass_R2);
%gaussian�������ͼ
plot(x_R,count_R); title('gaussian�������ͼ')%y �� x
%���ú�����ʵ��Ѱ�ҷ�ֵ
[P_R,P_Rx]=findPeak(x_R,count_R);

% G
subplot(3,5,7);
imshow(G);title('G����');
% G������ͼ
[count_G,x_G]=imhist(G);
subplot(3,5,8);
plot(x_G,count_G);title('G������ͼ');
% ��˹�˲�
signma=3;
guass_G=fspecial('gaussian',[1,5],signma);
guass_G2=imfilter(G,guass_G,'replicate');
subplot(3,5,9);
[count_G,x_G]=imhist(guass_G2);
% gaussian�������ͼ
plot(x_G,count_G); title('gaussian�������ͼ')%y �� x
% ���ú�����ʵ��Ѱ�ҷ�ֵ
[P_G,P_Gx]=findPeak(x_G,count_G);

% B
subplot(3,5,12);
imshow(B);title('B����');
% B������ͼ
[count_B,x_B]=imhist(B);
subplot(3,5,13);
plot(x_B,count_B);title('B������ͼ');
%Gaussian
signma=3;
guass_B=fspecial('gaussian',[1,5],signma);
guass_B2=imfilter(B,guass_B,'replicate');
subplot(3,5,14);
[count_B,x_B]=imhist(guass_B2);
%gaussian�������ͼ
plot(x_B,count_B); title('gaussian�������ͼ');%y �� x
%���ú�����ʵ��Ѱ�ҷ�ֵ
[P_B,P_Bx]=findPeak(x_B,count_B);

%�ѿ�����
%��������
[cen_X,cen_Y,cen_Z]=meshgrid(P_Rx,P_Gx,P_Bx);
cluster=[cen_X(:) cen_Y(:) cen_Z(:)];
%��ͨ���ص� ѡ���������
% [px_X,px_Y,px_Z]=meshgrid(count_R,count_G,count_B);
% px=[px_X(:) px_Y(:) px_Z(:)];

% ��ŷʽ����
%r��ʾ�������ĵ���Ŀ
%cluster�Ǿ������ĵľ���
%matlabƽ̨
[r,c]=size(cluster);

%��ʼ��cluster���ĵ�����
z=1;
for i=1:r
   cluster_num(i)=0;
end;

%�������İ��������أ���һ�Σ�
%��������ˣ���Ϊcluster_num�ߴ�8��η�
for i=1:length(count_R)
    for j=1:length(count_G)
        for k=1:length(count_B)
            for z=1:r
                dc(z)=sqrt((x_R(i)-cluster(z,1)).^2+(x_G(j)-cluster(z,2)).^2+(x_B(k)-cluster(z,3)).^2);
            end;
            min=dc(1);
            flag=1;
            for y=1:r
                if dc(y)<min
                    min=dc(y);
                    flag=y;
                end;
            end;    
                cluster_num(flag)=cluster_num(flag)+count_R(i)+count_G(j)+count_B(k);
                z=z+1;
        end;
    end;
end;
[a,b,c]=size(img);
%�Զ����޸���N
N=a*b*c*1000;
j=1;
[r,h]=size(cluster_num);
for i=1:h
    if cluster_num(i)>N
        cluster_new(j,:)=cluster(i,:);%�����µ���
        j=j+1;
    end;
end;
%�ڶ��η�������
[r,h]=size(cluster_new);
cluster_num=zeros(1,r);
for i=1:length(count_R)
    for j=1:length(count_G)
        for k=1:length(count_B)
            for z=1:r
                dc(z)=sqrt((x_R(i)-cluster_new(z,1)).^2+(x_G(j)-cluster_new(z,2)).^2+(x_B(k)-cluster_new(z,3)).^2);
            end;
            min=dc(1);
            flag=1;
            for y=1:r
                if dc(y)<min
                    min=dc(y);
                    flag=y;
                end;
            end;    
                cluster_num(flag)=cluster_num(flag)+count_R(i)+count_G(j)+count_B(k);
                z=z+1;
        end;
    end;
end;
%����ϲ�����
DC=34;
% min=sqrt((cluster_new(1,1)-cluster_new(2,1)).^2+(cluster_new(1,2)-cluster_new(2,2)).^2+(cluster_new(1,3)-cluster_new(2,3)).^2);
while 1
    k=1;z=2;a=1;
    [r,h]=size(cluster_new);
%   D(a)=zeros(r*(r-1));
    %��ֹ�е�ͼƬ��ֻ��һ����ֵ
    if r==1
        break;
    end;
    min=sqrt((cluster_new(1,1)-cluster_new(2,1)).^2+(cluster_new(1,2)-cluster_new(2,2)).^2+(cluster_new(1,3)-cluster_new(2,3)).^2);
    for i=1:r
        for j=1:r
            %��ֹ������ͬ��
            if j==i
                continue;
            end;
            D(a)=sqrt((cluster_new(i,1)-cluster_new(j,1)).^2+(cluster_new(i,2)-cluster_new(j,2)).^2+(cluster_new(i,3)-cluster_new(j,3)).^2);           
            if D(a)<min
                min=D(a);
                k=i;z=j;
            end;
            a=a+1;
        end;
    end;
    if min>DC
        break;
    end;
    cluster_new(z,:)=[];
    cluster_num(k)=cluster_num(k)+cluster_num(z);
    cluster_num(z)=[];
end;
% [C,label,J]=kmeans_hsi(img,cluster_new);
% k=2
[C,label,J]=kmeans_hsi(img,cluster_new);
[m,n,p]=size(img);
I_seg=reshape(C(label,:),m,n,p);
subplot(3,5,5);
% imshow(I_seg);
imshow(uint8(I_seg), []), title('����ͼ')
% end;
        
        


    



    
