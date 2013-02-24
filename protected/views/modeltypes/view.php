<?php
/* @var $this ModeltypesController */
/* @var $model Modeltypes */

$this->breadcrumbs=array(
	'Modeltypes'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Modeltypes', 'url'=>array('index')),
	array('label'=>'Create Modeltypes', 'url'=>array('create')),
	array('label'=>'Update Modeltypes', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Modeltypes', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Modeltypes', 'url'=>array('admin')),
);
?>

<h1>View Modeltypes #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
	),
)); ?>
