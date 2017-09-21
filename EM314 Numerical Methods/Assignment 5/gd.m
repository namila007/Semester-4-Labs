function y=gd(x)
gd = gamma(11/2)/(sqrt(10*pi)*gamma(5))*(-11/10);
y = gd*x*(1+(x.^2)/10)^(-13/2);


end