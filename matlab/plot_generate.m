function out_path = plot_generate(plot_credit, plot_data, ax,auto,id, root)
% This subroutine generate figures using the data contained in 
% the array structure 'plot_data'
% plot_data().file - file that data came from
% plot_data().label - the short name to label data with
% plot_data().color - suggested colour for plot
% plot_data().data - data for figures, in cells if more than one data set

	func_name = 'plot_generate';
	fprintf('\n %s: Started TIME %5.1f\n',func_name,toc);


%% Check to see if routine gets all the arguments it requires
	% This trapping is not exhaustive
	if (~exist('plot_data','var') )
		fprintf('%s: No plot data structure-exit',func_name); 
		return;
	else
		if( ~isfield(plot_data,'data') )
			fprintf('%s: plot data structure incomplete',func_name);
			disp(plot_data);
			return;
		end;
	end;
	fprintf('\n\n finished plot data check TIME = %5.1f\n\n',toc);

%% Generating

	han1 = figure(1); clf;  % Use for plot
	han2 = figure(2); clf;  % Use for legend

	figure(1);
	
  if auto == 1
    for i = 1 : length(plot_data)
      if (length(plot_data(i).domain) >1)
              disp(['ploting ' plot_data(i).label]);
        loglog(plot_data(i).domain, plot_data(i).data, [plot_data(i).color ...
        plot_data(i).style],'Linewidth', plot_data(i).width); 
      end;

      %axis(ax.axis);     
      hold on;		
    end;
  else
    for i = 1 : length(plot_data)
      if (length(plot_data(i).domain) >1)
              disp(['ploting ' plot_data(i).label]);
        loglog(plot_data(i).domain, plot_data(i).data, [plot_data(i).color ...
        plot_data(i).style],'Linewidth', plot_data(i).width); 
      end;

      axis(ax.axis);     
      hold on;		
    end;
  end;

	warning on all;
	fprintf('\n\n\n  Finished the Plot Generating .  TIME %5.1f'  ,toc);

%% ADD LABELS ETC	

	font = 'Times';font_size = 12;
	xlabel('Frequency \nu [Hz]','fontname',font,'fontsize',font_size);
	ylabel('Energy Spectrum \Omega','fontname',font,'fontsize',font_size);
	set(gca , 'fontname' , font , 'fontsize' ...
		, font_size, 'TickLength',[0.02 0.05]);

	% set up the credit information on the plot
	credit_site = 'http://homepages.spa.umn.edu/~gwplotter ';
	credit_name = 'Mandic V., Wu C.';
	if (plot_credit == [1 1])
		credit_inform = {credit_site credit_name};
	elseif (plot_credit == [1 0])
		credit_inform = credit_site;
	elseif (plot_credit == [0 1])
		credit_inform = credit_name;
	else
		credit_inform = '';
	end;
	text(1,1,credit_inform,'horiz','right','vert','top','units' ...
		,'normalized','fontsize',round(0.8*font_size),'fontname',font); 

	% SET PAPER UP
%	set(gcf,'Paperposition' , [1.68 6.81 5.39 3.74]);
%	set(gca,'position' , [0.15 .13 0.905-0.15 0.925-0.13]);
%	set(gca,'Layer','top');


%% NOW FOR LEGEND PLOT
	figure(2);
	axis off;
	set(gcf,'Paperposition' , [1.68 6.81 5.39 3.74]);
	set(gca,'position' , [0.15 .13 0.905-0.15 0.925-0.13]);

	for ii=1:length(plot_data)
		styleline = ['    ' plot_data(ii).style plot_data(ii).style...
						plot_data(ii).style plot_data(ii).style...
						plot_data(ii).style plot_data(ii).style];
					
		text(0.65,1-0.1*ii,[plot_data(ii).label styleline],...
			'horiz','right','vert','mid','color', plot_data(ii).color,...
			'fontsize',round(1.3*font_size),'fontname',font); 
	end;

	fprintf('\n\n\n  no. 1  TIME  %5.1f'  ,toc);
%% Make files and save for retrieval by html %%

	f_sep = filesep;	% platform-specific file separator character
	out_path = [root f_sep 'output' f_sep 'graph_' id];
	legendpath = [out_path '_legend'];

	saveas(han1,out_path, 'jpg');
	saveas(han2,legendpath, 'jpg');
	unix( ['chmod a+rx ' out_path '.jpg'] );
	unix( ['chmod a+rx ' legendpath '.jpg'] );
	fprintf('\n\n JPG figure generated (TIME %5.1f)\n', toc);

	saveas(han1,out_path, 'pdf');
	saveas(han2,legendpath, 'pdf');
	unix( ['chmod a+rx ' out_path '.pdf'] );
	unix( ['chmod a+rx ' legendpath '.pdf'] );
	fprintf('\n\n pdf figure generated (TIME %5.1f)\n', toc);
