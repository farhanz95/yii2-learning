<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\ItemSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'item_id') ?>

    <?= $form->field($model, 'item_name') ?>

    <?= $form->field($model, 'item_product_id') ?>

    <?= $form->field($model, 'item_type') ?>

    <?= $form->field($model, 'item_quantity') ?>

    <?php // echo $form->field($model, 'item_price') ?>

    <?php // echo $form->field($model, 'item_brand') ?>

    <?php // echo $form->field($model, 'item_model') ?>

    <?php // echo $form->field($model, 'item_company_manufacturer') ?>

    <?php // echo $form->field($model, 'item_manufactured_country_address') ?>

    <?php // echo $form->field($model, 'item_manufactured_state_address') ?>

    <?php // echo $form->field($model, 'item_manufactured_city_address') ?>

    <?php // echo $form->field($model, 'item_manufactured_postcode_address') ?>

    <?php // echo $form->field($model, 'item_manufactured_street_address') ?>

    <?php // echo $form->field($model, 'item_manufactured_no_address') ?>

    <?php // echo $form->field($model, 'item_weight') ?>

    <?php // echo $form->field($model, 'item_size_height') ?>

    <?php // echo $form->field($model, 'item_size_width') ?>

    <?php // echo $form->field($model, 'item_size_length') ?>

    <?php // echo $form->field($model, 'item_manufactured_date') ?>

    <?php // echo $form->field($model, 'item_availability_date_start') ?>

    <?php // echo $form->field($model, 'item_availability_date_end') ?>

    <?php // echo $form->field($model, 'item_registered_on_system_date') ?>

    <?php // echo $form->field($model, 'item_updated_on_system_date') ?>

    <?php // echo $form->field($model, 'item_activeness') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
