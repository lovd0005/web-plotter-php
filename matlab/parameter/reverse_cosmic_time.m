function z = reverse_cosmic_time( t )
% REVERSE_COSMIC_TIME return the redshift of coalescenece
% z at the cosmic (lookback) time t.


% Use the cosmic_time functio to get the cosmic time of z
% save the date for furture use since it takes a long time 
% to generate the date. We comment out the code after getting 
% the date.

%{
redshift = 0:0.0001:6.5;
corresponding_time = zeros(size(redshift));

for i=1:length(redshift)
corresponding_time(i) = cosmic_time(redshift(i));
end 

save('reverse_cosmic_time.mat','redshift','corresponding_time');
%}
%%

% Then use interp1 to get the reverse z' of t' from the 
% reverse_cosmic_time.mat file. 
%
load('reverse_cosmic_time.mat');
z = interp1(corresponding_time,redshift,t,'linear','extrap');
%
end
