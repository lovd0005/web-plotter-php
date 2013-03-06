function [ f, Omega ] = r_mod( f,P0,lambda,sfr )
% R_MOD Summary of this function goes here
% gravitational wave background from r mode

constant; % get values of some constants
m = 1.4;
M = m*Msolar;
R = 1E6;
P0 = P0*1e-3; % ms into s

% keplerian velocity  (Ferrari 99) 
% http://arxiv.org/pdf/astro-ph/9806357v2;
CC = 7.8*10^3; % (Friedmann, Ipser & Parker 1989)

Kepler_v = CC*sqrt(m*10^6/R);
Pk = 2*pi/Kepler_v*10^3;  % of unit ms

Kepler_f = 0.076*Kepler_v;
Pf = 2*pi/Kepler_f*10^3;


% INITIAL PERIOD
% Gaussian distribution
% P0Mean = 50;
% P0Sigma = 50; 
% x1 = Pk:(50000-Pk)/1000:50000;
% y1 = trapz(x1,normpdf(x1,P0Mean,P0Sigma));
% gP = @(x) normpdf(x,P0Mean,P0Sigma)/y1;

% FRACTION OF THE NS POPULATION
% x = Pk:(Pf-Pk)/1000:Pf;
% ksi = trapz( x , gP(x) );
% ksi = 0.01;
% gP2 = @(x) gP(x)/ksi;

% Local rate
% rho0 = lambda*star_form_rate('h', 0);

% gravitational frequency as a function of the period (kHz);
fgmax = 4/3/Pk*10^3;
fgmin = 0;

Er = @(x) (0.261 - 1.5*1.635*10^(-2))*M*(R^2)*(2*pi)^2*(1./x.^2 - 1/Pf^2);

Kr = @(x) 2*Er(x)./((4/3./x).^2);

dEr =@(f,fsup) f.*(f < fsup);

% fact = trapz(x,gP2(x).*Kr(x));

% Const = (8*pi*G)/(3*c^2*H0Mpc^3)*rho0/star_form_rate('h',0)/yr;
  Const = (8*pi*G)/(3*c^2*H0^3)*lambda/yr*Kr(P0)/Mpc^3;

%% Finally get omega    
Omega = zeros (1,length(f));

for i = 1 : length(f)  
  if  ((f(i) >=  fgmin) && (f(i)<= fgmax))     
    if (fgmax/f(i) - 1 < 6)
			zmax = fgmax/f(i) - 1;
		else
			zmax = 6;
    end    
		z = 0:zmax/100:zmax;                
	%	denom = Ez(OmegaM,OmegaV,z).*(1+z).^2;		 
    denom = Ez(OmegaM,OmegaV,z);  
		integrand = dEr(f(i)*(1+z),fgmax).*star_form_rate(sfr,z)./denom;

		if (size(z) == 1)
			integral = 0;
    else
      % fprintf('%5.0f %5.0f %5.0f',size(z), size(integrand),size(Ix));
			integral = trapz(z,integrand);
		end

		Omega(i) = Const*f(i)*integral;
	end
end

end
