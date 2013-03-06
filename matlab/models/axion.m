function [f, omega] = axion(f, p ,cmb, Ncmb, numpoints) 

  input = [ p cmb Ncmb numpoints];
Mathematica = '/usr/local/bin/math';
system([Mathematica ' -script matlab/models/axion_math ' num2str(input)]);
spectrum = load('/home/user1/cwu/public_html/matlab/axion_dat/output.dat');
f = spectrum(:,1);
omega  = spectrum(:,2);


%% Input
% p = 2;           % 1 or 2 
%  
% cmb = 2.4;       % works for sure between 1.2 and 2.7; 
%                  % it probably works also outside;
%                  % 1.2 is like nothing  2.7 is ruled out
%                 
% Ncmb = 58;       % Works for sure between 45 and 65; 
%                  % it probably works also outside; 
%                  % however  this is the reasonable range
% 
% val  = 4;        % Number of values of \[Xi] in tab input file  
% Nval = 3;        % Number of values of N in tab input file
% 
% 
% %% functions
% 
% f2 = load('../axion_dat/f2.dat', '-ascii');
% f2 = @(x) interp1(f2(:,1),f2(:,2),x,'linear');
% %  f2(x) in the interval   0.1 < \[Xi] < 7 needed for power spectrum  
% 
% % f3 = load('../axion_dat/f3.dat', '-ascii');
% % f3 = @(x) interp1(f3(:,1),f3(:,2),x,'linear');
% % f3(x) in the interval   0.1 < x < 7  needed for non - gaussianity
% 
% fhl = load('../axion_dat/fhl.dat', '-ascii');
% fhl = @(x) interp1(fhl(:,1),fhl(:,2),x,'linear');
% % fhl(x) in the interval   0.1 < x < 7  needed for r
% 
% 
% % Here it reads results for a grid in cmb - Ncmb; 
% % the columns in the file are 
% 
% %  1.  cmb   
% %  2.  Ncmb   *)
% %  3.  Value of the inflaton (units of reduced Planck mass to obtain the Ncmb e-folds of infaltion 
% %  4.  Time (in units of inverse inflaton mass) of inflation   
% %  5.  Time when modes of f=100 Hz leave the horizon 
% 
% 
% ll = load('../axion_dat/ll.dat', '-ascii');
% if (p == 1)
%   ll = ll(:,1);
% elseif (p ==2)
%   ll = ll(:,2);
% end
%   
% % The following part gives estimates for the required value of 
% % phi_in, and the resulting time of inflation and time at which f=100 
% % Hz leave the horizon for the input values \[Xi]comb and Ncmb; it 
% % interpolates from the table 
% 
% tab = ll(5*Nval*((1:val)-1)+1);
% Ntab = ll(5*((1:Nval) - 1) + 2);
% yintab  = zeros(val, Nval);
% tendtab = zeros(val, Nval);
% t100tab = zeros(val, Nval);
% 
% for i = 1:val
%   for j = 1:Nval
%     yintab(i,j)   = ll(5*Nval*(i - 1) + 5*(j - 1) + 3);
%     tendtab(i, j) = ll(5*Nval*(i - 1) + 5*(j - 1) + 4);
%     t100tab(i, j) = ll(5*Nval*(i - 1) + 5*(j - 1) + 5);
%   end
% end
% 
% ival = 0;
% for i=1:val
%   if (cmb > tab(i))
%     ival = i;
%   end
% end
% if (cmb == tab(val))
%   ival = val;
% end
% 
% jval = 0;
% for i=1:Nval
%   if (Ncmb > Ntab(i))
%     jval = i;
%   end
% end
% if (Ncmb == Ntab(Nval))
%   jval = Nval;
% end
% 
% % Now it knows that the input value of \[Xi]CMB is between the ival-th 
% % and the ival+1-th values in the table 
% % Now it knows that the input value of NCMB is between the jval-th 
% % and the jval+1-th values in the table 
% 
% done = 0; 
% 
% if ((ival < 1) && (jval < 1))
%   yinguess = yintab(1,1);
%   tendguess = tendtab(1,1);
%   t100guess = t100tab(1,1);
%   done =1 ;
% end
% 
% if ((done == 0) && (ival < 1) && (jval < Nval))
%   Y1 = Ntab(jval);
%   Y2 = Ntab(jval + 1);
%   F1 = yintab(1, jval);
%   F2 = yintab(1,jval +1 );
% 
%   yinguess = F1 + (F2 - F1)/(Y2 - Y1)*(Ncmb - Y1);
%   
%   F1 = tendtab(1,jval);
%   F2 = tendtab(1,jval +1);
% 
%   tendguess = F1 + (F2 - F1)/(Y2 - Y1)*(Ncmb -Y1);
%   
%   F1 = t100tab(1,jval);
%   F2 = t100tab(1,jval +1);
%   
%   t100guess = F1 + (F2 - F1)/(Y2 - Y1)*(Ncmb -Y1);
% 
%   done =2 ;
% 
% end
% 
% if ((done == 0) && (ival <1))
%   yinguess = yintab(1,Nval);
%   tendguess = tendtab(1,Nval);
%   t100guess = t100tab(1,Nval);
%   done = 3;
% end
% 
% if ((done == 0) && (ival < val) && (jval < 1))
% 
%   X1 = tab(ival);
%   X2 = tab(ival + 1);
%   F1 = yintab(ival,1);
%   F2 = yintab(ival+1,1);
% 
%   yinguess = F1 + (F2 - F1)/(X2 -X1)*(cmb - X1);
%   F1 = tendtab(ival,1);
%   F2 = tendtab(ival+1,1);
%   
%   tendguess = F1 + (F2 - F1)/(X2 - X1)*(cmb - X1);
% 
%   F1 = t100tab(ival,1);
%   F2 = t100tab(ival+1,1);
% 
%   t100guess = F1 + (F2 - F1)/(X2 - X1)*(cmb - X1);
% 
%   done = 4;
% end
% 
% if ( (done == 0) && (ival < val) && (jval < Nval))
% 
%   X1 = tab(ival); 
%   X2 = tab(ival + 1);
%   Y1 = Ntab(jval); 
%   Y2 = Ntab(jval + 1);
%   F11 = yintab(ival,jval);
%   F12 = yintab(ival,jval +1);
%   F21 = yintab(ival+1,jval);
%   F22 = yintab(ival+1,jval +1);
% 
%   yinguess = ((F22*(Y1 - Ncmb) +F21*(Ncmb - Y2))*(X1 - cmb) ...
%            + F12*(Ncmb - Y1)*(X2-cmb) +F11*(Ncmb - Y2)*(cmb-X2))/(X1 - X2)/(Y1-Y2);
% 
%   F11 = tendtab(ival,jval);
%   F12 = tendtab(ival,jval + 1);
%   F21 = tendtab(ival+1,jval);
%   F22 = tendtab(ival+1,jval + 1);
%     
%   tendguess = ((F22*(Y1 - Ncmb) +F21*(Ncmb - Y2))*(X1 - cmb) ...
%            + F12*(Ncmb - Y1)*(X2-cmb) +F11*(Ncmb - Y2)*(cmb-X2))/(X1 - X2)/(Y1-Y2);
% 
%   F11 = t100tab(ival,jval);
%   F12 = t100tab(ival,jval + 1);
%   F21 = t100tab(ival+1,jval);
%   F22 = t100tab(ival+1,jval + 1);
% 
%   t100guess = ((F22*(Y1 - Ncmb) +F21*(Ncmb - Y2))*(X1 - cmb) ...
%            + F12*(Ncmb - Y1)*(X2-cmb) +F11*(Ncmb - Y2)*(cmb-X2))/(X1 - X2)/(Y1-Y2);
% 
%   done = 5;
% end
% 
% if ((done == 0) && (ival < val))
%   X1 = tab(ival);
%   X2 = tab(ival + 1);
%   F1 = yintab(ival,Nval); 
%   F2 = yintab(ival + 1,Nval);
%   
%   yinguess = F1 + (F2 - F1)/(X2 - X1)*(cmb - X1);
%  
%   F1 = tendtab(ival,Nval);
%   F2 = tendtab(ival+1,Nval);
%     
%   tendguess = F1 + (F2 - F1)/(X2 - X1)*(cmb - X1);
% 
%   F1 = t100tab(ival,Nval);
%   F2 = t100tab(ival+1,Nval);
% 
%   t100guess = F1 + (F2 - F1)/(X2 - X1)*(cmb - X1);  
%   
%   done = 6;  
% end
% 
% if ((done == 0) && (jval < 1))
%   
%   yinguess = yintab(val,1);
%   tendguess = tendtab(val,1);
%   t100guess = t100tab(val,1);
%   done = 7;
%   
% end
% 
% if ((done == 0) && (jval < Nval))
% 
%   Y1 = Ntab(jval);
%   Y2 = Ntab(jval+1);
%   F1 = yintab(val,jval);
%   F2 = yintab(val,jval+1);
%   
%   yinguess = F1 + (F2 - F1)/(Y2 - Y1)*(Ncmb - Y1);  
%   
%   F1 = tendtab(val,jval);
%   F2 = tendtab(val,jval+1);
%     
%   tendguess = F1 + (F2 - F1)/(Y2 - Y1)*(Ncmb - Y1);   
%   
%   F1 = t100tab(val,jval);
%   F2 = t100tab(val,jval+1);
%   
%   t100guess = F1 + (F2 - F1)/(Y2 - Y1)*(Ncmb - Y1);   
%   done = 8;
% 
% end
% 
% if (done == 0) 
% 
%   yinguess = yintab(val,Nval);
%   tendguess = tendtab(val,Nval);
%   t100guess = t100tab(val,Nval);
%   done = 9;
%   
% end
% 
% % Interpolation has been done;
% % these values are the initial ones in the Newton's method to find the
% % exact value of phi_in that gives the required duration of inflation
% 
% 
% % Now 10 iterations of Newton's method to
% % determine the precise value of phi_in leading to 60 e folds
% 
% efolds = zeros(1:3);
% 
% for iter = 1:3
%   tin = 0;
%   tend = tendguess + 2;
%   in(1) = yinguess + 0.01;  
%   in(2) = yinguess - 0.01;
%   in(3) = yinguess;
% 
%   for ii = 1:3
%     
%     yin = in(ii);
%     % normalization end
%     
%     Psnum = 2.445e-9;
%     
%     parA = (1+ p^2/6/yin^2)^2*yin^(2+p)*f2(cmb)*exp(4*pi*cmb)/12/pi^2/p^3;
%     parC = (1+ p^2/6/yin^2)^(-2)*12*pi^2*p^3*Psnum/yin^(2+p);
%     
%     parM = (-1 + sqrt(1+4*parA*parC))/2/parA;
%     % 
%     % normalization end
%     
%     zin = - sqrt(p/3)/yin^(1-p/2);
%     
%     ain = 1;
%     
%     hhin = yin^(p/2)*sqrt((1+ p^2/6/yin^2)/3/p);
%      
%     % options = odeset('RelTol',1e-7);
%     [t,sol] = ode23tb(@(t,y) axionode(t,y,p,yin, cmb,parM,hhin,zin), [tin tend], [yin zin ain]);
%     
%     add = 2.4e-4*cmb*yin*parM/3/p ...
%         * sqrt(1 + p^2/6/yin^2)*sol(:,2) ...
%         .* sqrt(sol(:,2).^2/6 + abs(sol(:,2)).^p/3/p).^7 ...
%         .* (cmb *sol(:,2)* hhin /zin).^(-4) ...
%         .* exp(2*pi*cmb *sol(:,2)* hhin /zin./sqrt(sol(:,2).^2/6 + abs(sol(:,1)).^p/3/p))...
%         + (abs(sol(:,1)).^p/2 - sol(:,2).^2)/3 ;
%    
% %       add(isnan(add)) = 22220;
% %       add(isinf(add)) = 20000;
% %    addd = @(x) interp1(t,add,x);
%   
%    
%     %tstar = fzero(addd);
%     tstar = interp1(add,t, 0);
%     
%     efolds(ii) = log(interp1(t,sol(:,3),tstar));     
%       
%   end  
%   
%   yinguess = yinguess + 0.02*(Ncmb - efolds(3))/(efolds(1) - efolds(2));
%   
%   tendguess = tstar;
% end
% 
% eft = log(sol(:,3));
% t = (cmb *sol(:,2)* hhin /zin)./sqrt(sol(:,2).^2/6 + abs(sol(:,1)).^p/3/p);
% ht = sqrt(sol(:,2).^2/6 + abs(sol(:,1)).^p/3/p);
% 
% freq = 100 * exp(eft -44.91);
% 
% omegaGW = 3.55e-7* parM* ht.^2 .*( 1 + parM * ht.^2.*fhl(t).*exp(4*pi*t)) .* (freq < 1e4);

end


