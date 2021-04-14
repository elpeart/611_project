% make sure that I can make the shape with the corresponding values
clc
clearvars

ea = 100;
n = 96;

xmin = 0;
xmax = 30;
ymin = 0;
ymax = 10;

k = .1;
D = .5;
[n, cnew] = func_proj_n(D,k,n);
es = 5;

while ea >= es
    ea = 0;
    cold = cnew;
    current_n = n;
    [n, cnew] = func_proj_n(D,k,n);

    
    % difference between nodes at the same point in space from one
    % iteration to the next
%     EA=100*(cnew(1:2:end,1:2:end)-cold)./cnew(1:2:end,1:2:end);

    for i = 1:size(cold, 1)
        for j = 1:size(cold, 2)
            Error(i, j) = 100*abs((cold(i, j) - cnew(2 * i - 1, 2 * j - 1)) / cold(i, j)); 
            if Error(i, j) > ea
                ea = Error(i, j);
            end
        end
    end
    ea
    
%     if n > 5000
%         break
%     end
%     ea=max(max(abs(EA)));
    
end

% Plotting a slice along the x direction at y = 0 since that with have the
% greatest error
xold = linspace(xmin,xmax,length(cold(1,:)));
xnew = linspace(xmin,xmax,length(cnew(1,:)));
f6 = figure;
plot(xold,cold(end,:),xnew,cnew(end,:))
legend('Old','New')
title('Old vs New x Slice')

% Plotting a slice along the y direction at the highest x value in cold for
% which the bottom wall is closed since that will have the greatest error
yold = linspace(ymin,ymax,length(cold(:,1)));
ynew = linspace(ymin,ymax,length(cnew(:,1)));
i = find(xold < 20);
i=i(end);
f7 = figure;
plot(yold,cold(:,i))
hold on
plot(ynew,cnew(:,2*i-1))
legend('Old','New')
title('Old vs New y Slice')
legend Location NorthWest

h = 10*(sqrt(3*current_n+1)+2)/(current_n-1);
fprintf('step size=%1.3f number of nodes=%d error=%1.2f%%\n',h,current_n,ea)

x=xmin:h:xmax;
y=ymax:-h:ymin;

% 200% of D, base k
[~,c_2D]=func_proj_n(2*D,k,current_n);

% 50% of D, base k
[~,c_half_D]=func_proj_n(D/2,k,current_n);

% 50% of D and 200% of K
[~,c_hD_2k]=func_proj_n(D/2,2*k,current_n);


% 200% of D and 50% of k
[~,c_2D_hk]=func_proj_n(2*D,k/2,current_n);


f1 = figure;
surf(x,y,cnew,'FaceColor','r')
f1.Name = 'Base Case';
title('Base Case')
legend('Base Case')
legend Location Northwest

f2 = figure;
hold on
surf(x,y,cnew,'FaceColor','r')
surf(x,y,c_2D)
f2.Name = 'Base vs 200% D';
legend('Base Case','200% D, base k')
legend Location Northwest

f3 = figure;
hold on
surf(x,y,cnew,'FaceColor','r')
surf(x,y,c_half_D)
f3.Name = 'Base vs 50% D';
legend('Base Case','50% D, base k')
legend Location NorthWest

f4 = figure;
hold on
surf(x,y,cnew,'FaceColor','r')
surf(x,y,c_2D_hk)
f4.Name = 'Base vs 200% D and 50% k';
legend('Base Case','200% D, 50% k')
legend Location NorthWest

f5 = figure;
hold on
surf(x,y,cnew,'FaceColor','r')
surf(x,y,c_hD_2k)
f5.Name = 'Base vs 50% D and 200% k';
legend('Base Case','50% D, 200% k')
legend Location NorthWest