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
  
  public function loadModelConfig()
  {
    $models = array_filter($this->spectrums, array($this, 'toPlot'));
    $this->spectrums = $models;
    
    $fh = fopen('matlab/para_input.m', 'w') or die("can't open file");
    $content = ''; 

    foreach ($this->attributes as $key => $value) 
    {
      if (!is_array($value)) 
      {
        $content = $content.$key." = ".$value.";\n\n";   
      } elseif ($key == 'spectrums')
      {
        $size =sizeof($value);
        $content = $content.'mod_number = '.$size.";\n\n";
        $content = $content."namelist = cell(".$size.",1);\n\n";
        $content = $content."funclist = cell(".$size.",1);\n\n";
        $content = $content."colorlist = cell(".$size.",1);\n\n";
        $content = $content."widthlist = cell(".$size.",1);\n\n";
        $content = $content."stylelist = cell(".$size.",1);\n\n";
        $content = $content.'parameters = cell('.$size.", 1);\n\n";

        foreach ($value as $key=>$mod)
        {
          $model=Spectrum::model()->findByPk($mod['id']);
          $content = $content.'namelist{'."$key+1".'} = '."'".$model->name."';\n\n";
          $content = $content.'funclist{'."$key+1".'} = '."'".$model->func_name."';\n\n";
          $content = $content.'colorlist{'."$key+1".'} = '."'".$mod['color']."';\n\n";
          $content = $content.'widthlist{'."$key+1".'} = '.$mod['lineWidth'].";\n\n";
          $content = $content.'stylelist{'."$key+1".'} = '."'".$mod['lineStyle']."';\n\n";
          if (isset($mod['params'])) 
          {
            $content = $content.'parameters{'."$key+1".'} = cell(1,'.sizeof($mod['params']).");\n";  
            foreach ($mod['params'] as $para)
            {
              $content = $content.'parameters{'."$key+1, ".$para['position'].'} = '.$para['value']."; \n";
            }
            $content = $content."\n";
          }
        }
      }
    }

    fwrite($fh,$content);
    fclose($fh);
  }

  public function plot()
  {
    $setEnv='expor PATH=/local/site/pkg/matlabR201/bin/:';
    $setEvn=$setEnv.'/usr/local/bin/:$PATH;'; 
    $setEnv=$setEnv.'export $LD_LIBRARY_PATH=/scisoft/lib:';
    $setEnv=$setEnv.'/scisoft/share/karma/lib/;';
    // return exec($setEnv."/local/site/pkg/matlab2010b/bin/matlab -nodesktop -r entry_project   1>logfiles/matlab_output.log 2>&1 ");
    return shell_exec($setEnv."/usr/local/bin/matlab -nodeskto -r entry_project   1>logfiles/matlab_output.log 2>&1 ");

  }
  
  public function pyecho()
  {
    $descriptorspec = array(
       0 => array("pipe", "r"),  // stdin is a pipe that the child will read from
       1 => array("pipe", "w"),  // stdout is a pipe that the child will write to
       2 => array("file", "/tmp/error-output.txt", "a") // stderr is a file to write to
    );

    $cwd = '/tmp';
    $env = array('some_option' => 'aeiou');

    $process = proc_open('php', $descriptorspec, $pipes, $cwd, $env);

    if (is_resource($process)) {
        // $pipes now looks like this:
        // 0 => writeable handle connected to child stdin
        // 1 => readable handle connected to child stdout
        // Any error output will be appended to /tmp/error-output.txt

        fwrite($pipes[0], $this->spectrums);
        fclose($pipes[0]);

        $out = (stream_get_contents($pipes[1]));
        fclose($pipes[1]);

        // It is important that you close any pipes before calling
        // proc_close in order to avoid a deadlock
        $return_value = proc_close($process);

        // echo "command returned $return_value\n";
        return $out;
    }
  }
  

}
