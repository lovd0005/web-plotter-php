<?php
/* @var $this ModeltypesController */
/* @var $model Modeltypes */

$this->breadcrumbs=array(
	'Modeltypes'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Modeltypes', 'url'=>array('index')),
	array('label'=>'Create Modeltypes', 'url'=>array('create')),
	array('label'=>'View Modeltypes', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Modeltypes', 'url'=>array('admin')),
);
?>

<h1>Update Modeltypes <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>