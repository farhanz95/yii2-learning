<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model frontend\models\Item */

$this->title = $model->item_id;
$this->params['breadcrumbs'][] = ['label' => 'Items', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->item_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->item_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'item_id',
            'item_name',
            'item_product_id',
            'item_type',
            'item_quantity',
            'item_price',
            'item_brand',
            'item_model',
            'item_company_manufacturer',
            'item_manufactured_country_address',
            'item_manufactured_state_address',
            'item_manufactured_city_address',
            'item_manufactured_postcode_address',
            'item_manufactured_street_address',
            'item_manufactured_no_address',
            'item_weight',
            'item_size_height',
            'item_size_width',
            'item_size_length',
            'item_manufactured_date',
            'item_availability_date_start',
            'item_availability_date_end',
            'item_registered_on_system_date',
            'item_updated_on_system_date',
            'item_activeness',
        ],
    ]) ?>

</div>
