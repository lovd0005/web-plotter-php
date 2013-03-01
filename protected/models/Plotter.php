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
  
	public $rememberMe;

	private $_identity;

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
      // // password needs to be authenticated
      // array('password', 'authenticate'),
		);
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels()
	{
		return array(
			'rememberMe'=>'Remember me next time',
		);
	}

}
