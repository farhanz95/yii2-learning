<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\models\Item;

/**
 * ItemSearch represents the model behind the search form of `frontend\models\Item`.
 */
class ItemSearch extends Item
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['item_id', 'item_quantity', 'item_manufactured_country_address', 'item_manufactured_state_address', 'item_manufactured_city_address', 'item_manufactured_postcode_address', 'item_activeness'], 'integer'],
            [['item_name', 'item_product_id', 'item_type', 'item_price', 'item_brand', 'item_model', 'item_company_manufacturer', 'item_manufactured_street_address', 'item_manufactured_no_address', 'item_weight', 'item_size_height', 'item_size_width', 'item_size_length', 'item_manufactured_date', 'item_availability_date_start', 'item_availability_date_end', 'item_registered_on_system_date', 'item_updated_on_system_date'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Item::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'item_id' => $this->item_id,
            'item_quantity' => $this->item_quantity,
            'item_manufactured_country_address' => $this->item_manufactured_country_address,
            'item_manufactured_state_address' => $this->item_manufactured_state_address,
            'item_manufactured_city_address' => $this->item_manufactured_city_address,
            'item_manufactured_postcode_address' => $this->item_manufactured_postcode_address,
            'item_manufactured_date' => $this->item_manufactured_date,
            'item_availability_date_start' => $this->item_availability_date_start,
            'item_availability_date_end' => $this->item_availability_date_end,
            'item_registered_on_system_date' => $this->item_registered_on_system_date,
            'item_updated_on_system_date' => $this->item_updated_on_system_date,
            'item_activeness' => $this->item_activeness,
        ]);

        $query->andFilterWhere(['like', 'item_name', $this->item_name])
            ->andFilterWhere(['like', 'item_product_id', $this->item_product_id])
            ->andFilterWhere(['like', 'item_type', $this->item_type])
            ->andFilterWhere(['like', 'item_price', $this->item_price])
            ->andFilterWhere(['like', 'item_brand', $this->item_brand])
            ->andFilterWhere(['like', 'item_model', $this->item_model])
            ->andFilterWhere(['like', 'item_company_manufacturer', $this->item_company_manufacturer])
            ->andFilterWhere(['like', 'item_manufactured_street_address', $this->item_manufactured_street_address])
            ->andFilterWhere(['like', 'item_manufactured_no_address', $this->item_manufactured_no_address])
            ->andFilterWhere(['like', 'item_weight', $this->item_weight])
            ->andFilterWhere(['like', 'item_size_height', $this->item_size_height])
            ->andFilterWhere(['like', 'item_size_width', $this->item_size_width])
            ->andFilterWhere(['like', 'item_size_length', $this->item_size_length]);

        return $dataProvider;
    }
}
