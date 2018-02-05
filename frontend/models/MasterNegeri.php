<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "master_negeri".
 *
 * @property string $negeri_id
 * @property string $negeri_nama
 * @property string $negara_id
 * @property int $negeri_aktif
 *
 * @property Item[] $items
 * @property MasterDaerah[] $masterDaerahs
 * @property MasterNegara $negara
 */
class MasterNegeri extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'master_negeri';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['negeri_nama'], 'required'],
            [['negara_id', 'negeri_aktif'], 'integer'],
            [['negeri_nama'], 'string', 'max' => 64],
            [['negara_id'], 'exist', 'skipOnError' => true, 'targetClass' => MasterNegara::className(), 'targetAttribute' => ['negara_id' => 'negara_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'negeri_id' => 'Negeri ID',
            'negeri_nama' => 'Negeri Nama',
            'negara_id' => 'Negara ID',
            'negeri_aktif' => 'Negeri Aktif',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(Item::className(), ['item_manufactured_state_address' => 'negeri_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMasterDaerahs()
    {
        return $this->hasMany(MasterDaerah::className(), ['negeri_id' => 'negeri_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNegara()
    {
        return $this->hasOne(MasterNegara::className(), ['negara_id' => 'negara_id']);
    }
}
