function [T ] = findleft(BW2 )
%FINDLEFT 查找最左侧点
%   二值图像BW2 返回行为2的矩阵T 每一列代表一个点
index=0;
T=[];
M_dim=size(BW2);
for i=4:M_dim(2)-4
    for j=4:M_dim(1)-4  %%search the i th column
        if (BW2(j,i)==1)
            if 4==i
                T=[T,[j,i]'];%%add point (j,i)
            else
                index=index+1;
                if (BW2(j-1,i)+BW2(j+1,i)+BW2(j-1,i-1)+BW2(j,i-1)+BW2(j+1,i-1))==0 %if there are no point on the left
                    %   breakpoint=breakpoint+1;
                    T=[T,[j,i]'];%%add point (j,i)
                end
            end
        else
            if index~=0 %处理一列黑色的情况
                t=0;
                for k=j-index:j-1
                    if BW2(k-1,i-1)+BW2(k,i-1)+BW2(k+1,i-1)~=0
                        t=1;
                    end
                end
                if t==0
                    %                             breakpoint=breakpoint+1;
                    T=[T,[round(j-index/2),i]'];%存储中点
                    
                end
            end
            index=0;
        end
        
    end
end
end

