tmin = 0.02;
if tmin ==0.02
  load('BC-tau_20-a_05.mat');
else
  load('BC-tau_100-a_05.mat');
end

% type = ['h' 'f' 'w' 'n' 's'];
% sfr = 'h';
r = 0.001:0.001:10;
fit.h = zeros(1,10000);
fit.f = zeros(1,10000);
fit.w = zeros(1,10000);
fit.n = zeros(1,10000);
fit.s = zeros(1,10000);

for zz = 1:10000

zsup = zz/1000;
z = 0:zsup/100:zsup;

temp.h = interp1(reds,rate.h,z,'linear','extrap');
temp.f = interp1(reds,rate.f,z,'linear','extrap');
temp.w = interp1(reds,rate.w,z,'linear','extrap');
temp.n = interp1(reds,rate.n,z,'linear','extrap');
temp.s = interp1(reds,rate.s,z,'linear','extrap');

% rate = eval(['rate.' sfr]);
% temp = interp1(reds,rate,z,'linear','extrap');
fit.h(zz) = trapz(z,temp.h);
fit.f(zz) = trapz(z,temp.f);
fit.w(zz) = trapz(z,temp.w);
fit.n(zz) = trapz(z,temp.n);
fit.s(zz) = trapz(z,temp.s);

end

save('BC_tau_20_a_05_int.mat','r','fit');