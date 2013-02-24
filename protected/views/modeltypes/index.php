<?php
/* @var $this ModeltypesController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Modeltypes',
);

$this->menu=array(
	array('label'=>'Create Modeltypes', 'url'=>array('create')),
	array('label'=>'Manage Modeltypes', 'url'=>array('admin')),
);
?>

<h1>Modeltypes</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
