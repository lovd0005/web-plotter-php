function [ value ] = BC_rate(z,tmin,sfr)
%   BINARY_COAL_RATE Summary of this function goes here
%   Detailed explanation goes here

Rzf = @(z) star_form_rate(sfr,z)./(1+z);

%% ______The probability distribution of the delay time______
% tmin = 0.02;
tmax = 13.5;
Prob_distri = @(t) 1./(t*log(tmax/tmin)).*(tmax >t> tmin);


%% ________the coalescence rate per comoving volumn__________
tsup    = (cosmic_time(6)-cosmic_time(z))*(cosmic_time(z)+tmax > cosmic_time(6))...
	      + tmax*(cosmic_time(z)+tmax <= cosmic_time(6)); %upperbound of integral

if (tsup > tmin)
    t   = tmin:(tsup-tmin)/1000:tsup;
    zf  = reverse_cosmic_time(cosmic_time(z)+t);
    tem = Rzf(zf).*Prob_distri(t);
    value = trapz(t,tem);
else
    value = 0;
end

end

