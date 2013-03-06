<?php
/* @var $this SpectrumController */
/* @var $model Spectrum */

$this->breadcrumbs=array(
	'Spectrums'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Spectrum', 'url'=>array('index')),
	array('label'=>'Create Spectrum', 'url'=>array('create')),
	array('label'=>'View Spectrum', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Spectrum', 'url'=>array('admin')),
);
?>

<h1>Update Spectrum <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>