function time=cosmic_time(z)
% Cosmic (look back) time at the redshift of coalescence z 
% in unit of Gyr    

constant;
zc=0:z/10000:z;
temp = 1./(Ez(0.3,0.7,zc).*(1+zc));
time = trapz(zc,temp)/(H0*Gyr);

end