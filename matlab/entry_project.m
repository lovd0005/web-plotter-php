function out = entry_project()
%
%
%

%% Path variable Building for executing this code

	tic;	% Start timing run process
	
	echo off; 
	
	%if ~isdeployed    % no need using php
	%	cd ..;	% back to top of tree for this set of routines
	%end 
	
	func_name = 'entry_project.m'; 
	web_root = pwd;	% currentFolder (cgi-bin if called by cgi)
	f_sep = filesep;	% platform-specific file separator character
	
	if ~isdeployed 
		addpath(genpath([web_root f_sep 'matlab']));
		% and now add everything in local matlab directory
	end 
 	
	fprintf('%s: Path Added (TIME = %5.1f) \n', func_name, toc);
	
%% Call para_process.m to get the data for each model %%
	
	[p, ax, auto, id, credit]= para_process();

	fprintf('%s: Get Plot Data (TIME = %5.1f) \n', func_name, toc);
	
%% Call plot_generate.m to plot data in P STRUCTURES %%

	% Delete earlier files
	if (length(dir([web_root f_sep 'output'])) > 40)
		rmdir([web_root f_sep 'output'],'s');
		mkdir([web_root f_sep 'output']);
		unix(['chmod a+rx ' web_root f_sep 'output']);
	end;
	
	fprintf('%s: Check folder load (TIME = %5.1f) \n', func_name, toc);

	% Plot Data in p in Figures
	output_files = plot_generate(credit, p, ax,auto , id, web_root);

	fprintf('%s: Generating Graphics in %s (TIME = %5.1f)\n'...
		,func_name, output_files, toc);

%% TIME TO SEE IF JPGS HAVE ACTUALLY BEEN CREATED?

	timeout = 10;	% Max amount of time to wait
	temp = toc;	
	
	while(( ~exist([output_files '.jpg'] , 'file' ) ...
			|| ~exist([output_files '_legend.jpg'] , 'file' ) ) ...
			&& (toc-temp)<timeout )
		pause(1);
	end;
		
	if 	( ~exist( [output_files '.jpg'] , 'file' )) ...
			|| (~exist( [output_files '_legend.jpg'] , 'file' ) )
		fprintf('\n fails in generating \n');	% check the jpg file
		out = 0;	% return the boolean value of the function
	else
		fprintf('\n made it\n');
		out = 1;
	end;

	fprintf('\n%s: Waited %2d extra secs for convert to finish',...
		func_name,round(toc-temp));
	
%%	Final echoing

	close all;	% CLOSE OLD FIGURE WINDOWS	  
	fprintf('%s: Finish and Exit (TIME = %5.1f) \n', func_name, toc);
	exit;
end
