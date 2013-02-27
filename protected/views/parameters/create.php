<?php
/* @var $this ParametersController */
/* @var $model Parameters */

$this->breadcrumbs=array(
	'Parameters'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Parameters', 'url'=>array('index')),
	array('label'=>'Manage Parameters', 'url'=>array('admin')),
);
?>

<h1>Create Parameters</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>