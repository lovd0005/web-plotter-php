<?php

class m130302_053518_create_sfr_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_sfrate', array(
      'id' => 'pk',
      'name' => 'string NOT NULL',
      'sf_para' => 'string NOT NULL'
    ));
	}

	public function down()
	{
    $this->dropTable('tbl_sfrate');
		echo " drop table tbl_sfrate.\n";
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