<?php
/* @var $this ModeltypeController */
/* @var $model Modeltype */

$this->breadcrumbs=array(
	'Modeltypes'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Modeltype', 'url'=>array('index')),
	array('label'=>'Create Modeltype', 'url'=>array('create')),
	array('label'=>'Update Modeltype', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Modeltype', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Modeltype', 'url'=>array('admin')),
);
?>

<h1>View Modeltype #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
	),
)); ?>
