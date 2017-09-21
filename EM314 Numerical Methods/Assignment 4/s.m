clear
clc
figure
axis([0 50 0 20]); % x_lims, y_lims

[Image1]=imread('interp_fig1.png','png');
%imshow(Image1);
tform = maketform('projective',[ 0 0; 332 0; 332 448; 0 448],[0 0; 332 0;
332 600; 0 600]);
Image2= imtransform(Image1,tform);
imshow(Image2)
hold on

hold on
set( gca , 'XTick' , [0 : 5 : 50] );
set( gca , 'YTick' , [0 : 5 : 20] );
[x2,y2]=ginput();
PP = spline(x2,y2);
xx=[x2(1):(x2(end)-x2(1))/100:x2(end)];
V = ppval(PP,xx);
plot(x2,y2,'or')
plot(xx,V,'g.')
hold on
area=0;
for n=2:101
    area=area+(600-(V(n)))*(332-(xx(n-1)xx(n)));
end
area
%{
tform = maketform('projective',[ 0 0; 332 0; 332 448; 0 448],[0 0; 332 0;
332 600; 0 600]);
Image2= imtransform(Image1,tform);
imshow(Image2)
hold on
%}





