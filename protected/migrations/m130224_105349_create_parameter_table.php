<?php

class m130224_105349_create_parameter_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_parameter', array(
      'id' => 'pk',      
      'name' => 'string NOT NULL',
      'detail' => 'text',
      'spectrum_id' => 'integer not null',
      'value' => 'string',
      'position' => 'integer'
    ));
	}

	public function down()
	{
    $this->dropTable('tbl_parameter');
		echo " drop table parameter.\n";
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