<?php

class m130227_064536_create_reference_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_reference', array(
      'id' => 'pk',
      'spectrum_id' => 'integer',
      'name' => 'string NOT NULL',
      'file' => 'string',
    ));
    
    // $this->insert('tbl_reference', array('name'=>'Short Intro to DNS', 'value'=>"references/intro_to_DNS/IntroToDNScollap.pdf"));
 //    $this->insert('tbl_reference', array('name'=>'arXiv:0806.2794v1[astro-ph] 17 Jun 2008', 'value'=>"references/0806_2794.pdf"));
	}

	public function down()
	{
    $this->dropTable('tbl_reference');
		echo " drop table tbl_reference.\n";
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