function [T ] = findleft(BW2 )
%FINDLEFT ����������
%   ��ֵͼ��BW2 ������Ϊ2�ľ���T ÿһ�д���һ����
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
            if index~=0 %����һ�к�ɫ�����
                t=0;
                for k=j-index:j-1
                    if BW2(k-1,i-1)+BW2(k,i-1)+BW2(k+1,i-1)~=0
                        t=1;
                    end
                end
                if t==0
                    %                             breakpoint=breakpoint+1;
                    T=[T,[round(j-index/2),i]'];%�洢�е�
                    
                end
            end
            index=0;
        end
        
    end
end
end

