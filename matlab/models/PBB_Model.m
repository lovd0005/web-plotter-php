%%%%%%%%%%%%%%%%%%%%%%
% Pre-Big-Bang Model % 
%%%%%%%%%%%%%%%%%%%%%%

function [f, Omega_PBB] = PBB_Model(f,Mu,F1,Fs,numpoints)

%xmin = 1;
%xmax = 1000;
%numpoints = 10;


%  f(1) = (xmin);
%   f(numpoints) = (xmax);
%   slope = (log10(xmax) - log10(xmin))/(numpoints-1);

%   for i = 2:numpoints-1
%    f(i) = f(i-1)*10^(slope);
%   end
   
%Mu = 1.5;
%F1 = 1e10;
%Fs = 100;

% Constants
H = 3.24078e-18; %Hubble
M = 1.851256e43; %Planck Mass

disp('*************************************************')
disp('Beginning Pre-Big Bang Calculation')

%Calculate energy density
Omega_PBBB = zeros(1,numpoints);
for i=1:numpoints
a = 1/(1+sqrt(3));
b = (a/48)*2^(2*Mu)*(2*Mu-1)^2*(gamma(Mu))^2;
c = ((2*pi*Fs)^2/(H*M))^2*(F1/Fs)^(2*Mu+1)*(f(i)/Fs)^(5-2*Mu);
HJ1 = besselh(0,2,a*f(i)/Fs)*(besselj(Mu-1,f(i)/Fs)-(Mu/f(i))*besselj(Mu,f(i)/Fs));
HJ2 = besselh(1,2,a*f(i)/Fs)*besselj(Mu,f(i)/Fs);
HJ3 = ((1-a)/(2*a))*(Fs/f(i))*besselh(0,2,a*f(i)/Fs)*besselj(Mu,f(i)/Fs);
Omega_PBBB(i) = b*c*(HJ1+HJ2-HJ3)*conj(HJ1+HJ2-HJ3);
end

Omega_PBB = Omega_PBBB*.5184;

disp('Finished Pre-Big Bang Calculation')
disp('*************************************************')

%loglog(f, Omega_PBB, 'marker', '*');
%plot(f, f, 'marker', '*');
%keyboard

end




