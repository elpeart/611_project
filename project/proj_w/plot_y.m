yold = linspace(ymin,ymax,length(cold(:,1)));
ynew = linspace(ymin,ymax,length(cnew(:,1)));
xold = linspace(xmin,xmax,length(cold(1,:)));
xnew = linspace(xmin,xmax,length(cnew(1,:)));
i = find(xold < 20);
i=i(end);
plot(yold,cold(:,i))
hold on
inew = find(xnew < 20);
inew = inew(end);
plot(ynew,cnew(:,inew));