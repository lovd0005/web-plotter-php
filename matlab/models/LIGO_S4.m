function [domain, omega] = LIGO_S4(f,numpoints)
domain = [51 150];
omega = [1 1]*6.5e-5;

end

% 
% x_start = 51;
% x_end = 150;
% 
% left_bound = numpoints +1;
% right_bound = 0;
% 
% for i = 1 : numpoints
% 	if  (f(i) >=  x_start)
% 		left_bound = i;
% 		break;
% 	end;
% end;
% 
% for i = 1 : numpoints
% 	if  (f(numpoints + 1 -i) <= x_end) 
% 		right_bound = numpoints + 1 - i;
% 		break;
% 	end;
% end;
% 
% if (right_bound > left_bound)
% 	domain = f(left_bound:right_bound);
% 	omega = 0*domain + 6.5e-5;
% else
% 	domain = 0;
% 	omega = 0;