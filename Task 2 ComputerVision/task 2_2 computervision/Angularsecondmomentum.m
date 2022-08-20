function [sum]=Angularsecondmomentum(gc)

[x,y]=size(gc);
sum=0;
for i=1:x
    for j=1:y
        sum=sum+(gc(x,y))^2;
    end
end
