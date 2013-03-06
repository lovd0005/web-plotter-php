function [f, Omega] = Dual_NS (f,m,lambda,sfr)
% Stochastic Energy Spectrum of Double Neutron Star Model 	      
% f - recieved frequency
% m - average chirp mass in solar mass 
% lambda - mass fraction rate
% sfr - star formation history 

constant;

mm = m*Msolar; % convert unit to gram 
Kb = (G*pi)^(2/3)*mm^(5/3)/3;  % cm^2*g/s^(4/3)

% Cutoffs of recieved frequence range 
% per second
% here 2^(6/5)*m is the total mass of the two NS
fgmin = 10;
fgmax = c^3/(6^1.5*pi*G*(2^(6/5)*mm)); 

% dimensionless 
% max of the redshift
zmax = 6;   


% normalizer of delay time distribution
tmin = 0.02;

Const = (8*pi*G)/(3*c^2*H0^3)*lambda*Kb/yr/Mpc^3;

disp ('****************************************')
disp ('Beginning DNS Calculation')

Omega = zeros (1,length(f));

for i = 1 : length(f)  
  if  ((f(i) >=  fgmin) && (f(i)<= fgmax))    
		if (fgmax/f(i) - 1 < zmax)
			zsup = fgmax/f(i) - 1;
		else
			zsup = zmax;
		end
		Omega(i) = Const*f(i).^(2/3)*BC_integrand(tmin,zsup,sfr);
	end
end

disp ('Finished DNS Calculation')
disp ('****************************************')

end
