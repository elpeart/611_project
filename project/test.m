f1 = figure;
surf(x,y,cnew,'FaceColor','r')
f1.Name = 'Base Case';

f2 = figure;
hold on
surf(x,y,cnew,'FaceColor','r')
surf(x,y,c_2D)
f2.Name = 'Base vs 200% D';

f3 = figure;
hold on
surf(x,y,cnew,'FaceColor','r')
surf(x,y,c_half_D)
f3.Name = 'Base vs 50% D';

f4 = figure;
hold on
surf(x,y,cnew,'FaceColor','r')
surf(x,y,c_2D_hk)
f4.Name = 'Base vs 200% D and 50% k';

f5 = figure;
hold on
surf(x,y,cnew,'FaceColor','r')
surf(x,y,c_hD_2k)
f5.Name = 'Base vs 50% D and 200% k';