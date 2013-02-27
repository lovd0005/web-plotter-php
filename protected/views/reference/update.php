<?php
/* @var $this ReferenceController */
/* @var $model Reference */

$this->breadcrumbs=array(
	'References'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Reference', 'url'=>array('index')),
	array('label'=>'Create Reference', 'url'=>array('create')),
	array('label'=>'View Reference', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Reference', 'url'=>array('admin')),
);
?>

<h1>Update Reference <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>