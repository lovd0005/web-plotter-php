reds = 0:0.001:10;
denom = Ez(0.3,0.7,reds).*(1+reds).^(1/3);
% rate = rhocc_a(reds,tmin,sfr,10,alpha)./denom;

rate.h = rhocc_a(reds,0.1,'h',10,-0.5)./denom;
rate.f = rhocc_a(reds,0.1,'f',10,-0.5)./denom;
rate.w = rhocc_a(reds,0.1,'w',10,-0.5)./denom;
rate.n = rhocc_a(reds,0.1,'n',10,-0.5)./denom;
rate.s = rhocc_a(reds,0.1,'s',10,-0.5)./denom;  
save('BC_integ_100.mat','reds','rate');

