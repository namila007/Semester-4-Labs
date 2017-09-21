clear all;clc;
tol=10^-6;
nmax=500;

x0=10;
[zero, res, niter] = newtons(@f2,@df2, x0, tol, nmax);
zero
res
niter
eqs(zero)