function [ rho_dot ] = BC_integ(tmin,zsup,sfr,alpha)
%BC_INTEG Summary of this function goes here
%   Detailed explanation goes here

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

load([fnm '_int.mat']);

tem = eval(['fit.' sfr]);
rho_dot = interp1(r,tem,zsup,'linear','extrap');

end
