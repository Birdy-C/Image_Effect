function [ T ] = findNext( BW2,i,j )
%FINDNEXT �ҵ��Ҳ�ĵ�
%   ��ֵͼ�� BW2 ���꣨i,j��
T=[];
M_dim=size(BW2);
if (j>4&&i>4&& i<M_dim(2)-4 && j<M_dim(2)-4)%����������Χ�ĵ㣨��ȡ��Ե������Χ��һȦ���ߣ�
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

