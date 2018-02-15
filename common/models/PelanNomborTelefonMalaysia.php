<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "pelan_nombor_telefon_malaysia".
 *
 * @property string $pelan_no
 * @property string $pelan_nama
 */
class PelanNomborTelefonMalaysia extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pelan_nombor_telefon_malaysia';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pelan_no'], 'required'],
            [['pelan_no'], 'string', 'max' => 9],
            [['pelan_nama'], 'string', 'max' => 255],
            [['pelan_no'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'pelan_no' => 'Pelan No',
            'pelan_nama' => 'Pelan Nama',
        ];
    }
}
