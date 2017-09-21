function y=g(x)
  y1 = gamma(11/2)/(sqrt(10*pi)*gamma(5));
  y2 = 1 + (x.^2)/10;
  y = y1*y2.^(-11/2);

end