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
  public $spectrums;
  public $sfrate;
  public $manually;
  public $removeSiteInfo;
  public $removeBuilderInfo;
  public $credit_site;
  public $credit_name;

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
      array('spectrums','required'),
      array('xmin, xmax, ymin, ymax, numpoints','required'),
      array('xmin, xmax, ymin, ymax, numpoints','numerical'),
      array('manually, removeSiteInfo, removeBuilderInfo','boolean'),
      // // password needs to be authenticated
      // array('password', 'authenticate'),
			array(
        'xmin, xmax, ymin, ymax, numpoints, 
        models, sfrate, manually, removeSiteInfo, removeBuilderInfo, credit_site, credit_name', 
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
  
  public function plot()
  {
    $models = array_filter($this->spectrums, array($this, 'toPlot'));
    if (empty($models)) { return 'No input data'; }
    $this->spectrums = $models;
    $passing = escapeshellarg(CJSON::encode($this->attributes));    
    return shell_exec("/usr/bin/python ./cgi-bin/agg.cgi ".$passing." 2>logfiles/output.log");
  }

}
