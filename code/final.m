function [] = final(in,out,mode)
% final(in,out,mode)
% in  in the form of picture for example 'test1.jpg'
% out  in the form of gift for example 'result.gif'
% mode 0 椒盐噪声+中值滤波
% mode 1 consider the conectivity 不考虑连通 从左向右搜索 每个环有可以有多个起始点
%相当于x为极小值
% mode 2 考虑是否连通 每个环只有一个起始点
%相当于x为最小值
clc;
close all;
if nargin<2, out='out.gif';end  % default the name of gif 默认输出的gif文件名
if nargin<3, mode=0; end % default mode 默认模式
%%pretreatment 预处理
I=imread(in);
I=rgb2gray(I); %transform RGB to Gray 将RGB转为灰度
if 0==mode
    noise(I);% invoke function
else
    thresh = graythresh(I);     %自动确定二值化阈值
    I2 = im2bw(I,thresh);       %对图像二值化
    % imshow(I2);
    BW2 = bwperim(I2);     %查找边缘
    if 1==mode  %相当于x取到极左点
        T = findleft(BW2);%查找左侧点
        
    else %x取到最小值
        T=findleft2(BW2);%查找左侧点
    end
    %% create the effect    
    I1 = createPicture(BW2);%create randon background picture
    create(BW2, T , I1,out);%create the effect 生成特效
end
