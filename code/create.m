function [  ] = create(BW2, T,I1,out )
%CREATE 生成特效
%  T 起始点
%  I1 background matrix
% out name of output gif
I=zeros(size(I1));
imshow(I1);
I=uint8(I);
burn =[];
count=1;
pic=1;
while T~=0
    burn=[burn,[T(1,1),T(2,1)]'];
    T(:,1)=[];
    while burn~=0
        while max(burn(2,:))>min(T(2,:))
            burn=[burn,[T(1,1),T(2,1)]'];
            T(:,1)=[];
        end
        burn_size=size(burn);
        for i=1:burn_size(2)
            x=burn(1,1);
            y=burn(2,1);
            I(x,y,:)=I1(x,y,:);
            BW2(x,y)=0;
            burn=[burn,findNext(BW2,y,x)];
            burn(:,1)=[];
        end
        
        I=round(I.*0.98);
        count=count+1;
        imshow(I);
        hold on;
        
        %make the gif file
        frame=getframe;
        im=frame2im(frame);%制作gif文件，图像必须是index索引图像
        [Im,map]=rgb2ind(im,256);
        if pic==1;
            imwrite(Im,map,out,'gif','Loopcount',inf,...
                'DelayTime',0.02);%loopcount只是在i==1的时候才有用
        else
            imwrite(Im,map,out,'gif','WriteMode','append',...
                'DelayTime',0.02);%DelayTime用于设置gif文件的播放快慢
        end
        pic=pic+1;
    end
end
for j=1:10 %delay 描绘结束后延时
    I=round(I.*0.98);
    
    imshow(I);
    hold on;
    frame=getframe;
    im=frame2im(frame);%制作gif文件，图像必须是index索引图像
    [Im,map]=rgb2ind(im,256);
    imwrite(Im,map,out,'gif','WriteMode','append',...
        'DelayTime',0.02);%DelayTime用于设置gif文件的播放快慢
end

end

