function [] = xiangnongbianma(p)
    n = length(p);
    % 降序排一下
    p = sort(p,'descend');
    F = zeros(1,n);
    % 先计算累加概率
    for i=2:n
        F(i)=F(i-1)+p(i-1);
    end
    len = zeros(1,n);
    % 再计算码长
    for i=1:n
        len(i) = ceil(-log2(p(i)));
    end
    for i=1:n
        f = max(len(i));
        % 转二进制
        for ii=1:f
            a=F(i).*2;
            if(a<1)
                w(ii)=0;
                F(i)=a;
            else
                x=a-1;
                w(ii)=1;
            end
        end
        
        for j=1:len(i)
            h(i,j)=num2str(w(j));
        end
    end
    H=sum(-p.*log2(p)); 
    L=sum(p.*len); 
    xl=H/L;
    
    disp(['香农编码信息熵:',num2str(H)]); 
    disp(['香农编码平均码长:',num2str(L)]);
    disp(['香农编码编码效率:',num2str(xl)]); 
end