%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The coalescence rate of DNS per unit of comoving volumn %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function value = DNS_coal_rate(z)

% z must be a scalar since cosmic_time() only accept scalar input

%% ______progenitor formation rate per moving volume________
%{ 
the progenitor formation rate per moving volume given on the 
time scale of the observer is
    lambda*Rc(z,ho)/(1+z)
where lambda is the mass fraction converted into the 
proginetors and Rc is the cosmic star formation rate per 
comoving volumn (SFR) at the time of formation z.

Here we just take the variable part by taking lambda off.
Lambda will be added into Const in Dual_NS.m
%}

Rcf = @(z) Rc(z,0.7)./(1+z);




%% ______The probability distribution of the delay time______
tmin = 0.02;
tmax = 13.5;
Prob_distri = @(t) 1./(t*log(tmax/tmin)).*(tmax>t>tmin);




%% ________the coalescence rate per comoving volumn__________
tsup    = cosmic_time(z);
if (tsup > tmin)
    t   = tmin:(tsup-tmin)/1000:tsup;
    zf  = reverse_cosmic_time(tsup-t);
    tem = Rcf(zf).*Prob_distri(t);
    value = trapz(t,tem).*(1+z);
else
    value = 0;
end

end
