<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model frontend\models\AuditTrailEntry */

$this->title = 'Create Audit Trail Entry';
$this->params['breadcrumbs'][] = ['label' => 'Audit Trail Entries', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="audit-trail-entry-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
