clc;
%part a
display('part a');
a=0;b=10;
tol=10.^-8;
nmax=30;
[zero, res, niter] = bisection(@f,a,b,tol,nmax);
zero
res
niter

%part B
display('part b');
x0=10;
[zero, res, niter] = newtons(@f,@df, x0, tol, nmax);
zero
res
niter

%part C
display('part c');
a=0;b=10;
tol=10.^-8;
nmax=2;
[zero, res, niter] = bisection(@f,a,b,tol,nmax);
zero
res
niter

nmax=30;
[zero, res, niter] = newtons(@f,@df, zero, tol, nmax);
zero
res
niter
