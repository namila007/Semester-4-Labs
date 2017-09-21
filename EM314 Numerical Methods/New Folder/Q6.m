clear all;
clc;
home;
x=3;
N=40;
format long;
for k=1:1:N
 h(k)=1/(2.^k);   
 f(k)=abs((1/h(k))*(log(x+h(k))-log(x)));
 E(k)=abs((1/x)-f(k));
 
 fprintf('%.1f      %f     %f    %f\n',k,h(k),f(k),E(k));
end

loglog(h,E);  
xlabel('hk');
ylabel('Ehs');
title('hk vs Eh');
grid;

gamma=polyfit(log(h),log(E),1);
gamma