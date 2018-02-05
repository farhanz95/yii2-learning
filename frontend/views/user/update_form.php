<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
/* @var $this yii\web\View */
/* @var $model frontend\models\User */
$this->title = 'Update User: '.$model->username;
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->username, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="user-update">

    <h1><?= Html::encode($this->title) ?></h1>

        
    <div class="user-form">

        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'fullname')->textInput() ?>

        <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
        
        <?php if (!isset(Yii::$app->authManager->getRolesByUser($model->id)['Admin'])): ?>
        <?= $form->field($model, 'status')->dropDownList([
                10 => 'Active',
                0 => 'Not Active'
        ]) ?>
        <?php endif ?>

        <div class="form-group">
            <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

</div>