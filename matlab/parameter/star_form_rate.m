function rhof = star_form_rate( sfr, z )
%  STAR_FORM_RATE Summary of this function goes here
%  In unit of M_solar per year per Mpc^3
%  

switch sfr

    %Hopkins & Beacom 2006;

    case 'h'

     rhof =  0.7*(0.017+0.13*z)./(1+(z./3.3).^5.3);

    %Fardal 2007;

    case 'f'

     rhof = (0.0103+0.088*z)./(1+(z./2.4).^2.8);

    %Wilken 2008;

    case 'w'

     rhof = (0.014+0.11.*z)./(1+(z./1.4).^2.2);

    %Nagamine et al. 2006 (fossil model)

    case 'n'

     %disk   

     rhod = @(t) 0.056.*(t./4.5).*exp(-t./4.5);

     %bulge

     rhob = @(t) 0.198.*(t./1.5).*exp(-t./1.5);

     rhof = rhod(z) + rhob(z);  
	 
    %Springel & Hernquist 

    case 's' 
     
      r_num = 0.15*(14.0/15)*exp(0.6*(z - 5.4));
      r_nom = (14.0/15) - 0.6 + 0.6*exp((14.0/15)*(z - 5.4));
      
      rhof = r_num./r_nom;
end

end