<?php

/**
 * This is the model class for table "tbl_parameter".
 *
 * The followings are the available columns in table 'tbl_parameter':
 * @property integer $id
 * @property string $name
 * @property string $detail
 * @property integer $spectrum_id
 * @property string $value
 * @property string $variable
 */
class Parameter extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Parameter the static model class
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
		return 'tbl_parameter';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, spectrum_id, variable', 'required'),
			array('spectrum_id', 'numerical', 'integerOnly'=>true),
			array('name, value, variable', 'length', 'max'=>255),
			array('detail', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, name, detail, spectrum_id, value, variable', 'safe', 'on'=>'search'),
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
			'detail' => 'Detail',
			'spectrum_id' => 'Spectrum',
			'value' => 'Value',
			'variable' => 'Variable',
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
		$criteria->compare('detail',$this->detail,true);
		$criteria->compare('spectrum_id',$this->spectrum_id);
		$criteria->compare('value',$this->value,true);
		$criteria->compare('variable',$this->variable,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}