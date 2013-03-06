function [ value ] = BC_rate(z,tmin,sfr)
%   BINARY_COAL_RATE Summary of this function goes here
%   Detailed explanation goes here

%Rzf = @(z) star_form_rate(sfr,z)./(1+z);

%% unnormalized probability distribution of the delay time ______
tmax = 13.5;
P_norm = log(tmax/tmin);

%% ________the coalescence rate per comoving volumn__________
% tsup = (cosmic_time(6)-cosmic_time(z)); %upperbound of integral
tsup = (cosmic_time(10)-cosmic_time(z)); %upperbound of integral

if (tsup > tmin)
  t   = tmin:(tsup-tmin)/1000:tsup;
  tf  = cosmic_time(z)+t;
  zf  = reverse_cosmic_time(tf);
  
  if (sfr == 'n')
    tem = star_form_rate(sfr,tmax-tf)./(1+zf) ;
  else
    tem = star_form_rate(sfr,zf)./(1+zf);
  end
  
  value = trapz(t,tem./t)/P_norm;
else
  value = 0;
end

end

