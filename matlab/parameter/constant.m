% General

c = 2.99792458e10;      % cm per second --light speed

G = 6.67259e-8;         % cm^3/(g*s^2)  --gravitational constant

yr = 3.1536e7;          % second per year

Myr= yr*10^6;           % second per million year

Gyr= Myr*10^3;          % second per gillion year

% Cosmology

OmegaM = 0.3;           %

OmegaV = 0.7;           %

h0 = 0.7;               %

Mpc = 3.085e24;         % cm            --

Msolar = 1.989e33;      % gram          --solar mass

H0Mpc = h0*10^7;        % cm/(s*Mpc)    -- million parsec 

H0 = H0Mpc/Mpc;		% per second -- hubble constant

rho = 3*H0^2/(8*pi*G);  % g/cm^3        --% critical density

% save ('constant');
