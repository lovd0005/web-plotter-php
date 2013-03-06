%%%%%%%%%%%%%%%%%%%%
% Supernovae Model % 
%%%%%%%%%%%%%%%%%%%%

function Omega_SuNva = SuNva (f,alpha,beta,D,numpoints)
%% Constants 

% debugging
% xmin = 1;
% xmax = 2000;
% numpoints = 10;


 % f (1) = (xmin);
 %  f (numpoints) = (xmax);
 %  slope = (log10 (xmax) - log10 (xmin))/(numpoints-1);

  % for i = 2:numpoints-1
  %  f (i) = f (i-1)*10^(slope);
  % end
% end debugging   


% constants

yr = 3.1536e7;
Myr= yr*10^6;
Gyr= yr*10^9;
c = 2.99792458e10;
G = 6.67259e-8;
Mpc = 3.085e24;
Msolar = 1.989e33;
h0 = 0.7;
H0Mpc = h0*10^7;
H0 = H0Mpc/Mpc;
rho = 3*H0^2/(8*Pi*G);
R0 = 2e-4*Mpc^-3/yr;

% Parameters

fgmax = 4.2e3/(2^(6/5)*m1);
zmax = 6;

% Variable Parameters

m11 = m1*Msolar;
Kb = (G*pi)^(2/3)*m11^(5/3)/3;
Const = (16*pi^2*D^2*R0)/(15*G*rho)*6.76e-38/(D*D);
load ('DNS.mat', 'integran');


disp ('*************************************************')
disp ('Beginning DNS Calculation')

%% Finally get omega    

% Omega_DNS = zeros (1,numpoints);
% A = zeros (1,numpoints);

for i=1:numpoints
    z = 0:0.01:20;
    fz = f(i)*(z+1);
    Rs = @(z) (1+z).^beta.*(z<1)+2^(beta-alpha).*(1+z).*(z>=1 && z<=20);
    integ =  Rs(z)./((1+z).^2.*H0*(0.3.*(1+z).^3+0.7).^(0.5))*fz*(1+fz./200).^6*exp(-2*fz./300);
    integral = trapz (z,integ);      
    Omega_SuNva(i) = A (i)*integral;
end

disp ('Finished Supernovae Calculation')
disp ('*************************************************')

% disp (Omega_DNS);
% keyboard
% loglog (f,Omega_DNS,'marker','*');
% disp ('number of zeros is:')
% disp (numzeros)
end
