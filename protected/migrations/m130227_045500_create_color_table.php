<?php

class m130227_045500_create_color_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_color', array(
      'id' => 'pk',      
      'name' => 'string NOT NULL',
      'value' => 'string',
    ));
	}

	public function down()
	{
    $this->dropTable('tbl_color');
		echo " drop table tbl_color.\n";
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