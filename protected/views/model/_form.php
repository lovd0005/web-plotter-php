<?php
/* @var $this ModelsController */
/* @var $model Models */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'models-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row-fluid">
		<?php echo $form->labelEx($model,'name'); ?>
		<?php echo $form->textField($model,'name',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'name'); ?>
	</div>

	<div class="row-fluid">
		<?php echo $form->labelEx($model,'type_id'); ?>
  	<?php echo $form->dropDownList($model,'type_id', CHtml::listData(Modeltype::model()->findAll(), 'id', 'name')); ?>
		<?php echo $form->error($model,'type_id'); ?>
	</div>

	<div class="row-fluid">
		<?php echo $form->labelEx($model,'script_id'); ?>
		<?php echo $form->textField($model,'script_id'); ?>
		<?php echo $form->error($model,'script_id'); ?>
	</div>

	<div class="row-fluid buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->