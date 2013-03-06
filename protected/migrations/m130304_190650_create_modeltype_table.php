<?php

class m130304_190650_create_modeltype_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_modeltype', array(
                'id' => 'pk',
                'name' => 'string NOT NULL',
            ));
	}

	public function down()
	{
    $this->dropTable('tbl_modeltype');
		echo "drop table tbl_modeltype.\n";
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