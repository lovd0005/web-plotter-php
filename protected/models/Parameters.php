<?php

/**
 * This is the model class for table "tbl_parameters".
 *
 * The followings are the available columns in table 'tbl_parameters':
 * @property integer $id
 * @property string $name
 * @property string $desc
 * @property integer $model_id
 * @property string $default_value
 * @property string $var_name
 */
class Parameters extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Parameters the static model class
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
		return 'tbl_parameters';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, model_id, var_name', 'required'),
			array('model_id', 'numerical', 'integerOnly'=>true),
			array('name, default_value, var_name', 'length', 'max'=>255),
			array('desc', 'safe'),
      array('var_name', 'unique'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, name, desc, model_id, default_value, var_name', 'safe', 'on'=>'search'),
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
			'desc' => 'Desc',
			'model_id' => 'Model',
			'default_value' => 'Default Value',
			'var_name' => 'Var Name',
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
		$criteria->compare('desc',$this->desc,true);
		$criteria->compare('model_id',$this->model_id);
		$criteria->compare('default_value',$this->default_value,true);
		$criteria->compare('var_name',$this->var_name,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}