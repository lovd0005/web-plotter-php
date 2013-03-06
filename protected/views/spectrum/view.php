<?php
/* @var $this SpectrumController */
/* @var $model Spectrum */

$this->breadcrumbs=array(
	'Spectrums'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Spectrum', 'url'=>array('index')),
	array('label'=>'Create Spectrum', 'url'=>array('create')),
	array('label'=>'Update Spectrum', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Spectrum', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Spectrum', 'url'=>array('admin')),
);
?>

<h1>View Spectrum #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
		'type_id',
		'func_name',
		'para_num',
	),
)); ?>
