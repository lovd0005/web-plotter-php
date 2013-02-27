<?php
/* @var $data Reference */
?>

<li>
  <?php echo CHtml::link(CHtml::encode($data->name),$url=$data->file); ?>
</li>