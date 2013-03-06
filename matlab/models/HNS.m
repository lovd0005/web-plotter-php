%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% hot young rapidly rotating neutron stars % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Omega_HNS = HNS(f,numpoints)

disp('*************************************************')
disp('Beginning DNS Calculation')

%% Finally get omega    

Omega_HNS = zeros(1,numpoints);
%A = zeros(1,numpoints);

for i=1:numpoints
    
if (f(i)>24 && f(i) < 120)
    Omega_HNS(i) = 2.4e-10/0.7*(f(i)^2/24^2-1);
elseif (f(i)>= 120 && f(i) <280)
    Omega_HNS(i) = 4.0408e-13/0.7*f(i)^2;
elseif (f(i)>= 280 && f(i) <1400)
    Omega_HNS(i) = 3.3e-8/0.7*(1-f(i)^2/1400^2);
else 
    Omega_HNS(i) = 0;
end

disp('Finished HNS Calculation')
disp('*************************************************')

%disp(Omega_HNS);
%keyboard
%loglog(f,Omega_HNS,'marker','*');
%disp('number of zeros is:')
%disp(numzeros)
end
