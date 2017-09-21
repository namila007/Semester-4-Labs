clear all
home
t=1;
for n=500:500:5000
A=rand(n);
B=rand(n);

starttime=tic;
C=A*B;
endtime(t)=toc(starttime);
t=t+1;
end

n=500:500:5000;
plot(log(n),log(endtime),'r.');
hold on
p=polyfit(log(n),log(endtime),1);
fprintf('%f',p);
alpha=polyval(p,log(n));
plot(log(n),alpha);
xlabel('log(n)');
ylabel('log(t)');
title('log(n) vs log(t)');


