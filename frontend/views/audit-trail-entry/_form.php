<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\AuditTrailEntry */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="audit-trail-entry-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'model_type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'happened_at')->textInput() ?>

    <?= $form->field($model, 'foreign_pk')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'user_id')->textInput() ?>

    <?= $form->field($model, 'type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'data')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
