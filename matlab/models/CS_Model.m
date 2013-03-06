%%%%%%%%%%%%%%%%%%%%%%%
% Cosmic String Model % 
%%%%%%%%%%%%%%%%%%%%%%%

function [freq, Omega_CS] = CS_Model(f,  Prob, Size,Gmu, numpoints) 

 %Prob = 5e-3;
 %Gmu = 1e-7;
 %Size = 1;
 
 %xmin = 1e-12;
 %xmax = 1e10;
 %numpoints = 100;
 

disp('***********************************');
disp('Beginning Cosmic String Calculation');
  
% This command works. Keep others around for a bit as backup of what I did 
 command = ['! ~/public_html/matlab/cs_lambda_stochastic  -a ' ...
 num2str(log10(f(1))) ' -b ' ...
 num2str(log10(f(numpoints))) ' -c ' ...
 num2str(numpoints) ' -d ' ...
 num2str(log10(Gmu)) ' -e ' ...
 num2str(log10(Gmu)) ' -f  1 -g ' num2str(log10(Size)) ' -i ' ...
 num2str(log10(Size)) ' -j 1   --log-pstart ' num2str(log10(Prob)) ...
 ' --log-pend ' num2str(log10(Prob)) ' --np  1  --ln-zstart  -10 --ln-zend  64  --dlnz  0.01  --index 1'];
 
eval(command);

% Assign freq and spectrum arrays from data file created by executable
cc = load('/home/user1/cwu/public_html/matlab/stochastic_OmegaGW.dat');
freq = cc(:,4);
Omega_CS = cc(:,6);

disp('Finished Cosmic String Calculation')
disp('*************************************************')
%disp(freq)
%%disp(Omega_CS)

%loglog(f,Omega_CS, 'marker','*')
%axis([1e-13 1e10 1e-7 1e-4])

end