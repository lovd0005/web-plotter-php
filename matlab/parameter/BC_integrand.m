function val = BC_integrand(tmin,zsup,sfr)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% integral part of the calculation of GW spectrum of rate %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use the rate_coal_rate function to get the intergral part at each z 
% save the date for furture use since it takes a long time 
% to generate the date. We comment out the code after getting 
% the date.

% if tmin ==0.02
  % load('rate_integrand_20.mat');
% else
  % load('rate_integrand_100.mat');
% end
% z = 0:zsup/100:zsup;
% % temp.h = interp1(reds,rate_int.h,z,'linear','extrap');
% % temp.f = interp1(reds,rate_int.f,z,'linear','extrap');
% % temp.w = interp1(reds,rate_int.w,z,'linear','extrap');
% % temp.n = interp1(reds,rate_int.n,z,'linear','extrap');

% rate = eval(['rate_int.' sfr]);
% temp = interp1(reds,rate,z,'linear','extrap');
% val = trapz(z,temp);

if tmin ==0.02
  load('BC_fit_20.mat');
else
  load('BC_fit_100.mat');
end

f = eval(['fit.' sfr]);
val = interp1(r,f,zsup,'linear','extrap');
 
end
