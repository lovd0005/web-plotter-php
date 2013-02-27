<?php
/* @var $this PlotterController */
/* @var $model Modeltypes */
?>

<tr>
  <td><input name="astro_2" value="1" type="checkbox">
    <?php echo CHtml::encode($model->name); ?>
  </td>
  <td class="wrapper_Data_Parameters">
    <?php 
      $parameters=Parameters::model()->findAllByAttributes(array('model_id' => $model->id));
      foreach ($parameters as $parameter){
      	echo CHtml::encode($parameter->name).CHtml::encode($parameter->desc); 
        echo CHtml::activeTextField($model,'parameters').'<br>';
      } ?>
  </td>
  <td class="wrapper_Plot_Specify">
  	<span>linewidth</span><br>
		<?php echo CHtml::activeTextField($model,'lineWidth',array('value'=>2 ,'maxlength'=>5)); ?>
  	<?php echo CHtml::activedropDownList($model,"[$i]color", CHtml::listData(Color::model()->findAll(), 'value', 'name')); ?>
    <?php echo CHtml::activedropDownList($model,"[$i]lineStyle", CHtml::listData(LineStyle::model()->findAll(), 'value', 'name')); ?>
  </td>
  <td><ul>
    <?php 
      $references=Reference::model()->findAllByAttributes(array('model_id' => $model->id));
      foreach ($references as $reference){
        echo '<li>'.CHtml::link(CHtml::encode($reference->name),$url='references/'.$reference->file).'</li>';
      } ?>
  </ul></td>
</tr>