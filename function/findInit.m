function [ left, right ] = findInit( x,count )
%FINDINIT ��ʼ������Ѱ�Ҵ���50%����
%   �����ҵ���ֵ
%   �������ͬʱ��չ��ֱ��50%
%   �ҵ��յ�
    %max(x);
    [lengh,C]=size(x);
    %Ѱ�ҷ�ֵ        
    [peak,idx]=max(count);
    %�����ҵ�50%
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

