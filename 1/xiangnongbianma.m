function [] = xiangnongbianma(p)
    n = length(p);
    % ������һ��
    p = sort(p,'descend');
    F = zeros(1,n);
    % �ȼ����ۼӸ���
    for i=2:n
        F(i)=F(i-1)+p(i-1);
    end
    len = zeros(1,n);
    % �ټ����볤
    for i=1:n
        len(i) = ceil(-log2(p(i)));
    end
    for i=1:n
        f = max(len(i));
        % ת������
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
    
    disp(['��ũ������Ϣ��:',num2str(H)]); 
    disp(['��ũ����ƽ���볤:',num2str(L)]);
    disp(['��ũ�������Ч��:',num2str(xl)]); 
end