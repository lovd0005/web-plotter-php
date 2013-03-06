function [f, omega] = LIGO_S5(f,numpoints)

fgmin = 41.5;
fgmax = 169.25;

omega = ((f >=  fgmin) .* (f <= fgmax))*9e-6;

end

