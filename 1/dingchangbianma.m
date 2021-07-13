function []=dingchangbianma(p)
    n=length(p);
    L=ceil(log2(n));% 先计算一下需要的码长
    zong=[];
    for i=0:n-1
        ma=dec2bin(i,L);   % 编码，进制转换
        zong=[zong;ma];
    end
    zong
    % 计算平均码长
    L=sum(p.*L);
    % 计算信息熵
    H=sum(-p.*log2(p)); 
    % 计算编码效率
    xl=H/L;
    disp(['定长编码信息熵:',num2str(H)]); 
    disp(['定长编码平均码长:',num2str(L)]);
    disp(['定长编码编码效率:',num2str(xl)]); 
end