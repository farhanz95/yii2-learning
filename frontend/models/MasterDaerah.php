<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "master_daerah".
 *
 * @property string $daerah_id
 * @property string $daerah_nama
 * @property string $negeri_id
 *
 * @property Item[] $items
 * @property MasterNegeri $negeri
 */
class MasterDaerah extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'master_daerah';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['negeri_id'], 'integer'],
            [['daerah_nama'], 'string', 'max' => 255],
            [['daerah_nama'], 'unique'],
            [['negeri_id'], 'exist', 'skipOnError' => true, 'targetClass' => MasterNegeri::className(), 'targetAttribute' => ['negeri_id' => 'negeri_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'daerah_id' => 'Daerah ID',
            'daerah_nama' => 'Daerah Nama',
            'negeri_id' => 'Negeri ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(Item::className(), ['item_manufactured_city_address' => 'daerah_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNegeri()
    {
        return $this->hasOne(MasterNegeri::className(), ['negeri_id' => 'negeri_id']);
    }
}
