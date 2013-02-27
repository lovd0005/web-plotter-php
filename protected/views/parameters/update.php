<?php
/* @var $this ParametersController */
/* @var $model Parameters */

$this->breadcrumbs=array(
	'Parameters'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Parameters', 'url'=>array('index')),
	array('label'=>'Create Parameters', 'url'=>array('create')),
	array('label'=>'View Parameters', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Parameters', 'url'=>array('admin')),
);
?>

<h1>Update Parameters <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>