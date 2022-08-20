function [sum1]=inversedifferencemoment(gc)

[x,y]=size(gc);
sum1=0;
for i=1:x
    for j=1:y
        sum1=sum1 + (1/(1+(x-y)^2))*gc(x,y);
    end
end
