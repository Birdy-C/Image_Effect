function [ T ] = findNext( BW2,i,j )
%FINDNEXT 找到右侧的点
%   二值图像 BW2 坐标（i,j）
T=[];
M_dim=size(BW2);
if (j>4&&i>4&& i<M_dim(2)-4 && j<M_dim(2)-4)%不考虑最周围的点（提取边缘后最周围有一圈白线）
if(BW2(j-1,i)==1)
      T=[T,[j-1,i]'];
end
if(BW2(j+1,i)==1)
      T=[T,[j+1,i]'];
end
if(BW2(j-1,i+1)==1)
      T=[T,[j-1,i+1]'];
end
if(BW2(j,i+1)==1)
      T=[T,[j,i+1]'];
end
if(BW2(j+1,i+1)==1)
      T=[T,[j+1,i+1]'];
end
if(BW2(j-1,i-1)==1)
      T=[T,[j-1,i-1]'];
end
if(BW2(j,i-1)==1)
      T=[T,[j,i-1]'];
end
if(BW2(j+1,i-1)==1)
      T=[T,[j+1,i-1]'];
end
end
end

