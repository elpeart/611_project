f2 = figure;
hold on
surf(x,y,cnew,'FaceColor','r','EdgeColor','none')
surf(x,y,c_2D,'EdgeColor','none')
f2.Name = 'Base vs 200% D';
legend('Base Case','200% D, base k')
legend Location Northwest

f3 = figure;
hold on
surf(x,y,cnew,'FaceColor','r','EdgeColor','none')
surf(x,y,c_half_D,'EdgeColor','none')
f3.Name = 'Base vs 50% D';
legend('Base Case','50% D, base k')
legend Location NorthWest

f4 = figure;
hold on
surf(x,y,cnew,'FaceColor','r','EdgeColor','none')
surf(x,y,c_2D_hk,'EdgeColor','none')
f4.Name = 'Base vs 200% D and 50% k';
legend('Base Case','200% D, 50% k')
legend Location NorthWest

f5 = figure;
hold on
surf(x,y,cnew,'FaceColor','r','EdgeColor','none')
surf(x,y,c_hD_2k,'EdgeColor','none')
f5.Name = 'Base vs 50% D and 200% k';
legend('Base Case','50% D, 200% k')
legend Location NorthWest