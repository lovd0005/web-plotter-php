<?php
/* @var $this ParametersController */
/* @var $data Parameters */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('name')); ?>:</b>
	<?php echo CHtml::encode($data->name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('desc')); ?>:</b>
	<?php echo CHtml::encode($data->desc); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('model_id')); ?>:</b>
	<?php echo CHtml::encode($data->model_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('default_value')); ?>:</b>
	<?php echo CHtml::encode($data->default_value); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('var_name')); ?>:</b>
	<?php echo CHtml::encode($data->var_name); ?>
	<br />


</div>