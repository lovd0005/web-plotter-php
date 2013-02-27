<?php
/* @var $this LinestyleController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Linestyles',
);

$this->menu=array(
	array('label'=>'Create Linestyle', 'url'=>array('create')),
	array('label'=>'Manage Linestyle', 'url'=>array('admin')),
);
?>

<h1>Linestyles</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
