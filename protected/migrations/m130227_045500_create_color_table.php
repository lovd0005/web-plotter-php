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
    
    $this->insert('tbl_color', array('name'=>'green', 'value'=>"'g'"));
    $this->insert('tbl_color', array('name'=>'white', 'value'=>"'w'"));
    $this->insert('tbl_color', array('name'=>'black', 'value'=>"'k'"));
    $this->insert('tbl_color', array('name'=>'red', 'value'=>"'r'"));
    $this->insert('tbl_color', array('name'=>'cyan', 'value'=>"'c'"));
    $this->insert('tbl_color', array('name'=>'magenta', 'value'=>"'m'"));
    $this->insert('tbl_color', array('name'=>'yellow', 'value'=>"'y'"));
    $this->insert('tbl_color', array('name'=>'Blue', 'value'=>"'b'"));
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