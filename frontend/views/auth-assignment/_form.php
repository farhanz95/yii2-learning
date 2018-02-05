<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

$userList = ArrayHelper::map(\frontend\models\User::find()->orderBy('fullname')->asArray()->all(),'id','fullname');
$itemList = ArrayHelper::map(\frontend\models\AuthItem::find()->orderBy('name')->asArray()->all(),'name','name');

/* @var $this yii\web\View */
/* @var $model frontend\models\AuthAssignment */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="auth-assignment-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'item_name')->dropDownList($itemList) ?>

    <?= $form->field($model, 'user_id')->dropDownList($userList) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
