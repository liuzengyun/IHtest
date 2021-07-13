function [] = hafumanbianma(p)
    % 降序排列
    p=sort(p,'descend');    
    n=length(p);   
    q=p; 
    m=zeros(n-1,n); 
    for i=1:n-1            
        [q,l]=sort(q); 
        m(i,:)=[l(1:n-i+1),zeros(1,i-1)]; 
        q=[q(1)+q(2),q(3:n),1]; 
    end
    for i=1:n-1
        c(i,:)=blanks(n*n); 
    end
    c(n-1,n)='1';
    c(n-1,2*n)='0';
    for i=2:n-1
        c(n-i,1:n-1)=c(n-i+1,n*(find(m(n-i+1,:)==1))-(n-2):n*(find(m(n-i+1,:)==1))); 
         % 在支路的第一个元素最后补1 
        c(n-i,n)='1';  
        c(n-i,n+1:2*n-1)=c(n-i,1:n-1); 
        % 在支路的第一个元素最后补0 
        c(n-i,2*n)='0'; 
        for j=1:i-1 
            % 分配码字
            c(n-i,(j+1)*n+1:(j+2)*n)=c(n-i+1,n*(find(m(n-i+1,:)==j+1)-1)+1:n*find(m(n-i+1,:)==j+1));
        end
    end
    for i=1:n
        h(i,1:n)=c(1,n*(find(m(1,:)==i)-1)+1:find(m(1,:)==i)*n); 
        % 计算编码长度
        len(i)=length(find(abs(h(i,:))~=32));    
    end
    H=sum(-p.*log2(p));
    L=sum(p.*len);
    xl=H/L;
    disp(['哈夫曼编码信息熵:',num2str(H)]); 
    disp(['哈夫曼编码平均码长:',num2str(L)]);
    disp(['哈夫曼编码编码效率:',num2str(xl)]); 
end