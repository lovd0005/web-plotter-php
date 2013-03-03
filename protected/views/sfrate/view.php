<?php
/* @var $this SfrateController */
/* @var $model Sfrate */

$this->breadcrumbs=array(
	'Sfrates'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Sfrate', 'url'=>array('index')),
	array('label'=>'Create Sfrate', 'url'=>array('create')),
	array('label'=>'Update Sfrate', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Sfrate', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Sfrate', 'url'=>array('admin')),
);
?>

<h1>View Sfrate #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
		'sf_para',
	),
)); ?>
