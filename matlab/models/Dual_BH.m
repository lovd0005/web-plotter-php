function [f, Omega] = Dual_BH (f,mc,lambda,sfr)


constant;

Kb = (G*pi)^(2/3)*(mc*Msolar)^(5/3)/3;

Const = (8*pi*G)/(3*c^2*H0^3)*lambda*Kb/yr/Mpc^3;
 
r = mc/8.7; % ratio of the chirp mass and 8.7 solar mass

fgmin = 0;

v1 = 404/r; %  v1= 404 for mc = 8.7 solar mass
v2 = 807/r;
sigma = 237/r;
fgmax = 1153/r; % per second
zmax = 6;    % dimensionless --max of the redshift

% normalizer of delay time distribution
tmin = 0.1;

disp ('*************************************************')
disp ('Beginning BBH Calculation')

Omega = zeros (1,length(f));

for i = 1 : length(f)  
  if  ((f(i) >=  fgmin) && (f(i)<= fgmax))    
    if  (fgmax/f(i) - 1 < zmax)			
      zsup = fgmax/f(i) - 1;      
    else
      zsup = zmax;
    end
    
    if (f(i) < v1)
      v = f(i)^(-1/3);
    elseif (f(i) >= v1) && (f(i)<= v2 )
      v = f(i)^(2/3)/v1;
    else
      v = f(i)^2/(1+ 4*(f(i)-v2)^2/sigma^2)^2/v1/v2^(4/3);
    end
    
		Omega(i) = Const*f(i)*v*BC_integrand(tmin,zsup,sfr);    
  end
end        

disp ('Finished BBH Calculation')
disp ('****************************************')    
end