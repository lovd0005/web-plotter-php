<?php
/* @var $data Reference */

// print_r($plotter->attributes);
// echo '<br />';
// echo getcwd();
$ID = $plotconfig['id']; //Record the process id to specify each job
$root = getcwd();
// echo $root."#$ID <br> \n";
exec("/local/site/pkg/matlab2010b/bin/matlab -nodesktop -r entry_project.m 1>logfiles/matlab_output.log 2>&1");
//exec("matlab -nodesktop -r entry_project.m 1>logfiles/matlab_output.log 2>&1");
//$beiju = exec("/home/usr/local/MATLAB/R2010b/bin/matlab "."-"."nodesktop  "."-"."nosplash "."-"."r \"addpath /home/hardy/public_html\", \"teeef.m\"");


echo '<title>This is the result plots # '.$ID." </title>\n";
echo "<b>PDF (small):&nbsp;</b>";
//$file1 = "output/graph_".$ID.".pdf";
//header("Content-type:application/force-download");
//header("Content-Disposition:attachment;filename=$file1");
//readfile($file1);
echo '<a href="output/graph_'.$ID.'.pdf" target="_blank">Spectrum Plot</a>';
echo "&nbsp;and the associated&nbsp;";
echo '<a href="output/graph_'.$ID.'_legend.pdf " target="_blank">Legend</a><br /><br />';
echo "<b>JPG images available here as a quick preview of output.</b><br /><br />\n";
echo "<img src='output/graph_".$ID.".jpg' />";
echo "<img src='output/graph_".$ID."_legend.jpg' /><br />";

/*	$third = time;
	$temp1 =$second - $first;
	$temp2 =$third - $second;
	echo scalar $temp1;
	echo " <p>and </p>\n";
	echo scalar $temp2;
	echo "</body>"; */
	
?> 
