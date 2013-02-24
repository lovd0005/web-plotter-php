<?php
/* @var $this ModeltypesController */
/* @var $model Modeltypes */

$this->breadcrumbs=array(
	'Modeltypes'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Modeltypes', 'url'=>array('index')),
	array('label'=>'Manage Modeltypes', 'url'=>array('admin')),
);
?>

<h1>Create Modeltypes</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>