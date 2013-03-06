function [ f, Omega ] = bar_Model( f,P0,lambda,sfr )
% GW background from secular bar modes
%   Detailed explanation goes here

constant;

% M = 1.4*1.989*10^33;
% R = 10*10^5;
% betamin = 0.1375;
% betamax = 0.2738;

%% Fits from the paper of Lai and Shapiro
% period = @(b) (1.127 - 4.621*b + 17.108*b^2);
  nusup = @(P) (10^4*(-5.3 + 15.76*P - 15.5*P^2 + 5.1*P^3));
% 
% Pmin = period(betamin);
% Pmax = period(betamax);

Pmin = 0.8151;
Pmax = 1.1443;

% if (betamin > betamax)
%   domain = 0;
%   Omega  = 0;
% else
    fgmin = 0;
    fgmax = nusup(Pmax);
% end;

dEr =@(x,y) x.*(x < y);


%% LOCAL RATE
%  mass fraction of NS progenitors from modified Salpeter A IMF
% ksi = 0.01;
%if type == 'l'
%  rho0 = lambda;
%elseif type == 'm'
%  rho0 = lambda*star_form_rate('h', 0);
%else
%  rho0 = 0;
%end


E0 = @(P) 10^52*(-6.12 + 10.64*P - 3.84*P^2);
Kr = @(x) 2*E0(x)/(nusup(x)^2).*(x > Pmin).*(x < Pmax);

% const = (8*pi*G)/(3*c^2*H0Mpc^3)*rho0/star_form_rate('h', 0)/yr*ksi*Kr(P0);
% Const = (8*pi*G)/(3*c^2*H0Mpc^3)*rho0/star_form_rate('h', 0)/yr*Kr(P0);
  Const = (8*pi*G)/(3*c^2*H0Mpc^3)*lambda/yr*Kr(P0);


Omega = zeros (1,length(f));

for i = 1 : length(f)  
  if  ((f(i) >=  fgmin) && (f(i)<= fgmax))
    if (fgmax/f(i) - 1 < 6)
      zmax = fgmax/f(i) - 1;
    else
      zmax = 6;
    end;
    z = 0:zmax/1000:zmax;
  % denom = Ez(OmegaM,OmegaV,z).*(1+z).^2;    % dimensionless
    denom = Ez(OmegaM,OmegaV,z);    % dimensionless
    integrand = dEr(f(i)*(1+z),fgmax).*star_form_rate(sfr,z)./denom;

    if (size(z) == 1)
      integral = 0;
    else
      integral = trapz(z,integrand);
    end

    Omega(i) = Const*f(i)*integral;

  end
end



end

