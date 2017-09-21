for i=1:l
    x1=x(1,1:i);
    y1=f(x1);
    A(i)=trapz(x1,y1,2); 
    clear x1;
    clear y1;
end