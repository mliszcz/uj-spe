% U

f0 = 73609; % hZ
f = 2*f0;

U = 9.200;

R =  509; % Om
C = 4.25 * 10^(-9); % F

Zr = R;
Zc = -j/(2*pi*f*C);
Zz = Zr + Zc;

Ur = (Zr)/(Zc+Zr)*U;

z1 = U;  
z2 = Ur;

absU = abs(U);
absUr = abs(Ur);

function retval = rad2deg (v)
  retval = v * 180 / pi;
endfunction

angU = rad2deg(arg(U));
angUr = rad2deg(arg(Ur));
 
% Calculate a suitable axis limit based on phasors
m = 1.2 * max([real([z1 z2]) imag([z1 z2])]);
 
% Create a new figure window
figure
hold on
 
% Plot phasors one at a time
quiver(0,0,real(z1),imag(z1), "linewidth", 3, "maxheadsize", 0.1, "color", "blue")
quiver(0,0,real(z2),imag(z2), "linewidth", 3, "maxheadsize", 0.1, "color", "green")
 
% Add horizontal and vertical axes
plot([-m m],[0 0])
plot([0 0],[-m m])
 
% Set axis limits and aspect ratio
axis([-m,m,-m,m], 'square')