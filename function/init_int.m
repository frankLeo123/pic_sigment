function [x] = init_int( x )
%Ԥ��������
%   �˴���ʾ��ϸ˵��
    x=ceil(x*32);
    [lengh1,i]=size(x);
    %Ԥ����ʹx����Ϊ����
    for i=2:lengh1
        if x(i)==x(i-1)
            x(i)=x(i)+1;
        end;
    end;
    for i=2:lengh1
        if (x(i)-x(i-1))>1
            x(i-1)=x(i-1)+1;
        end;
    end;

end

