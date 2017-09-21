function [zero, res, niter] = newtonshybrid(f, df, x0, tol, nmax)
niter = 0;
x=x0 - double(f(x0)./double(subs(diff(df),x0)));
while abs(x0-x) >= tol && niter <= nmax
x0 = x;
x = x0 - double(f(x0)./double(subs(diff(df),x0)));
niter = niter + 1;
end
if niter > nmax
fprintf('Newtons method stopped without convergence');
end
zero = x; res = f(x);