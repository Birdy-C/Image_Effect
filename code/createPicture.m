function [I1 ] = createPicture(I2 )
%CREATEPICTURE 此处显示有关此函数的摘要
%   此处显示详细说明
M_dim=size(I2);
R1=zeros(M_dim(1),M_dim(2));
G1=zeros(M_dim(1),M_dim(2));
B1=zeros(M_dim(1),M_dim(2));
for i=4:M_dim(2)-4
    for j=4:M_dim(1)-4
        R1(j,i)=25*sin(j*pi/50)+225;
        G1(j,i)=25*sin(j*pi/50)+225;
        B1(j,i)=255;
    end
end
I1=cat(3,R1,G1,B1);
I1=uint8(I1);
end

