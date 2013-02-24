<?php

class m130223_151355_create_models_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_models', array(
                'id' => 'pk',
                'name' => 'string NOT NULL',
                'type_id' => 'integer',
                'script_id' => 'integer',
            ));
	}

	public function down()
	{
    $this->dropTable('tbl_models');
		echo "m130223_151355_create_models_table drop the table tbl_models.\n";
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