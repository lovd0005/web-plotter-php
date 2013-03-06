%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% integral part of the calculation of GW spectrum of rate %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use the rate_coal_rate function to get the intergral part at each z 
% save the date for furture use since it takes a long time 
% to generate the date. We comment out the code after getting 
% the date.

tmin = 0.1;
if tmin ==0.02
  load('rate_integrand_20.mat');
else
  load('rate_integrand_100.mat');
end

% type = ['h' 'f' 'w' 'n' 's'];
% sfr = 'h';
r = 0.001:0.001:12;
fit.h = zeros(1,12000);
fit.f = zeros(1,12000);
fit.w = zeros(1,12000);
fit.n = zeros(1,12000);
fit.s = zeros(1,12000);

for zz = 1:12000

zsup = zz/1000;
z = 0:zsup/100:zsup;

temp.h = interp1(reds,rate_int.h,z,'linear','extrap');
temp.f = interp1(reds,rate_int.f,z,'linear','extrap');
temp.w = interp1(reds,rate_int.w,z,'linear','extrap');
temp.n = interp1(reds,rate_int.n,z,'linear','extrap');
temp.s = interp1(reds,rate_int.s,z,'linear','extrap');

% rate = eval(['rate_int.' sfr]);
% temp = interp1(reds,rate,z,'linear','extrap');
fit.h(zz) = trapz(z,temp.h);
fit.f(zz) = trapz(z,temp.f);
fit.w(zz) = trapz(z,temp.w);
fit.n(zz) = trapz(z,temp.n);
fit.s(zz) = trapz(z,temp.s);

end

save('BC_fit_100.mat','r','fit');
