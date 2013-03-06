function [domain, omega] = COBE(f,numpoints)
domain = [3e-18 1e-16];
omega = 1.4e-13*[(1e-16/3e-18)^2 1];
end


% x_start = 3e-18;
% x_end = 1e-16;
% y_start = 1.4e-13*(1e-16/3e-18)^2;
% y_end = 1.4e-13;
% 
% k = ( y_end - y_start ) / ( x_end - x_start );
% 
% 
% left_bound = numpoints +1;
% right_bound = 0;
% 
% for i = 1 : numpoints
% 	if  (f(i) >=  x_start)
% 		left_bound = i;
% 		break;
% 	end
% end
% 
% for i = 1 : numpoints
% 	if  (f(numpoints + 1 -i) <= x_end) 
% 		right_bound = numpoints + 1 - i;
% 		break;
% 	end
% end
% 
% if (right_bound > left_bound)
% 	domain = f(left_bound:right_bound);
% 	omega = k*(domain- x_start) + y_start;
% else
% 	domain = 0;
% 	omega = 0;
% end;
