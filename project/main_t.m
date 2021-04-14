tic
ea=100;
h=2;

k=.1;
D=.5;
[n,cold]=func_proj(D,k,h);
es=10;
while ea>es
    h=h/2;
    if h<=.1
        disp('Step size too small')
        h=2*h;
        break
    end
    [n,cnew]=func_proj(D,k,h);
    
    % difference between nodes at the same point in space from one
    % iteration to the next
    EA=100*(cnew(1:2:end,1:2:end)-cold)./cnew(1:2:end,1:2:end);
    ea=max(max(abs(EA)));
    cold=cnew;
end

fprintf('step size=%1.3f number of nodes=%d error=%1.2f%%\n',h,n,ea)

% plotting result
x=0:h:30;
y=10:-h:0;

% The cases with 200% or 50% of both D and k are equivalent to 100% of both
% proof
[~,c_2test]=func_proj(2*D,2*k,h);
test2 = cnew ~= c_2test;
ts2 = sum(sum(test2));
if ts2 ==0
    disp('The case with 200% of both D and k is equivalent to the base case')
else
    disp('The assumption is wrong')
end
[~,c_half_test]=func_proj(D/2,k/2,h);
testh = cnew ~= c_half_test;
tsh = sum(sum(testh));
if tsh ==0
    disp('The case with 50% of both D and k is equivalent to the base case')
else
    disp('The assumption is wrong')
end

% 200% of D, base k
[~,c_2D]=func_proj(2*D,k,h);

% 50% of D, base k
[~,c_half_D]=func_proj(D/2,k,h);

% 50% of k, base D
[~,c_half_k] = func_proj(D,k/2,h);
testhk = c_half_k ~= c_2D;
tshk = sum(sum(testhk));
if tshk ==0
    disp('The case with 50% of k and base D is equivalent to the case with 200% of D and base k')
else
    disp('The assumption is wrong')
end

% 200% of k, base D
[~,c_2k] = func_proj(D,2*k,h);
test2k = c_2k ~= c_half_D;
ts2k = sum(sum(test2k));
if ts2k ==0
    disp('The case with 200% of k and base D is equivalent to the case with 50% of D and base k')
else
    disp('The assumption is wrong')
end

% 50% of D and 200% of K
[~,c_hD_2k]=func_proj(D/2,2*k,h);


% 200% of D and 50% of k
[~,c_2D_hk]=func_proj(2*D,k/2,h);

% f1 = figure;
% surf(x,y,cnew,'FaceColor','r')
% f1.Name = 'Base Case';
% 
% f2 = figure;
% hold on
% surf(x,y,cnew,'FaceColor','r')
% surf(x,y,c_2D)
% f2.Name = 'Base vs 200% D';
% 
% f3 = figure;
% hold on
% surf(x,y,cnew,'FaceColor','r')
% surf(x,y,c_half_D)
% f3.Name = 'Base vs 50% D';
% 
% f4 = figure;
% hold on
% surf(x,y,cnew,'FaceColor','r')
% surf(x,y,c_2D_hk)
% f4.Name = 'Base vs 200% D and 50% k';
% 
% f5 = figure;
% hold on
% surf(x,y,cnew,'FaceColor','r')
% surf(x,y,c_hD_2k)
% f5.Name = 'Base vs 50% D and 200% k';
toc