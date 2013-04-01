<?php

class m130331_180553_create_entity_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_entity', array(
      'id' => 'pk',      
      'name' => 'string NOT NULL',
      'content' => 'text',
    ));
	}

	public function down()
	{
    $this->dropTable('tbl_entity');
		echo " drop table entity.\n";
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