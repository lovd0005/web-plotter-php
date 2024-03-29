<?php /* @var $this Controller */ ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/styles.css" />

	<title><?php echo Entity::model()->findByAttributes(array('name'=>'site_title'))->content;?></title>

	<?php Yii::app()->bootstrap->register(); ?>
</head>

<body><div class="container" id="page">
  
  <?php $this->widget('bootstrap.widgets.TbNavbar',array(
      'type'=>'inverse',
      'fluid'=>false,
      'brand'=>Entity::model()->findByAttributes(array('name'=>'site_title'))->content,
      // 'fixed'=>false,
      'collapse'=>true,
      'items'=>array(
          array(
              'class'=>'bootstrap.widgets.TbMenu',
              'items'=>array(
                  array('label'=>'About', 'url'=>array('/site/page', 'view'=>'about')),
                  array('label'=>'Contact', 'url'=>array('/site/contact')),
                  array('label'=>'Login', 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest),
                  array('label'=>'Dashboard', 'url'=>array('/site/manage'), 'visible'=>!Yii::app()->user->isGuest),
                  array('label'=>'Logout ('.Yii::app()->user->name.')', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest)
              ),
          ),
      ),
  )); ?>

	<?php echo $content; ?>

	<div class="clear"></div>

  <!-- <div id="footer">
    Mail to: Vuk or Chengjian
    Copyright &copy; <?php // echo date('Y'); ?> by us.<br/>
    All Rights Reserved.<br/>
    <?php // echo Yii::powered(); ?>
  </div> --><!-- footer -->
 
</div><!-- page -->
</body>

</html>
