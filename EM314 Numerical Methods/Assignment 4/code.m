clear
clc

figure
axis([0 50 0 20]); % x_lims, y_lims
set( gca , 'XTick' , [0 : 5 : 50] );
set( gca , 'YTick' , [0 : 5 : 20] );
hold
[x2,y2]=ginput(5);
PP = spline(x2,y2);
xx=[x2(1):(x2(end)-x2(1))/100:x2(end)];
V = ppval(PP,xx);
plot(x2,y2,'or')
plot(xx,V,'g.')

PP.coefs % show coefficents

%%calculating area

%{
[x2,y2]=ginput(5);
PP = spline(x2,y2);
xx=[x2(1):(x2(end)-x2(1))/100:x2(end)];
V = ppval(PP,xx);
plot(x2,y2,'.r')
plot(xx,V)

% reading and displaying the image
[Image1]=imread('interp_fig1.png','png');
imshow(Image1)
% Rotating the figure
tform = maketform('projective',[ 0 0; 332 0; 332 448; 0 448],[0 0; 332 0;
332 600; 0 600]);
Image2= imtransform(Image1,tform);
imshow(Image2)
%}