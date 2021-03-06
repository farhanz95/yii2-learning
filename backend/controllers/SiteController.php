<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use common\models\User;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login','register', 'error','changepassword'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionChangepassword()
    {
        $model = new User;
        $model->scenario = 'changePwd';

        if ($data = Yii::$app->request->post()) {
            dd($data);
        }

        return $this->render('changepassword',[
            'model'=>$model
        ]);
    }

    /**
     * Login action.
     *
     * @return string
     */
    public function actionLogin()
    {
        $this->layout = 'login';
        
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if (Yii::$app->request->post()) {

            $data = Yii::$app->request->post();
            $data['LoginForm']['rememberMe'] = isset($data['LoginForm']['rememberMe']) ? true : false;

            if ($model->load($data) && $model->login()) {
                return $this->goBack();
            }else{
                return $this->render('login', [
                    'model' => $model,
                ]);
            }

        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    public function actionRegister()
    {
        $this->layout = 'login';

        $model = new \common\models\RegisterForm();

        if ($data = Yii::$app->request->post()) {

            if ($model->load($data)) {

            // echo "<pre>";
            // \yii\helpers\VarDumper::dump(\yii\widgets\ActiveForm::validate($model));
            // echo "</pre>";
            // die;

                if ($user = $model->register()) {

                    return $this->redirect('login');
                    
                }
            }
            
        }

        return $this->render('register',[
            'model' => $model
        ]);
    }

    public function actionGetPelanNomborTelefonMalaysia($id){
        return \common\models\PelanNomborTelefonMalaysia::findOne($id)->pelan_nama;
    }

    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }
}
