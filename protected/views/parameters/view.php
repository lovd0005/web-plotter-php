<?php
/* @var $this ParametersController */
/* @var $model Parameters */

$this->breadcrumbs=array(
	'Parameters'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Parameters', 'url'=>array('index')),
	array('label'=>'Create Parameters', 'url'=>array('create')),
	array('label'=>'Update Parameters', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Parameters', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Parameters', 'url'=>array('admin')),
);
?>

<h1>View Parameters #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
		'desc',
		'model_id',
		'default',
	),
)); ?>
