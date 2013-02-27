<?php
/* @var $this LinestyleController */
/* @var $model Linestyle */

$this->breadcrumbs=array(
	'Linestyles'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Linestyle', 'url'=>array('index')),
	array('label'=>'Manage Linestyle', 'url'=>array('admin')),
);
?>

<h1>Create Linestyle</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>