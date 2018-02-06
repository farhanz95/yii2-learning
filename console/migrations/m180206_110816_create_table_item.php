<?php

use yii\db\Migration;

class m180206_110816_create_table_item extends Migration
{
    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%item}}', [
            'item_id' => $this->integer(11)->notNull()->append('AUTO_INCREMENT PRIMARY KEY'),
            'item_name' => $this->string(255)->notNull(),
            'item_product_id' => $this->string(11)->notNull(),
            'item_type' => $this->string(255),
            'item_quantity' => $this->integer(11)->defaultValue('0'),
            'item_price' => $this->string(10)->defaultValue('0.00'),
            'item_brand' => $this->string(255),
            'item_model' => $this->string(255),
            'item_company_manufacturer' => $this->string(255),
            'item_manufactured_country_address' => $this->integer(11)->unsigned(),
            'item_manufactured_state_address' => $this->integer(11)->unsigned(),
            'item_manufactured_city_address' => $this->integer(11)->unsigned(),
            'item_manufactured_postcode_address' => $this->integer(6),
            'item_manufactured_street_address' => $this->string(255),
            'item_manufactured_no_address' => $this->string(10),
            'item_weight' => $this->string(10),
            'item_size_height' => $this->string(10),
            'item_size_width' => $this->string(10),
            'item_size_length' => $this->string(10),
            'item_manufactured_date' => $this->dateTime(),
            'item_availability_date_start' => $this->dateTime(),
            'item_availability_date_end' => $this->dateTime(),
            'item_registered_on_system_date' => $this->dateTime()->defaultValue('current_timestamp()'),
            'item_updated_on_system_date' => $this->dateTime(),
            'item_activeness' => $this->smallInteger(1)->defaultValue('1'),
        ], $tableOptions);

        $this->addForeignKey('item_ibfk_1', '{{%item}}', 'item_manufactured_country_address', '{{%master_negara}}', 'negara_id');
        $this->addForeignKey('item_ibfk_2', '{{%item}}', 'item_manufactured_state_address', '{{%master_negeri}}', 'negeri_id');
        $this->addForeignKey('item_ibfk_3', '{{%item}}', 'item_manufactured_city_address', '{{%master_daerah}}', 'daerah_id');
    }

    public function safeDown()
    {
        $this->dropTable('{{%item}}');
    }
}
