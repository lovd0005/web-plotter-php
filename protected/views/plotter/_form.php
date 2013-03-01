<?php
/* @var $this PlotterController */
/* @var $model Modeltypes */
?>

<tr>
  <td><label class="checkbox"><input name="astro_2" value="1" type="checkbox">
    <?php echo CHtml::encode($model->name); ?></label>
  </td>
  <td class="wrapper_Data_Parameters">
    <?php 
      $parameters=Parameters::model()->findAllByAttributes(array('model_id' => $model->id));
      foreach ($parameters as $parameter){
      	echo CHtml::encode($parameter->name).CHtml::encode($parameter->desc); 
        echo CHtml::activeTextField($model,'parameters',array('class'=>'span1')).'<br>';
      } ?>
  </td>
  <td class="wrapper_Plot_Specify">
  	<span>linewidth</span><br>
		<?php echo CHtml::activeTextField($model,'lineWidth',array('maxlength'=>5,'class'=>'span2')).'<br />'; ?>
  	<?php echo CHtml::activedropDownList($model,"[$i]color", CHtml::listData(Color::model()->findAll(), 'value', 'name'),array('class'=>'span2')).'<br />'; ?>
    <?php echo CHtml::activedropDownList($model,"[$i]lineStyle", CHtml::listData(LineStyle::model()->findAll(), 'value', 'name'),array('class'=>'span2')).'<br />'; ?>
  </td>
  <td><ul>
    <?php 
      $references=Reference::model()->findAllByAttributes(array('model_id' => $model->id));
      foreach ($references as $reference){
        echo '<li>'.CHtml::link(CHtml::encode($reference->name),$url='references/'.$reference->file).'</li>';
      } ?>
  </ul></td>
</tr>