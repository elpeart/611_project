x = 1;
y = 5;
n=40;
xmin = 0;
xmax = 30;
ymin = 0;
ymax = 10;
while x(end) ~= xmax && y(end) ~= ymax
    n = n+1;
    h = 10*(sqrt(3*n+1)+2)/(n-1);
    x=xmin:h:xmax;
    y=ymin:h:ymax;
end
n