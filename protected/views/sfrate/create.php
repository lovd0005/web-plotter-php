<?php
/* @var $this SfrateController */
/* @var $model Sfrate */

$this->breadcrumbs=array(
	'Sfrates'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Sfrate', 'url'=>array('index')),
	array('label'=>'Manage Sfrate', 'url'=>array('admin')),
);
?>

<h1>Create Sfrate</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>