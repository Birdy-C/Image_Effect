function [] = final(in,out,mode)
% final(in,out,mode)
% in  in the form of picture for example 'test1.jpg'
% out  in the form of gift for example 'result.gif'
% mode 0 ��������+��ֵ�˲�
% mode 1 consider the conectivity ��������ͨ ������������ ÿ�����п����ж����ʼ��
%�൱��xΪ��Сֵ
% mode 2 �����Ƿ���ͨ ÿ����ֻ��һ����ʼ��
%�൱��xΪ��Сֵ
clc;
close all;
if nargin<2, out='out.gif';end  % default the name of gif Ĭ�������gif�ļ���
if nargin<3, mode=0; end % default mode Ĭ��ģʽ
%%pretreatment Ԥ����
I=imread(in);
I=rgb2gray(I); %transform RGB to Gray ��RGBתΪ�Ҷ�
if 0==mode
    noise(I);% invoke function
else
    thresh = graythresh(I);     %�Զ�ȷ����ֵ����ֵ
    I2 = im2bw(I,thresh);       %��ͼ���ֵ��
    % imshow(I2);
    BW2 = bwperim(I2);     %���ұ�Ե
    if 1==mode  %�൱��xȡ�������
        T = findleft(BW2);%��������
        
    else %xȡ����Сֵ
        T=findleft2(BW2);%��������
    end
    %% create the effect    
    I1 = createPicture(BW2);%create randon background picture
    create(BW2, T , I1,out);%create the effect ������Ч
end
