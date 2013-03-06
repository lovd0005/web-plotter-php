function [domain, omega] = LISA(f,numpoints)

xx = load('LISA20pmrtHzPSD.dat');
domain = xx(:,1);
omega = (xx(:,2)/4.1e-22).^2 .* (xx(:,1)/100).^3;

end


