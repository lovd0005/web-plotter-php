<?php

class m130223_152100_create_modeltypes_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_modeltypes', array(
                'id' => 'pk',
                'name' => 'string NOT NULL',
            ));
	}

	public function down()
	{
    $this->dropTable('tbl_modeltypes');
		echo "m130223_152100_create_modeltypes_table drop table tbl_modeltypes.\n";
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