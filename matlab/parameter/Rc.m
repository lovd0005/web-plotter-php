%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cosmic star formation rate per comoving vlolume (SFR) % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result = Rc(z,h0)
result = h0*(0.017+0.13.*z)./(1+(z./3.3).^5.3);
% in Msolar/(Mpc^3*yr)
end
