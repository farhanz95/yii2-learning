<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\AuditTrailEntrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Audit Trail Entries';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="audit-trail-entry-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['header'=>'No','class' => 'yii\grid\SerialColumn'],

            // 'id',
            'model_type',
            [
                'header' => 'Happened At',
                'value' => function($model){
                    return date('Y-m-d H:i:s',$model->happened_at);
                }
            ],
            [
                'header' => 'Key',
                'format' => 'raw',
                'value' => function($model){
                    $objectAudit = json_decode($model->foreign_pk,true);
                    $val = '';
                    foreach ($objectAudit as $keyAudit => $valueAudit) {
                        $val = $keyAudit." : ".$valueAudit;
                    }
                    return $val;
                },
            ],
            'user_id',
            'type',
            [
                'header' => 'Data',
                'format' => 'raw',
                'headerOptions' => ['style'=>'width:20%'],
                'value' => function($model){
                    if ($model->type=='update') {
                        $objectAudit = json_decode($model->data,true);
                        $val = '';
                        foreach ($objectAudit as $keyAudit => $valueAudit) {
                            $val .= $valueAudit['attr'] . " <span class='text-danger'>FROM </span> " . $valueAudit['from'] . " TO " . ($valueAudit['to'] ? $valueAudit['to'] : '<i>NULL</i>');
                            $val .= "<br>";
                        }
                        return $val;
                    }
                    if ($model->type=='insert') {
                        $objectAudit = json_decode($model->data,true);
                        $val = '';
                        foreach ($objectAudit as $keyAudit => $valueAudit) {
                            $val .= "<span class='text-danger'>".$valueAudit['attr']."</span>" . "<br> - ". ($valueAudit['to'] ? $valueAudit['to'] : '<i>NULL</i>');
                            $val .= "<br>";
                        }
                        return $val;
                    }
                },
            ],

            // ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
