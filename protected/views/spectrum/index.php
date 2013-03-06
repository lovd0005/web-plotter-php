<?php
/* @var $this SpectrumController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Spectrums',
);

$this->menu=array(
	array('label'=>'Create Spectrum', 'url'=>array('create')),
	array('label'=>'Manage Spectrum', 'url'=>array('admin')),
);
?>

<h1>Spectrums</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
