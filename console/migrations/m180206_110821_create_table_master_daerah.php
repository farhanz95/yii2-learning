<?php

use yii\db\Migration;

class m180206_110821_create_table_master_daerah extends Migration
{
    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%master_daerah}}', [
            'daerah_id' => $this->integer(11)->unsigned()->notNull()->append('AUTO_INCREMENT PRIMARY KEY'),
            'daerah_nama' => $this->string(255),
            'negeri_id' => $this->integer(11)->unsigned(),
        ], $tableOptions);

        $this->createIndex('daerah_nama', '{{%master_daerah}}', 'daerah_nama', true);

        $this->addForeignKey('master_daerah_ibfk_1', '{{%master_daerah}}', 'negeri_id', '{{%master_negeri}}', 'negeri_id');
    }

    public function safeDown()
    {
        $this->dropTable('{{%master_daerah}}');
    }
}
