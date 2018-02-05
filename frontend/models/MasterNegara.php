<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "master_negara".
 *
 * @property string $negara_id
 * @property string $negara_code
 * @property string $negara_nama
 *
 * @property Item[] $items
 * @property MasterNegeri[] $masterNegeris
 */
class MasterNegara extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'master_negara';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['negara_code'], 'string', 'max' => 8],
            [['negara_nama'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'negara_id' => 'Negara ID',
            'negara_code' => 'Negara Code',
            'negara_nama' => 'Negara Nama',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(Item::className(), ['item_manufactured_country_address' => 'negara_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMasterNegeris()
    {
        return $this->hasMany(MasterNegeri::className(), ['negara_id' => 'negara_id']);
    }
}
