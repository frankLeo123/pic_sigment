function [ left, right ] = findInit( x,count )
%FINDINIT 初始化处理，寻找大于50%部分
%   首先找到峰值
%   其次左右同时扩展，直到50%
%   找到拐点
    %max(x);
    [lengh,C]=size(x);
    %寻找峰值        
    [peak,idx]=max(count);
    %初步找到50%
    left=idx;right=idx;
    sum1=peak;
    sum2=sum(count)/2;
%     for i=1:lengh1/2
    while 1
        if(left>1)
            left=left-1;
        elseif(left==1)
            left=lengh;
        end;
        if(right<lengh)
            right=right+1;
        elseif(right==lengh)
            right=1;
        end;
        if(sum1<sum2)
            sum1=sum1+count(left)+count(right);
        else
            break;
        end;   
    end;
    if(left>right)
        tmp=left;
        left=right;
        right=tmp;
    end;
    sum1=2;
end

