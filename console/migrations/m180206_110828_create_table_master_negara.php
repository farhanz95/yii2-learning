<?php

use yii\db\Migration;

class m180206_110828_create_table_master_negara extends Migration
{
    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%master_negara}}', [
            'negara_id' => $this->integer(11)->unsigned()->notNull()->append('AUTO_INCREMENT PRIMARY KEY'),
            'negara_code' => $this->string(8),
            'negara_nama' => $this->string(50),
        ], $tableOptions);
    }

    public function safeDown()
    {
        $this->dropTable('{{%master_negara}}');
    }
}
