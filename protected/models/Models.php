<?php

/**
 * This is the model class for table "tbl_models".
 *
 * The followings are the available columns in table 'tbl_models':
 * @property integer $id
 * @property string $name
 * @property integer $type_id
 * @property integer $script_id
 */
class Models extends CActiveRecord
{
  public $color;
  public $lineStyle;
  public $lineWidth;
  public $parameters;
  
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Models the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_models';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name', 'required'),
			array('type_id, script_id', 'numerical', 'integerOnly'=>true),
			array('name', 'length', 'max'=>255),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, name, type_id, script_id', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
      'parameters'=>array(self::HAS_MANY, 'Parameters','model_id'),
      'references'=>array(self::HAS_MANY, 'Reference', 'model_id'),
      'type'=>array(self::BELONGS_TO, 'Modeltypes','type_id')
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'name' => 'Name',
			'type_id' => 'Type',
			'script_id' => 'Script',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('type_id',$this->type_id);
		$criteria->compare('script_id',$this->script_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}