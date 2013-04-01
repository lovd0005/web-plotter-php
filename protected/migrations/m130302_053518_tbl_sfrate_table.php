<?php

class m130302_053518_tbl_sfrate_table extends CDbMigration
{
	public function up()
	{
    $this->createTable('tbl_sfrate', array(
      'id' => 'pk',
      'name' => 'string NOT NULL',
      'sf_para' => 'string NOT NULL',
    ));
    
    // $this->insert('tbl_reference', array('name'=>'Short Intro to DNS', 'value'=>"references/intro_to_DNS/IntroToDNScollap.pdf"));
 //    $this->insert('tbl_reference', array('name'=>'arXiv:0806.2794v1[astro-ph] 17 Jun 2008', 'value'=>"references/0806_2794.pdf"));
	}

	public function down()
	{
    $this->dropTable('tbl_sfrate');
		echo " drop table tbl_sfrate.\n";
		return true;
	}
}