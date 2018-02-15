<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;

/**
 * Site controller
 */
class GetController extends Controller
{

    public function actionGetPelanNomborTelefonMalaysia($id){
        
        $model = \common\models\PelanNomborTelefonMalaysia::findOne(substr($id,0,3));

        if (!$model) {
            $model = \common\models\PelanNomborTelefonMalaysia::findOne(substr($id,0,4));
        }
        if (!$model) {
            $model = \common\models\PelanNomborTelefonMalaysia::findOne(substr($id,0,5));
        }
        if (!$model) {
            $model = \common\models\PelanNomborTelefonMalaysia::findOne(substr($id,0,6));
        }

        if ($model) {
           return $model->pelan_nama;
        }else{
            return '';
        }

    }
}
