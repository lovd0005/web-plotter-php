addpath(genpath(pwd));
constant;

%% binary coalesscence rates per Mpc^3 per Myr from LIGO paper
local_event_rate_low = 0.01;
local_event_rate_re = 1;
local_event_rate_high = 10;
local_event_rate_max = 50;   

%% Star avaible for z = 0 Msolar per Mpc^3 per year
rho_star = DNS_coal_rate(0);

%% lamba per Msolar

lambda_low = (local_event_rate_low*yr/Myr)/rho_star;
lambda_re = (local_event_rate_re*yr/Myr)/rho_star;
lambda_high = (local_event_rate_high*yr/Myr)/rho_star;
lambda_max = (local_event_rate_max*yr/Myr)/rho_star;

disp(['lambda_low = ' num2str(lambda_low)]);
disp(['lambda_re = ' num2str(lambda_re)]);
disp(['lambda_high = ' num2str(lambda_high)]);
disp(['lambda_max = ' num2str(lambda_max)]);
