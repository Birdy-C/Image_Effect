function [ T ] = findleft2( BW2 )
%FINDLEFT1 ����������
%��ֵͼ��BW2 ������Ϊ2�ľ���T ÿһ�д���һ����

        M_dim=size(BW2);
        %%����������
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
                    if index~=0 %����һ�к�ɫ�����
                        t=0;
                        for k=j-index:j-1
                            if BW2(k-1,i-1)+BW2(k,i-1)+BW2(k+1,i-1)~=0
                                t=1;
                            end
                        end
                        if t==0
                            T=[T,[round(j-index/2),i]'];%�洢�е�
                            temp=[temp,[round(j-index/2),i]'];
                        end
                    end
                    index=0;
                end
                %%�����Ǻ�findleft��ͬ�ĵط�
                while temp~=0 % delete all the pixel related ɾ�����к���ʼ���йصĵ�
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

