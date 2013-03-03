<?php
/* @var $this PlotterController */

// $this->breadcrumbs=array('Plotter');
?>

<div class="page-header">
  <h1 class="text-center">Welcome to <?php echo CHtml::encode(Yii::app()->name)?>
    <small><p>An Interactive Plotter for Energy Spectrum of Stochastic Gravitational Wave Backgrounds from Various Theoretical Models</p>
    </small>
  </h1>
  <div class="well">The pages are currently maintained by
    <a href="mailto:mandic@physics.umn.edu">Professor Vuk Mandic (University of Minnesota)</a>, 
    <a href="mailto:regimbau@oca.eu">Tania Regimbau(Observatoire de la Cote d’Azur.)</a> and  
    <a href="mailto:wuxxx528@umn.edu">Chengjian Wu (University of Minnesota)</a>.
    If you decide to use a plot generated by this site please consider giving this site, and us, a credit. (You can remove the site address label from the plots with the check box at the bottom of the page.)
  <ul>
    <li> Please select each model and the relevent values for the parameters you wish to plot using the form below. When you have finished the selection press "Generate Plot" once and then wait for the new results page to appear. The new page can take some time to appear depending on the server load. </li>
    <li> Please note that you can use the browser "Back" button to return to this page, and your data/color selections from your previous plot will be remembered.</li>
  </ul>  
  </div>
</div>




<?php /** @var BootActiveForm $form */
$form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
    'id'=>'verticalForm',
    'htmlOptions'=>array(
// 'onsubmit'=>'window.open('.'"index.php?r=plotter/index"'.',"popup","width=800,height=400")'
))); ?>
  <!-- <form method="post" action="dialing.php" id="wrapper_Data_Form" onsubmit="popup(this)"> -->
    
<table class="table table-striped table-bordered table-condensed">
  <caption><h4>PLOT SPECIFICATIONS</h4><br /></caption>
  		
  <tr>
    <th class="text-center">
    </th>
    <th class="text-center">Min </th>
    <th class="text-center">Max </th>		
  <!--<th ALIGN=CENTER WIDTH="500" HEIGHT="17" BORDER="0"> </th>-->
  </tr>

	<tr>
  	<td class="text-left">
      <?php echo $form->labelEx($plotter,'X-axis (Frequency):'); ?>
    </td>
  	<td class="text-center">
      <?php echo $form->textField($plotter,'xmin',array(
        'size'=>2,'maxlength'=>10, 'class'=>'span2')); ?>
    </td>
    <td class="text-center">
      <?php echo $form->textField($plotter,'xmax',array(
        'size'=>2,'maxlength'=>10, 'class'=>'span2')); ?>
    </td>
  </tr>

	<tr>
  	<td class="text-left">
      <?php echo $form->labelEx($plotter,'Y-axis (Energy Spectrum)'); ?>
    </td>
  	<td class="text-center">
      <?php echo $form->textField($plotter,'ymin',array(
        'size'=>2,'maxlength'=>10, 'class'=>'span2')); ?>
    </td>
    <td class="text-center">
      <?php echo $form->textField($plotter,'ymax',array(
        'size'=>2,'maxlength'=>10, 'class'=>'span2')); ?>
    </td>
  </tr>
  
	<tr>
		<td class="text-left">
      Number of Points 
      <?php echo $form->textField($plotter,'numpoints',array(
        'size'=>2,'maxlength'=>10, 'class'=>'span1')); ?>
    </td>
		<td class="text-central">2</td>
		<td class="text-central">As long as you want to wait</td>
	</tr>

	<tr>
		<td align="left">Star Formation Rate</td>
		<td colspan="2" class="text-center">
    	<?php echo CHtml::activedropDownList($plotter,"sfrate", CHtml::listData(Sfrate::model()->findAll(), 'sf_para', 'name'),array('class'=>'span3')).'<br />'; ?>
		</td>		
	</tr>
  
	<tr>
		<td align="left">  Set by  </td>
    <td colspan="2" class="text-center">
      <label class="checkbox">
          <?php echo CHtml::activeCheckBox($plotter,"manually"); ?>
          Configure the plot manually?
      </label>
		</td>
	</tr>
</table>

  <div class="row"></div>
  
	<table class="table table-striped">
	<thead>
    <tr><th colspan="4" class="text-center">      
      <?php $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit', 'label'=>'Generate Plot')); ?>      
      [Please note there may be up to 30 second wait for plots]
    </th></tr>
    
    <tr>
			<th class="span3">GW Model Name</th>
			<th class="span4">Parameters </th>
			<th class="span2">Plot Specify</th>
			<th class="span3">Introduction </th>
		</tr>
	</thead>	
	
	<tbody>			
    <?php 
    $i=0;
    foreach ($modeltypes as $modeltype) {
    echo '<tr><th colspan="4" class="text-center">'.$modeltype->name.'</th></tr>';
    foreach ($modeltype->models as $model) {
      echo $this->renderPartial('_form', array('model'=>$model, 'i'=>$i));
      $i++;
    };
    } ?>


  	<tr><td colspan="4" class="text-center">
  		 <label class="checkbox">
         <?php echo CHtml::activeCheckBox($plotter,"removeSiteInfo"); ?>
         Check here to remove site information from main plot.</label>
    </td></tr> 
    
    <tr><td colspan="4" class="text-center"><label class="checkbox">
      <?php echo CHtml::activeCheckBox($plotter,"removeBuilderInfo"); ?>
      Check here to remove our names from main plot.
    </label></td></tr>
  
    <tr><th colspan="4" class="text-center">
      <?php $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit', 'label'=>'Generate Plot')); ?>      
      [Please note there may be up to 30 second wait for plots]
  	</th></tr>	
<?php $this->endWidget(); ?>
