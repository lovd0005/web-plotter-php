<?php

class m130224_105349_create_parameters_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_parameters', array(
      'id' => 'pk',      
      'name' => 'string NOT NULL',
      'desc' => 'text',
      'model_id' => 'integer not null',
      'default_value' => 'string',
      'var_name' => 'string not null UNIQUE'
    ));
	}

	public function down()
	{
    $this->dropTable('tbl_parameters');
		echo " drop table parameters.\n";
		return true;
	}

	/*
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
	}

	public function safeDown()
	{
	}
	*/
}