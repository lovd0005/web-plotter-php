<?php

class m130306_063359_create_parameter_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_parameter', array(
      'id' => 'pk',      
      'name' => 'string NOT NULL',
      'detail' => 'text',
      'spectrum_id' => 'integer not null',
      'value' => 'string',
      'variable' => 'string not null'
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