<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\Item */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'item_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_product_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_quantity')->textInput() ?>

    <?= $form->field($model, 'item_price')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_brand')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_model')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_company_manufacturer')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_manufactured_country_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_manufactured_state_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_manufactured_city_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_manufactured_postcode_address')->textInput() ?>

    <?= $form->field($model, 'item_manufactured_street_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_manufactured_no_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_weight')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_size_height')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_size_width')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_size_length')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_manufactured_date')->textInput() ?>

    <?= $form->field($model, 'item_availability_date_start')->textInput() ?>

    <?= $form->field($model, 'item_availability_date_end')->textInput() ?>

    <?= $form->field($model, 'item_registered_on_system_date')->textInput() ?>

    <?= $form->field($model, 'item_updated_on_system_date')->textInput() ?>

    <?= $form->field($model, 'item_activeness')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
