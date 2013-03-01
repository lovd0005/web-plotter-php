<?php

class PlotterController extends Controller
{
	public function actionIndex()
	{    
    if(isset($_POST['Models']))
    {
      // $model->attributes=$_POST['Reference'];
//           $uploadedFile=CUploadedFile::getInstance($model,'file');
//           $model->file=$uploadedFile;
//       if($model->save()){
//             $uploadedFile->saveAs($model->saveFilePath());
//         $this->redirect(array('view','id'=>$model->id));
//       }
  $this->redirect(array('view','array'=>array('model'=>$_POST['Models'],'plotter'=>$_POST['Plotter'])));

    }
		
    $dataProvider=new CActiveDataProvider('Models');
    $modeltypes=Modeltypes::model()->findAll();
    $plotter=new Plotter; 
		$this->render('index', array('modeltypes'=>$modeltypes,'plotter'=>$plotter));
     
	}
  
  public function actionPlot()
  {
    $this->render('result');
  }
  
  public function actionView(array $array)
  {
    $this->render('paras', $array);
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