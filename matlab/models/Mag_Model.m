function [f,Omega] = Mag_Model(f,B,epsilon,P0,lambda,Iz,sfr)
% Stochastic Energy Spectrum of Magnetar Model of Neutron Star
% B -
% epsilon -
% P0 -
% lambda - mass fraction rate
% Iz -
% sfr - star formation history 

constant; % load physics constants

% Parameters of Neutron Star
% M = (1.4)*1.989e33;     % gram
R = 1e6;                % cm
% Iz = 0.4*M*R^2;         % g*cm^2
% moment of inertia along z axis assumming a uniform perfect sphere.

% Parameters
fgmin = 0;
fgmax = 2/P0;		% per second
%the max frequency of the GW that could be produced

% Local Rate
% Mass Fraction
% mMin = 8;			% solar mass (Msolar)
% mMax = 40;			% solar mass (Msolar)
% Ap = lambda_NS();	% per Msolar
% the mass fraction of the neutron star progenitors
% Ab = xi*Ap;		% per Msolar
% the mass fraction of the progenitors 
% Local rate
% if type == 'l'
%   rho0 = lambda;
% elseif type == 'm'
%   rho0 = lambda*star_form_rate('h', 0);
% else
%   rho0 = 0;
% end
% rho0 = lambda*star_form_rate('h', 0);


% Parameter of Gravitational spectral energy emitted by a single source
% Kb = (12*pi^4)/(5*G*c^2)*(R^10/Iz)*(B^2)*(g^2);		% s^4*cm^3*G^2
% Rb = (12*pi^2)/(5*G*c^2)*(R^10/Iz^2)*(B^2)*(g^2);	% s^4*cm*G^2/g

Kb = (192*pi^4*G)/(5*c^2*R^6)*(Iz)^3*epsilon^2/B^2;
Rb = Kb/(pi^2*Iz);
% g is the product of beta and sin^2 alpha

% Const = ((8*pi*G)/(3*c^2*(H0Mpc)^3))*rho0/star_form_rate('h',0)*(Kb/yr);	
Const = (8*pi*G)/(3*c^2*H0^3)*lambda*Kb/yr/Mpc^3; %Non integral part

disp('*************************************************')
disp('Beginning Magnetar Calculation')
%% Finally get omega    

Omega = zeros (1,length(f));

for i = 1 : length(f)  
  if  ((f(i) >=  fgmin) && (f(i)<= fgmax))     
    if (fgmax/f(i) - 1 < 6)
			zmax = fgmax/f(i) - 1;
		else
			zmax = 6;
    end    
		z = 0:zmax/1000:zmax;

%		numer = (1+z).*Rc(z,h0);  	% Msolar/(Mpc^3*yr)
		numer = (1+z).^2.*star_form_rate(sfr,z);
		% the numerator of the integration part

		rest_denom = (1+(Rb*(f(i)).^2)*(1+z).^2);		% dimensionless
		denom = Ez(OmegaM,OmegaV,z).*rest_denom;		% dimensionless
		% the denominator of the integration part

		integrand = numer./denom;

		if (size(z) == 1)
			integral = 0;
		else
			integral = trapz(z,integrand);
		end

		Omega(i) = Const*f(i)^4*integral;
  end  
end

disp('Finished Magnetar Calculation')
disp('*************************************************')
end
