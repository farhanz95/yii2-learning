<?php

use yii\db\Migration;

class m180206_110716_create_table_uploaded extends Migration
{
    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%uploaded}}', [
            'image_id' => $this->integer(11)->notNull()->append('PRIMARY KEY'),
            'image_name' => $this->string(255),
            'image_type' => $this->string(255),
        ], $tableOptions);
    }

    public function safeDown()
    {
        $this->dropTable('{{%uploaded}}');
    }
}
