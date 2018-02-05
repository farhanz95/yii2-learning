<?php
use yii\helpers\Html;
use yii\grid\GridView;
/* @var $this yii\web\View */
/* @var $searchModel frontend\models\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = 'Users';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create User', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            [
                'header' => 'No',
                'class' => 'yii\grid\SerialColumn'
            ],
            // 'id',
            'username',
            // 'auth_key',
            // 'password_hash',
            // 'password_reset_token',
            'email:email',
            //'status',
            //'created_at',
            //'updated_at',
            [
                'header' => 'Account Type',
                'value' => function($model){
                    if (isset(Yii::$app->authManager->getRolesByUser($model->id)['Admin'])) {
                        return 'Admin';
                    }else{
                        return 'Normal User';
                    }
                },
                'headerOptions' => ['style'=>'width:10%'],
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'header' => 'Action',
                'template' => '{view} {update} {delete}',
                'buttons' => [
                    'view' => function ($url, $model) {
                        return Html::a('<span class="glyphicon glyphicon-eye-open"></span>', $url, [
                                    'title' => Yii::t('app', 'View'),
                        ]);
                    },
                    'update' => function ($url, $model) {
                        if (isset(Yii::$app->authManager->getRolesByUser($model->id)['Admin'])) {
                            // Only Can Edit His Own
                            if (Yii::$app->user->id == $model->id) {
                                return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
                                            'title' => Yii::t('app', 'Update'),
                                ]);
                            }
                        }
                    },
                    'delete' => function ($url, $model) {
                        if (isset(Yii::$app->authManager->getRolesByUser($model->id)['Admin'])) {
                            return '';
                        }else{
                            if (Yii::$app->user->can('Admin')) {
                                return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                                            'title' => Yii::t('app', 'Delete'),
                                            'data-method' => 'post',
                                            'data-confirm' => 'Are you sure you want to delete this item?'
                                ]);
                            }
                        }
                    }
                ]
            ],
        ],
    ]); ?>
</div>