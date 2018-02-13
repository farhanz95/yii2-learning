<?php
namespace common\models;
use yii\base\Model;
use common\models\User;
use borales\extensions\phoneInput\PhoneInputValidator;
/**
 * Signup form
 */
class RegisterForm extends Model
{
    public $username;
    public $email;
    public $fullname;
    public $password;
    public $confirm_passwords;
    public $status;
    public $permission;
    public $role;

    public $first_name;
    public $last_name;

    public $birth_year;
    public $birth_month;
    public $birth_day;

    public $birth_country;
    public $birth_state;
    public $birth_city;
    public $gender;
    public $mobile_phone_no;

    public $agreement;
    public $verifyCode;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'trim'],
            [['first_name','last_name','birth_year','birth_month','birth_day','birth_country','gender','mobile_phone_no','username'], 'required'],
            ['username', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This username has already been taken.'],
            ['username', 'string', 'min' => 2, 'max' => 255],
            ['email', 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'string', 'max' => 255],
            ['email', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This email address has already been taken.'],
            ['password', 'required'],
            ['password', 'string', 'min' => 6],
            ['confirm_passwords', 'compare', 'compareAttribute' => 'password'],
            [['mobile_phone_no'], 'string'],
            [['mobile_phone_no'], PhoneInputValidator::className()],
            [['agreement'],'required','message'=>''],
            ['verifyCode','captcha'],
        ];
    }
    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function signup()
    {
        if (!$this->validate()) {
            return null;
        }
        
        $user = new User();
        $user->username = $this->username;
        $user->email = $this->email;
        $user->setPassword($this->password);
        $user->generateAuthKey();
        $user->save(false);

        // the following three lines were added:
        $auth = \Yii::$app->authManager;
        $authorRole = $auth->getRole('frontend_user');
        $auth->assign($authorRole, $user->getId());

        return $user;
    }
}