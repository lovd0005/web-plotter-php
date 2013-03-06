xmin = 1;

xmax = 1000;

ymin = 1.0E-18;

ymax = 1.0E-16;

numpoints = 500;

mod_number = 2;

namelist = cell(2,1)

funclist = cell(2,1)

parameters = cell(2, 1); 

namelist{0+1} = 'Magnetar Model';

funclist{0+1} = '';

parameters{0+1} = cell(1,5);
parameters{0+1, 1} = 1E+15; 
parameters{0+1, 2} = 0.0002; 
parameters{0+1, 3} = 0.001; 
parameters{0+1, 4} = 0.001; 
parameters{0+1, 5} = 1E+45; 

namelist{1+1} = 'Double Neutron Star Model';

funclist{1+1} = '';

parameters{1+1} = cell(1,2);
parameters{1+1, 1} = 1.22; 
parameters{1+1, 2} = 3E-0; 

sfrate = 'h';

manually = 0;

removeSiteInfo = 0;

removeBuilderInfo = 0;

