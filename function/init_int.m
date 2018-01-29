function [x] = init_int( x )
%预处理整数
%   此处显示详细说明
    x=ceil(x*32);
    [lengh1,i]=size(x);
    %预处理，使x均匀为整数
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

