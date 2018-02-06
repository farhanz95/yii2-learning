<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "item".
 *
 * @property int $item_id
 * @property string $item_name
 * @property string $item_product_id
 * @property string $item_type
 * @property int $item_quantity
 * @property string $item_price
 * @property string $item_brand
 * @property string $item_model
 * @property string $item_company_manufacturer
 * @property string $item_manufactured_country_address
 * @property string $item_manufactured_state_address
 * @property string $item_manufactured_city_address
 * @property int $item_manufactured_postcode_address
 * @property string $item_manufactured_street_address
 * @property string $item_manufactured_no_address
 * @property string $item_weight
 * @property string $item_size_height
 * @property string $item_size_width
 * @property string $item_size_length
 * @property string $item_manufactured_date
 * @property string $item_availability_date_start
 * @property string $item_availability_date_end
 * @property string $item_registered_on_system_date
 * @property string $item_updated_on_system_date
 * @property int $item_activeness
 *
 * @property MasterNegara $itemManufacturedCountryAddress
 * @property MasterNegeri $itemManufacturedStateAddress
 * @property MasterDaerah $itemManufacturedCityAddress
 */
class Item extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'item';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['item_name', 'item_product_id'], 'required'],
            [['item_manufactured_country_address', 'item_manufactured_state_address', 'item_manufactured_city_address', 'item_manufactured_postcode_address', 'item_activeness'], 'integer'],
            [['item_quantity'],'integer','min'=>0],
            [['item_manufactured_date', 'item_availability_date_start', 'item_availability_date_end', 'item_registered_on_system_date', 'item_updated_on_system_date'], 'safe'],
            [['item_price', 'item_weight', 'item_size_height', 'item_size_width', 'item_size_length'], 'number','min'=>'0.00', 'numberPattern' => '/^[0-9]{1,10}([\.,][0-9]{1,2})*$/','message'=>'Input can only contain 2 decimal point'],
            [['item_name', 'item_type', 'item_brand', 'item_model', 'item_company_manufacturer', 'item_manufactured_street_address'], 'string', 'max' => 255],
            [['item_product_id'], 'string', 'max' => 11],
            [['item_manufactured_no_address'], 'string', 'max' => 10],
            [['item_manufactured_country_address'], 'exist', 'skipOnError' => true, 'targetClass' => MasterNegara::className(), 'targetAttribute' => ['item_manufactured_country_address' => 'negara_id']],
            [['item_manufactured_state_address'], 'exist', 'skipOnError' => true, 'targetClass' => MasterNegeri::className(), 'targetAttribute' => ['item_manufactured_state_address' => 'negeri_id']],
            [['item_manufactured_city_address'], 'exist', 'skipOnError' => true, 'targetClass' => MasterDaerah::className(), 'targetAttribute' => ['item_manufactured_city_address' => 'daerah_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'item_id' => 'Item ID',
            'item_name' => 'Item Name',
            'item_product_id' => 'Item Product ID',
            'item_type' => 'Item Type',
            'item_quantity' => 'Item Quantity',
            'item_price' => 'Item Price',
            'item_brand' => 'Item Brand',
            'item_model' => 'Item Model',
            'item_company_manufacturer' => 'Item Company Manufacturer',
            'item_manufactured_country_address' => 'Item Manufactured Country Address',
            'item_manufactured_state_address' => 'Item Manufactured State Address',
            'item_manufactured_city_address' => 'Item Manufactured City Address',
            'item_manufactured_postcode_address' => 'Item Manufactured Postcode Address',
            'item_manufactured_street_address' => 'Item Manufactured Street Address',
            'item_manufactured_no_address' => 'Item Manufactured No Address',
            'item_weight' => 'Item Weight',
            'item_size_height' => 'Item Size Height',
            'item_size_width' => 'Item Size Width',
            'item_size_length' => 'Item Size Length',
            'item_manufactured_date' => 'Item Manufactured Date',
            'item_availability_date_start' => 'Item Availability Date Start',
            'item_availability_date_end' => 'Item Availability Date End',
            'item_registered_on_system_date' => 'Item Registered On System Date',
            'item_updated_on_system_date' => 'Item Updated On System Date',
            'item_activeness' => 'Item Activeness',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItemManufacturedCountryAddress()
    {
        return $this->hasOne(MasterNegara::className(), ['negara_id' => 'item_manufactured_country_address']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItemManufacturedStateAddress()
    {
        return $this->hasOne(MasterNegeri::className(), ['negeri_id' => 'item_manufactured_state_address']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItemManufacturedCityAddress()
    {
        return $this->hasOne(MasterDaerah::className(), ['daerah_id' => 'item_manufactured_city_address']);
    }
}
