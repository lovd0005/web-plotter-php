<?php
/* @var $this SfrateController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Sfrates',
);

$this->menu=array(
	array('label'=>'Create Sfrate', 'url'=>array('create')),
	array('label'=>'Manage Sfrate', 'url'=>array('admin')),
);
?>

<h1>Sfrates</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
