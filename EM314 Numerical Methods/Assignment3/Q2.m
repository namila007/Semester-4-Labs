clear all;
x=linspace(-1,1,11);
x11=linspace(-1,1,100);
y1=feval(@f1,x11);
plot(x11,y1)
hold on;

x2=reshape(x,11,1);
y2=feval(@f1,x2);

for n=0:10
    for m=0:10
    x3(n+1,m+1)=x2(n+1,1).^(m);
       
    end
end

y3=0;
A=inv(x3)*y2;

    for n=1:11
      y3=y3+A(n)*x.^(n-1); 
    end


plot(x,y3,'r')
hold on

z=abs(y3-y1);
plot(x,z,'g');


