<?php

class m130224_105349_create_parameters_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_paramters', array(
      'id' => 'pk',      
      'name' => 'string NOT NULL',
      'desc' => 'text',
      'model_id' => 'integer',
      'default' => 'string',
    ));
	}

	public function down()
	{
    $this->dropTable('tbl_paramters');
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