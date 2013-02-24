<?php

class m130223_152129_create_scripts_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_scripts', array(
      'id' => 'pk',
      'path' => 'string NOT NULL',
    ));
	}

	public function down()
	{
    $this->dropTable('tbl_scripts');
		echo "m130223_152129_create_scripts_table drop table tbl_scripts.\n";
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