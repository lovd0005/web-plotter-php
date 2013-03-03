<?php
/* @var $this SfrateController */
/* @var $model Sfrate */

$this->breadcrumbs=array(
	'Sfrates'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Sfrate', 'url'=>array('index')),
	array('label'=>'Create Sfrate', 'url'=>array('create')),
	array('label'=>'View Sfrate', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Sfrate', 'url'=>array('admin')),
);
?>

<h1>Update Sfrate <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>