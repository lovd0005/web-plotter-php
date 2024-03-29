<?php

class m130227_045509_create_linestyle_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_linestyle', array(
      'id' => 'pk',      
      'name' => 'string NOT NULL',
      'value' => 'string',
    ));
	}

	public function down()
	{
    $this->dropTable('tbl_linestyle');
		echo " drop table tbl_linestyle.\n";
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