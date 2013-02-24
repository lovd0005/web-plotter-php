<?php
/* @var $this ModelsController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Models',
);

$this->menu=array(
	array('label'=>'Create Models', 'url'=>array('create')),
	array('label'=>'Manage Models', 'url'=>array('admin')),
);
?>

<h1>Models</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
