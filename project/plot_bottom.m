xmin = 0;
xmax = 30;
xold = linspace(xmin,xmax,length(cold(1,:)));
xnew = linspace(xmin,xmax,length(cnew(1,:)));
plot(xold,cold(end,:),xnew,cnew(end,:))
legend('Old','New')