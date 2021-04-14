tic
ea=100;
n_old=96;

xmin = 0;
xmax = 30;
ymin = 0;
ymax = 10;

k=.1;
D=.5;
cnew=func_proj_n(D,k,n_old);
n_new = 2*n_old;
es=10;
iter = 0;
while ea>es
    cold=cnew;
    n_old = n_new;
%     h=h/2;
%     if h<=.1
%         disp('Step size too small')
%         h=2*h;
%         break
%     end
    cnew=func_proj_n(D,k,n_old);

    x = 1;
    y = 1;
    n_new = 2*n_old;
    while x(end) ~= xmax && y(end) ~= ymax
        n_new = n_new+1;
        h = 10*(sqrt(3*n_new+1)+2)/(n_new-1);
        x=xmin:h:xmax;
        y=ymin:h:ymax;
    end
    iter = iter+1;

    
    % difference between nodes at the same point in space from one
    % iteration to the next
    EA = zeros(size(cold));
    
%     for i = 1:length(cold(:,1))
%         for j = 1:length(cold(1,:))
%             EA(i,j) = 100*abs(cold(i,j)-cnew(round(1.4*i),round(1.4*j)))./cold(i,j);
%         end
%     end
%     ea = max(max(EA));
    cold_e_i = find(cold(end,:) ~= 100);
    cold_e = cold(end,cold_e_i(end));
    cnew_e_i = find(cnew(end,:) ~= 100);
    cnew_e = cnew(end,cnew_e_i(end));
    ea = 100*abs(cnew_e-cold_e)/cnew_e;
    
%     if n_new > 5000
%         break
%     end
%     EA=100*(cnew(1:2:end,1:2:end)-cold)./cnew(1:2:end,1:2:end);
%     ea=max(max(abs(EA)));
end
% plotting result
h = 10*(sqrt(3*n_old+1)+2)/(n_old-1);
fprintf('step size=%1.3f number of nodes=%d error=%1.2f%%\n',h,n_old,ea)

x=xmin:h:xmax;
y=ymax:-h:ymin;

% % The cases with 200% or 50% of both D and k are equivalent to 100% of both
% % proof
% [~,c_2test]=func_proj_n(2*D,2*k,h);
% test2 = cnew ~= c_2test;
% ts2 = sum(sum(test2));
% if ts2 ==0
%     disp('The case with 200% of both D and k is equivalent to the base case')
% else
%     disp('The assumption is wrong')
% end
% [~,c_half_test]=func_proj_n(D/2,k/2,h);
% testh = cnew ~= c_half_test;
% tsh = sum(sum(testh));
% if tsh ==0
%     disp('The case with 50% of both D and k is equivalent to the base case')
% else
%     disp('The assumption is wrong')
% end

% 200% of D, base k
c_2D=func_proj_n(2*D,k,n_old);

% 50% of D, base k
c_half_D=func_proj_n(D/2,k,n_old);

% % 50% of k, base D
% [~,c_half_k] = func_proj_n(D,k/2,h);
% testhk = c_half_k ~= c_2D;
% tshk = sum(sum(testhk));
% if tshk ==0
%     disp('The case with 50% of k and base D is equivalent to the case with 200% of D and base k')
% else
%     disp('The assumption is wrong')
% end
% 
% % 200% of k, base D
% [~,c_2k] = func_proj_n(D,2*k,h);
% test2k = c_2k ~= c_half_D;
% ts2k = sum(sum(test2k));
% if ts2k ==0
%     disp('The case with 200% of k and base D is equivalent to the case with 50% of D and base k')
% else
%     disp('The assumption is wrong')
% end

% 50% of D and 200% of K
c_hD_2k=func_proj_n(D/2,2*k,n_old);


% 200% of D and 50% of k
c_2D_hk=func_proj_n(2*D,k/2,n_old);


f1 = figure;
surf(x,y,cnew,'FaceColor','r')
f1.Name = 'Base Case';
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
toc