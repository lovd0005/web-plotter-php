<?php
/* @var $this ParametersController */
/* @var $model Parameters */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'parameters-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'name'); ?>
		<?php echo $form->textField($model,'name',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'desc'); ?>
		<?php echo $form->textArea($model,'desc',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'desc'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'model_id'); ?>
  	<?php echo $form->dropDownList($model,'model_id', CHtml::listData(Models::model()->findAll(), 'id', 'name')); ?>    
		<?php echo $form->error($model,'model_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'default_value'); ?>
		<?php echo $form->textField($model,'default_value',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'default_value'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'var_name'); ?>
		<?php echo $form->textField($model,'var_name',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'var_name'); ?>
  </div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->