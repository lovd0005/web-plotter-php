function [p, ax,auto, id, credit] = para_process()
% Return output [p, f, ax, id, credit] using the para_input.m wrotten by CGI
% following data types in array structure p().
% 	.data - {[xy data],[more xy data]}
% 	.label - 'short label of data'
% 	.file - 'file'
% 	.color - e.g. 'r'
% 	.style - e.g. 'fill', 'line' etc
% 	.data_rescale - e.g. [1 1]
% output f as frequencies calculated
% output ax as information for axis setting
% output id as the processID for the fianl graph
% output credit tells weather to put our inf. on plots or not


%% Get Parameters from text file %%
clear all;
para_input;	% load the file contains para. from the <form> tag
func_name = 'para_process';

%% Get the id & credit and check if it is a number
id = num2str(floor(rand(1,1)*1E6)); 

% global no_idtext no_name;
if exist('removeSiteInfo','var') 
  no_idtext = ~removeBuilderInfo;
end
if exist('removeBuilderInfo','var') 
  no_name = 1;
end
credit = [no_idtext no_name];


%% Axis creation and check if they are numbers
% global xmin xmax ymin ymax numpoints axis_auto;
auto = ~manually;

if (xmax == xmin)
  fprintf('xmax cannot equal xmin, routine will now abort.\n')
  return;
end;

if (xmin > xmax)
  fprintf('xmax cannot be less than xmin, swap for the two.\n')
  tvar = xmax;
  xmax = xmin;
  xmin = tvar;
end

if (ymax == ymin)
  fprintf('ymax cannot equal ymin, routine will now abort.\n')
  return;
end;

if (ymin > ymax)
  fprintf('ymax cannot be less than ymin, swap for the two.\n')
  tvar = ymax;
  ymax = ymin;
  ymin = tvar;
end

ax.xmin = xmin;
ax.xmax = xmax;
ax.ymin = ymin;
ax.ymax = ymax;
ax.axis = [ax.xmin ax.xmax ax.ymin ax.ymax]; 

%% Specify the frequency array

% Log in F. Good for log-log plot and Linear in F. is not good
f = zeros(1, numpoints);
f(1) = (xmin);
f(numpoints) = (xmax);
slope = (log10(xmax) - log10(xmin))/(numpoints-1);
for i = 2 : numpoints - 1
  f(i) = f(i-1)*10^(slope);
end;



fprintf('start the data generating \n');

% global selection;
mod_number = size(selection,1); %  return the # of rows of selections
p = struct;
p = repmat(p,1,mod_number);

disp('Constructing data structure p');

for i = 1 : mod_number 
  temp = [char(catag(selection(i,1)+1)) '_' int2str(selection(i,2))];
  p(i).color = char(eval([temp '_color']));
  p(i).style = eval([temp '_style']);
  p(i).width = eval([temp '_width']);
  if (selection(i,1) ==0)
      %p(i).end = eval([temp '_sfr']);
      p(i).end = sfrate;
  else
      p(i).end = numpoints;
  end
  para_text = '';
  for n = 1 : paraspace(selection(i,1)+1,selection(i,2))
    para_text = [para_text temp '_para_' int2str(n) ', '];
  end;
  state = [char(funcspace(selection(i,1)+1,selection(i,2)))...
          '(f,' para_text 'p(i).end )']; 
  [domain, Omega]  = eval(state);
  p(i).domain = domain;
  p(i).data = Omega;
  p(i).label = char(namespace(selection(i,1)+1,selection(i,2)));
end;

end


