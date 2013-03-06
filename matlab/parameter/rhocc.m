function [ value ] = rhocc(z, tmin, sfr, zsup)
% RHOCC Summary of this function goes here
%   Detailed explanation goes here

%% ________the coalescence rate per comoving volumn__________
% tsup = (cosmic_time(6)-cosmic_time(z)); %upperbound of integral

% if (tsup > tmin)
%   t   = tmin:(tsup-tmin)/100:tsup;
%   tf  = cosmic_time(z)+t;
%   zf  = reverse_cosmic_time(tf);
% 
%   if (sfr == 'n')
%     tem = star_form_rate(sfr,tmax-tf)./(1+zf) ;
%   else
%     tem = star_form_rate(sfr,zf)./(1+zf);
%   end
%   
%   value = trapz(t,tem./t)/P_norm;
% else
%   
%   value = 0;
%   
% end

%% unnormalized probability distribution of the delay time ______
% tmin = 0.02;
tmax = 13.5;
P_norm = log(tmax/tmin);

%upperbound of integral

% disp(size(z));
% disp(size(tsup));
value = zeros(size(z));

for ii = 1:length(z) 
  
  tsup = cosmic_time(zsup)-cosmic_time(z(ii)); 
  
  if (tsup > tmin)
    t   = tmin:(tsup-tmin)/100:tsup;
    tf  = cosmic_time(z(ii))+t;
    zf  = reverse_cosmic_time(tf);

    if (sfr == 'n')
      tem = star_form_rate(sfr,tmax-tf)./(1+zf) ;
    else
      tem = star_form_rate(sfr,zf)./(1+zf);
    end

    value(ii) = trapz(t,tem./t)/P_norm;

  else
    value(ii) = 0;
  end
end


end

