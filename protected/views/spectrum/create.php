<?php
/* @var $this SpectrumController */
/* @var $model Spectrum */

$this->breadcrumbs=array(
	'Spectrums'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Spectrum', 'url'=>array('index')),
	array('label'=>'Manage Spectrum', 'url'=>array('admin')),
);
?>

<h1>Create Spectrum</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>