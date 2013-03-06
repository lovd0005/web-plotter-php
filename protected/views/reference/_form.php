<?php
/* @var $this ReferenceController */
/* @var $model Reference */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'reference-form',
	'enableAjaxValidation'=>false,
  'htmlOptions' => array('enctype' => 'multipart/form-data'),
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row-fluid">
		<?php echo $form->labelEx($model,'Model'); ?>
  	<?php echo $form->dropDownList($model,'spectrum_id', CHtml::listData(Spectrum::model()->findAll(), 'id', 'name')); ?>    
		<?php echo $form->error($model,'spectrum_id'); ?>
	</div>

	<div class="row-fluid">
		<?php echo $form->labelEx($model,'name'); ?>
		<?php echo $form->textField($model,'name',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'name'); ?>
	</div>

	<div class="row-fluid">
		<?php echo $form->fileField($model, 'file'); ?>
		<?php echo $form->error($model,'file'); ?>
	</div>

	<div class="row-fluid buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->