function [  ] = noise( I )
%NOISE add salt & pepper' noise then perform median filter 
%  I is image array
    J=imnoise(I,'salt & pepper' ,0.02); %%add salt &papper noise
    subplot(121);imshow(J);title('before');
    K=medfilt2(J,[3,3]);         %% median filter ÖÐÖµÂË²¨
    subplot(122);imshow(K);title('after');

end

