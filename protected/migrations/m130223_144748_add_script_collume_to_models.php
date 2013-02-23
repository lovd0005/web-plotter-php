<?php

class m130223_144748_add_script_collume_to_models extends CDbMigration
{
	public function up()
	{
    $this->addColumn('tbl_models','script','string');
		echo "addColumn script to tbl_models.\n";
	}

	public function down()
	{
    $this->dropColumn('tbl_models','script');
		echo "dropColumn script from tbl_models.\n";
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