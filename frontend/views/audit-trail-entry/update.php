<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model frontend\models\AuditTrailEntry */

$this->title = 'Update Audit Trail Entry: {nameAttribute}';
$this->params['breadcrumbs'][] = ['label' => 'Audit Trail Entries', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="audit-trail-entry-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
