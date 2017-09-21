clc;
clear all;
x=0:0.05:5;
l=length(x);
y=g(x);
A = zeros(1,l);

for i=1:l
    x1=x(1:i);
    y1=g(x1);
    A(i)=0.5-trapz(x1,y1,2); 
    %trapz in mathlab we have to use the dimension of the poly.here its 2  
end

scaled_x=0:0.001:5; %as T distribution minimum val 0.001
actual=1-tcdf(scaled_x,10);

linear=interp1(x,A,scaled_x,'linear');
spline=spline(x,A,scaled_x);

error1=abs(linear-actual);
error2=abs(spline-actual);

plot(scaled_x,error1,'r');
hold on;
plot(scaled_x,error2,'b');
legend('Linear','Spline');
xlabel('t value');

