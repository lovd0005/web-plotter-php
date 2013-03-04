<?php

/**
 * Plotter class.
 * Plotter is the data structure for storing data for
 * plotting. It is used by the 'index' action of 'PlotterController'.
 */
class Plotter extends CFormModel
{
	public $xmin=1;
	public $xmax=1000;
  public $ymin=1e-18;
  public $ymax=1e-16;
  public $numpoints=500;
  public $models;
  public $sfrate;
  public $manually;
  public $removeSiteInfo;
  public $removeBuilderInfo;

	/**
	 * Declares the validation rules.
	 * The rules state that username and password are required,
	 * and password needs to be authenticated.
	 */
	public function rules()
	{
		return array(
			// username and password are required
      // array('username, password', 'required'),
      // // rememberMe needs to be a boolean
      // array('rememberMe', 'boolean'),
      array('models','required'),
      array('xmin, xmax, ymin, ymax, numpoints','required'),
      array('xmin, xmax, ymin, ymax, numpoints','numerical'),
      array('manually, removeSiteInfo, removeBuilderInfo','boolean'),
      // // password needs to be authenticated
      // array('password', 'authenticate'),
			array(
        'xmin, xmax, ymin, ymax, numpoints, 
        models, sfrate, manually, removeSiteInfo, removeBuilderInfo', 
        'safe'
      ),
		);
	}

	/**
	 * Declares attribute labels.
	 */
  public function attributeLabels()
  {
    return array(
      'xmin'=>'Xmin',
    );
  }
  
  private function toPlot($model)
  {
    if ($model['toPlot'] == true) return true;
    return false;
  }
  
  public function loadModelsConfig()
  {
    $models = array_filter($this->models, array($this, 'toPlot'));
    $this->models = $models;
    
    $fh = fopen('matlab/para_input.m', 'w') or die("can't open file");

    //fwrite($fh, "function record = para_input()\n\n");
    //fwrite($fh,"  global processid, processid = $ID;\n\n");
    //foreach ($_POST as $key => $value) //key % value as names and vaules of var
    //	{fwrite($fh,"  global ".$key.", ".$key." = ".$value.";\n\n"); }


    //key % value as names and vaules of var
    foreach ($this->attributes as $key => $value) 
    {
      if (!is_array($value)) 
      {
        fwrite($fh, $key." = ".$value.";\n\n");   
      } elseif ($key == 'models')
      {
        fwrite($fh, 'mod_number = '.sizeof($value).";\n\n");
        foreach ($value as $model)
        {
          fwrite($fh, $model['params'][0]['value']."\n");
        }
      }
    }

    // $text = null; 
    // for ($i = 0 ; $i < sizeof($selection);$i++)
    // {
    //   for($n = 0; $n < sizeof($selection[$i][1]);$n++)
    //   {
    //     $text = $text."[ ".$selection[$i][0]. ", ".$selection[$i][1][$n]."]; ";
    //     // [ 1, 2] means coms_2 , [0,1] means astro_1 
    //     }
    //   }
    // $text = "[ ".$text."]";
    // fwrite($fh,"selection = ".$text.";\n\n");
    // //fwrite($fh,"  global selection, selection = ".$text.";\n\n");
    // 
    // //fwrite($fh,"end");
    fclose($fh);
    
  }

}
