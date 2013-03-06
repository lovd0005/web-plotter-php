function [z,Rz,rhoc] = rate(sfr,tau,rho0)
%%
% rate.m
% Created by Tania Regimbau on 4/1/09
% Report bugs to regimbau@oca.eu
%
% script to compute the cosmic coalescence rate Rz per redshit interval of compact binaries
% see gr-qc/09012958 for details about the calculations
% [z,Rz] = rate(sfr,tau,rho0) 
% returns an ascii file rate.txt, with columns z (redshift) and Rz (rate)
% for the star formation rate sfr ('h' for Hopkins06, 'f' for Fardal07, 'w' for Wilken08, 'n' for Nagamine06)
% the minimal time delay tau (for instance 20 Myr for BNS, 100 Myr for NS-BH) 
% the local coalescence rate rho (see for instance gr-qc/09012958 or if you are member of the LSC the LIGO catalog)
% example: [z,Rz]=rate('h',20,1)
%%


%constants
c = 2.99792458*10^10;
yr = 3.1536*10^7;
Myr= yr*10^6;
Gyr= yr*10^9;

%cosmology 
h0 = 0.7;
H0 = h0*3.24*10^(-18);
H0mpc = h0*10^7;
Ez = @(z) (0.3*(1+z).^3+0.7).^0.5;
phidr = @(z) 1./Ez(z);
phir = @(z) quad(phidr,0,z);
phiV = @(z) phir(z).^2*phidr(z);
phidt = @(z) 1./((1+z).*Ez(z));
phit = @(z) quad(phidt,0,z);
Kt = 1/H0/Gyr;
tgyr = @(z) Kt*phit(z); 

% cosmic star formation rate
switch sfr
    %Hopkins & Beacom 2006;
    case 'h'
     rho = @(z) 0.7*(0.017+0.13*z)./(1+(z./3.3).^5.3);
    %Fardal 2007;
    case 'f'
     rho = @(z) (0.0103+0.088*z)./(1+(z./2.4).^2.8);
    %Wilken 2008;
    case 'w'
     rho = @(z) (0.014+0.11.*z)./(1+(z./1.4).^2.2);
    %Nagamine et al. 2006 (fossil model)
    case 'n'
     %disk   
     rhod = @(t) 0.056.*(t./4.5).*exp(-t./4.5);
     %bulge
     rhob = @(t) 0.198.*(t./1.5).*exp(-t./1.5);
     rho = @(t) rhod(t) + rhob(t);  
end

% probability of the delay (evolution+merger)
tmax = 13.5;
tsup = tgyr(10);
tmin = tau * 0.001;
Kptd = 1/(log(tmax)-log(tmin));

% cosmic time as a function of redshift
z  = zeros(601,1);
t  = zeros(601,1);
dV = zeros(601,1);
r  = zeros(601,1);
dL = zeros(601,1);

for k=1:601
    z(k)=0.01*(k-1);
    t(k)=tgyr(z(k));
    dV(k)=phiV(z(k));
    r(k)=(c/H0mpc)*phir(z(k));
    dL(k)=(c/H0mpc)*(1+z(k)).*phir(z(k));
end

% calculate coalescence rate per unit of comoving volume 
% as a function of cosmic time
tc    = zeros(126,1);
rhoct = zeros(126,1);
for k=1:126
    tc(k) = 0.1*(k-1);
    dtd = 0.001;
    td=tmin:0.001:tsup-tc(k);
    tf = tc(k)+td;
    zf = interp1(t,z,tf,'linear','extrap');
    if (sfr=='n')
        Ftd = rho(tmax-tf)./(1+zf);
    else
    Ftd = rho(zf)./(1+zf);
    end
    rhoct(k) = trapz(td,Ftd./td);
end
rhoct = Kptd.*rhoct;

% as a function of redshift
rhoc = interp1(tc,rhoct,t,'linear','extrap');

% coaslescence rate per redshift interval
Rz = rhoc.*dV;

norm = 4*pi*(c/H0mpc)^3/Myr/rhoc(1)*rho0;
Rz = norm*Rz;
% save to ascii file
z=z';Rz=Rz';M=[z Rz];
save rate.txt M -ASCII

figure(1)
plot(z,rhoc,'r');hold on
xlabel('z','FontSize',14)
ylabel('dR(z) / dz','FontSize',14)
return
