<?php

class m130306_032039_create_spectrum_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_spectrum', array(
                'id' => 'pk',
                'name' => 'string NOT NULL',
                'type_id' => 'integer',
                'func_name' => 'string',
                'para_num' => 'integer NOT NUlL'
            ));
	}

	public function down()
	{
    $this->dropTable('tbl_spectrum');
		echo "drop the table tbl_spectrum.\n";
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