function [] = hafumanbianma(p)
    % ��������
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
         % ��֧·�ĵ�һ��Ԫ�����1 
        c(n-i,n)='1';  
        c(n-i,n+1:2*n-1)=c(n-i,1:n-1); 
        % ��֧·�ĵ�һ��Ԫ�����0 
        c(n-i,2*n)='0'; 
        for j=1:i-1 
            % ��������
            c(n-i,(j+1)*n+1:(j+2)*n)=c(n-i+1,n*(find(m(n-i+1,:)==j+1)-1)+1:n*find(m(n-i+1,:)==j+1));
        end
    end
    for i=1:n
        h(i,1:n)=c(1,n*(find(m(1,:)==i)-1)+1:find(m(1,:)==i)*n); 
        % ������볤��
        len(i)=length(find(abs(h(i,:))~=32));    
    end
    H=sum(-p.*log2(p));
    L=sum(p.*len);
    xl=H/L;
    disp(['������������Ϣ��:',num2str(H)]); 
    disp(['����������ƽ���볤:',num2str(L)]);
    disp(['�������������Ч��:',num2str(xl)]); 
end