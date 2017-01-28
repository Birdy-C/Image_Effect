function [ T ] = findleft2( BW2 )
%FINDLEFT1 查找最左侧点
%二值图像BW2 返回行为2的矩阵T 每一列代表一个点

        M_dim=size(BW2);
        %%查找最左侧点
        T=[];
        temp=[];        
        for i=4:M_dim(2)-4
            index=0;
            for j=4:M_dim(1)-4  %%search the i th column
                if (BW2(j,i)==1)
                    if 4==i
                        T=[T,[j,i]'];%%add point (j,i)
                        temp=[temp,[j,i]'];
                    else
                        index=index+1;
                        if (BW2(j-1,i)+BW2(j+1,i)+BW2(j-1,i-1)+BW2(j,i-1)+BW2(j+1,i-1))==0 %if there are no point on the rleft
                            T=[T,[j,i]'];%%add point (j,i)
                            temp=[temp,[j,i]'];
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
                            T=[T,[round(j-index/2),i]'];%存储中点
                            temp=[temp,[round(j-index/2),i]'];
                        end
                    end
                    index=0;
                end
                %%以下是和findleft不同的地方
                while temp~=0 % delete all the pixel related 删除所有和起始点有关的点
                    temp_size=size(temp);
                    for ti=1: temp_size(2)
                        x=temp(1,1);
                        y=temp(2,1);
                        BW2(x,y)=0;
                        temp=[temp,findNext(BW2,y,x)];
                        temp(:,1)=[];
                    end
                end
            end
        end
end

