function value = BC_Iz(tmin,alpha)
reds = 0:0.001:10;
denom = Ez(0.3,0.7,reds).*(1+reds).^(1/3);
% rate = rhocc_a(reds,tmin,sfr,10,alpha)./denom;

rate.h = rhocc_a(reds,tmin,'h',10,alpha)./denom;
rate.f = rhocc_a(reds,tmin,'f',10,alpha)./denom;
rate.w = rhocc_a(reds,tmin,'w',10,alpha)./denom;
rate.n = rhocc_a(reds,tmin,'n',10,alpha)./denom;
rate.s = rhocc_a(reds,tmin,'s',10,alpha)./denom;  

if tmin ~= 0
    switch alpha
      case -0.5
        fnm = ['BC_tau_' num2str(1000*tmin) '_a_05'];
      case -1        
        fnm = ['BC_tau_' num2str(1000*tmin) '_a_01'];
      case -1.5
        fnm = ['BC_tau_' num2str(1000*tmin) '_a_15'];
    end
else
    fnm = ['BC_tau_' num2str(1000*tmin)];
end

save([fnm '.mat'],'reds','rate');

value = 0;

end
