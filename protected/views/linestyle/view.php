<?php
/* @var $this LinestyleController */
/* @var $model Linestyle */

$this->breadcrumbs=array(
	'Linestyles'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Linestyle', 'url'=>array('index')),
	array('label'=>'Create Linestyle', 'url'=>array('create')),
	array('label'=>'Update Linestyle', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Linestyle', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Linestyle', 'url'=>array('admin')),
);
?>

<h1>View Linestyle #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
		'value',
	),
)); ?>
