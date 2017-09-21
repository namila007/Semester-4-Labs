clc;
clear all;
x=0:0.04:4;
l=length(x);
y=f(x);
A = zeros(1,l);
A(1)=0;

for i=2:l
    z=0;
    A(i)=A(i-1)+(f(x(i-1))+f(x(i))).*0.02; %trapz
    
end

actual=normcdf(x)-0.5;
error=abs(actual-A);
plot(x,error);
grid on;

scaled_x=0:0.01:3.99;
scaled_y=spline(x,A,scaled_x);

%printing table
for i=1:length(scaled_y)
   fprintf('%f ',scaled_y(i));
   if(mod(i,10)==0)fprintf('\n');end
end