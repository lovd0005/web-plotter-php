<?php
/* @var $this SpectrumController */
/* @var $data Spectrum */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('name')); ?>:</b>
	<?php echo CHtml::encode($data->name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('type_id')); ?>:</b>
	<?php echo CHtml::encode($data->type_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('func_name')); ?>:</b>
	<?php echo CHtml::encode($data->func_name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('para_num')); ?>:</b>
	<?php echo CHtml::encode($data->para_num); ?>
	<br />


</div>