<?php

use yii\db\Migration;

class m180206_110832_create_table_master_negeri extends Migration
{
    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%master_negeri}}', [
            'negeri_id' => $this->integer(10)->unsigned()->notNull()->append('AUTO_INCREMENT PRIMARY KEY'),
            'negeri_nama' => $this->string(64)->notNull(),
            'negara_id' => $this->integer(11)->unsigned(),
            'negeri_aktif' => $this->integer(1)->defaultValue('0'),
        ], $tableOptions);

        $this->addForeignKey('master_negeri_ibfk_1', '{{%master_negeri}}', 'negara_id', '{{%master_negara}}', 'negara_id');
    }

    public function safeDown()
    {
        $this->dropTable('{{%master_negeri}}');
    }
}
