<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "audit_trail_entry".
 *
 * @property int $id
 * @property string $model_type
 * @property int $happened_at
 * @property string $foreign_pk
 * @property int $user_id
 * @property string $type
 * @property string $data
 *
 * @property User $user
 */
class AuditTrailEntry extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'audit_trail_entry';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['model_type', 'happened_at', 'foreign_pk', 'type'], 'required'],
            [['happened_at', 'user_id'], 'integer'],
            [['data'], 'string'],
            [['model_type', 'foreign_pk', 'type'], 'string', 'max' => 255],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'model_type' => 'Model Type',
            'happened_at' => 'Happened At',
            'foreign_pk' => 'Foreign Pk',
            'user_id' => 'User ID',
            'type' => 'Type',
            'data' => 'Data',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}
