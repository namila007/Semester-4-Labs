x = 0:0.02:5; % original points
A = []; % probability

% caclulate probability
for i = 1 : length(x)
  x1 = x(1:i);
  y1 = g(x1);
  A(i) = 0.5 - trapz(x1,y1,2) ;
end

xe = 0:0.001:5; % query points
actual = 1 - tcdf(xe,10); % actual values assuming octave produce correct ones

lin = interp1(x, A, xe); % linear interpolation
spl = interp1(x, A, xe, 'spline'); % spline interpolation

e1 = abs(lin - actual); % error for linear
e2 = abs(spl - actual); % error for spline

% plot them
figure;
plot(xe, e2);
hold on;
plot(xe, e1);

