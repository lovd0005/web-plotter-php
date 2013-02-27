<?php
/* @var $this LinestyleController */
/* @var $model Linestyle */

$this->breadcrumbs=array(
	'Linestyles'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Linestyle', 'url'=>array('index')),
	array('label'=>'Create Linestyle', 'url'=>array('create')),
	array('label'=>'View Linestyle', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Linestyle', 'url'=>array('admin')),
);
?>

<h1>Update Linestyle <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>