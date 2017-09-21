format long;
k=reshape(linspace (0.1,0.2,11),11,1);
y=feval(@p1,k);
for n=0:10
    for m=0:10
    x(n+1,m+1)=k(n+1,1).^(m);
       
    end
end   

A=inv(x)*y;
A