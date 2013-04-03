<?php

class PlotterController extends Controller
{
	public function actionIndex()
	{    
    $plotter=new Plotter; 

    $modeltypes=Modeltype::model()->findAll();
    // print_r($_POST['Plotter']);
		$this->render('index', array('modeltypes'=>$modeltypes,'plotter'=>$plotter));
	}
  
  public function actionPlot()
  {
    $plotter=new Plotter; 
    if(isset($_POST['Spectrum']) && isset($_POST['Plotter']) )
    {
    	$_POST['Plotter']['spectrums'] = $_POST['Spectrum'];
      $plotter->attributes=$_POST['Plotter'];
			if ($plotter->validate())
      {
        // $this->redirect(array('plot','plotConfig'=>$_POST['Plotter'] ));
        // $plotter->attributes=$_POST['Plotter'];
        // $plotter->loadModelConfig();
        $figures = $plotter->plot();
        $this->render('box', array('figures'=>$figures));
        // $this->render('figure', array('plotter'=>$plotter, 'plotconfig'=>$_POST['Plotter']));
      }

    }
  }
  
	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index','plot'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('admin'),
			),
		);
	}

	// Uncomment the following methods and override them if needed
	/*
	public function filters()
	{
		// return the filter configuration for this controller, e.g.:
		return array(
			'inlineFilterName',
			array(
				'class'=>'path.to.FilterClass',
				'propertyName'=>'propertyValue',
			),
		);
	}

	public function actions()
	{
		// return external action classes, e.g.:
		return array(
			'action1'=>'path.to.ActionClass',
			'action2'=>array(
				'class'=>'path.to.AnotherActionClass',
				'propertyName'=>'propertyValue',
			),
		);
	}
	*/
}
