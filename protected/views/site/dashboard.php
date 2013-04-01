<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;
?>
<div class="span4">
<?php 
$this->widget('bootstrap.widgets.TbMenu', array(
    'type'=>'tabs', // '', 'tabs', 'pills' (or 'list')
    'stacked'=>true, // whether this is a stacked menu
    'items'=>array(
        array('label'=>'Spectrum', 'url'=>$this->createUrl('spectrum/index')),
        array('label'=>'Modeltype', 'url'=>$this->createUrl('modeltype/index'), 'active'=>true),
        array('label'=>'Parameter', 'url'=>$this->createUrl('parameter/index')),
        array('label'=>'Reference', 'url'=>$this->createUrl('reference/index')),
        array('label'=>'Color', 'url'=>$this->createUrl('color/index')),
        array('label'=>'Line Style', 'url'=>$this->createUrl('linestyle/index')),
        array('label'=>'Star Formation Rate', 'url'=>$this->createUrl('sfrate/index')),
        array('label'=>'Modeltype', 'url'=>$this->createUrl('modeltype/index')),
        array('label'=>'site_data', 'url'=>$this->createUrl('entity/index')),
    ),
)); 
?>
</div>
