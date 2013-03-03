<?php
/* @var $this PlotterController */
/* @var $model Modeltypes */
?>

<tr>
  <td><label class="checkbox">
    <?php echo CHtml::activeCheckBox($model,"[$i]toPlot"); ?>
    <?php echo CHtml::encode($model->name); ?>
    <?php echo CHtml::activehiddenField($model,"[$i]id"); ?>
  </label></td>
  
  <td class="">
    <?php 
      foreach ($model->parameters as $k=>$parameter){
      	echo CHtml::encode($parameter->name).CHtml::encode($parameter->desc); 
        echo CHtml::activehiddenField($parameter,"id",array('class'=>'span1','name'=>"Models[$i][params][$k][id]"));
        echo CHtml::activeTextField($parameter,"[$i][$k]default_value",array('class'=>'span1','name'=>"Models[$i][params][$k][value]")).'<br>';
        
      } ?>
  </td>
  
  <td class="">
  	<span>linewidth</span>
		<?php echo CHtml::activeTextField($model,"[$i]lineWidth",array('maxlength'=>5,'class'=>'span1')).'<br />'; ?>
  	<?php echo CHtml::activedropDownList($model,"[$i]color", CHtml::listData(Color::model()->findAll(), 'value', 'name'),array('class'=>'span2')).'<br />'; ?>
    <?php echo CHtml::activedropDownList($model,"[$i]lineStyle", CHtml::listData(LineStyle::model()->findAll(), 'value', 'name'),array('class'=>'span2')).'<br />'; ?>
  </td>
  
  <td><ul><?php 
    foreach ($model->references as $reference){
      echo '<li>'.CHtml::link(CHtml::encode($reference->name),$url='references/'.$reference->file).'</li>';
    }
  ?></ul></td>
</tr>