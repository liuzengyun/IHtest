function []=dingchangbianma(p)
    n=length(p);
    L=ceil(log2(n));% �ȼ���һ����Ҫ���볤
    zong=[];
    for i=0:n-1
        ma=dec2bin(i,L);   % ���룬����ת��
        zong=[zong;ma];
    end
    zong
    % ����ƽ���볤
    L=sum(p.*L);
    % ������Ϣ��
    H=sum(-p.*log2(p)); 
    % �������Ч��
    xl=H/L;
    disp(['����������Ϣ��:',num2str(H)]); 
    disp(['��������ƽ���볤:',num2str(L)]);
    disp(['�����������Ч��:',num2str(xl)]); 
end