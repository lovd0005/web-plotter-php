<?php

class PlotterController extends Controller
{
	public function actionIndex()
	{    
    $plotter=new Plotter; 
    if(isset($_POST['Spectrum']) && isset($_POST['Plotter']) )
    {
    	$_POST['Plotter']['spectrums'] = $_POST['Spectrum'];
    	$_POST['Plotter']['id']= rand();
      $plotter->attributes=$_POST['Plotter'];
			if ($plotter->validate())
      {
        // $this->redirect(array('plot','plotConfig'=>$_POST['Plotter'] ));
        $plotter->attributes=$_POST['Plotter'];
        $plotter->loadModelConfig();
        // echo $plotter->plot();
        $this->render('figure', array('plotter'=>$plotter, 'plotconfig'=>$_POST['Plotter']));
      }

    }
    $modeltypes=Modeltype::model()->findAll();
		$this->render('index', array('modeltypes'=>$modeltypes,'plotter'=>$plotter));
     
	}
  
  public function actionPlot(array $plotConfig)
  {
    $plotter=new Plotter; 
    $plotter->attributes=$plotConfig;
    $plotter->loadModelConfig();
    $this->render('paras', array('plotter'=>$plotter, 'plotconfig'=>$plotConfig));
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