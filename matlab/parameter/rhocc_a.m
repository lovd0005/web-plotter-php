function [ value ] = rhocc_a(z, tmin, sfr, zmax,a)
% RHOCC Summary of this function goes here
%   Detailed explanation goes here

tmax = 13.5;
if a ~= -1
  P_norm = (tmax^(a+1)- tmin^(a+1))/(a+1);
else 
  P_norm = log(tmax/tmin);
end
    
value = zeros(size(z));

if tmin ~= 0
    for ii = 1:length(z) 
        disp([ii length(z)]);
        tsup = cosmic_time(zmax)-cosmic_time(z(ii)); 
        if (tsup > tmin)
            t   = tmin:(tsup-tmin)/100:tsup;
            tf  = cosmic_time(z(ii))+t;
            zf  = reverse_cosmic_time(tf);
            
            if (sfr == 'n')
                tem = star_form_rate(sfr,tmax-tf)./(1+zf) ;
            else
                tem = star_form_rate(sfr,zf)./(1+zf);
            end    
            value(ii) = trapz(t,tem.*(t.^a))/P_norm;
        else
            value(ii) = 0;
        end 
    end 
else 
    value = star_form_rate(sfr,z)./(1+z);
end

end

