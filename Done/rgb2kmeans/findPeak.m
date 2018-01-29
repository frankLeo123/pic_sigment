function [P3,x4]=findPeak(x,count)
i2=1;
%求P1
for i1=2:255
    if (count(i1)>count(i1-1) )&& (count(i1)>count(i1+1))
        P1(i2)=count(i1);
        x2(i2)=i1;
        i2=i2+1;
    end
end
%去除小峰值
T1=60;
i4=1;
for i3=1:i2-1
    if P1(i3)>=T1
        P2(i4)=P1(i3);
        x3(i4)=x2(i3);
        i4=i4+1;
    end
end

%去除相邻峰值
T2=7;%10
i6=1;
for i5=2:i4-1
    if ((x3(i5)-x3(i5-1))>T2)||((x3(i5-1)-x3(i5))>T2)
        if(P2(i5)>P2(i5-1))
            P3(i6)=P2(i5);
            x4(i6)=x3(i5);
        end
        if(P2(i5)<P2(i5-1))
            P3(i6)=P2(i5-1);
            x4(i6)=x3(i5-1);
        end
%         x4(i6)=x3(i5);
        i6=i6+1;
    end
end