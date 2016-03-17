% impedancja zastepcza

f0 = 73609; % hZ
f = 0.5*f0;

R = 509; % Om
C = 4.25 * 10^(-9); % F

Zr = R;
Zc = -j/(2*pi*f*C);
Zz = Zr + Zc;

z1 = Zr;  
z2 = Zc;
z3 = Zz;
 
% Calculate a suitable axis limit based on phasors
m = 2.2 * max([real([z1 z2 z3]) imag([z1 z2 z3])]);
 
% Create a new figure window
figure
hold on
 
% Plot phasors one at a time
quiver(0,0,real(z1),imag(z1), "linewidth", 3, "maxheadsize", 0.1, "color", "blue")
quiver(0,0,real(z2),imag(z2), "linewidth", 3, "maxheadsize", 0.1, "color", "green")
quiver(0,0,real(z3),imag(z3), "linewidth", 3, "maxheadsize", 0.1, "color", "red")
 
% Add horizontal and vertical axes
plot([-m m],[0 0])
plot([0 0],[-m m])
 
% Set axis limits and aspect ratio
axis([-m,m,-m,m], 'square')