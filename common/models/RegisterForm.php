<?php
namespace common\models;
use yii\base\Model;
use common\models\User;
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

    public $birth_date;

    public $birth_country;
    public $birth_state;
    public $birth_city;
    public $gender;
    public $mobile_phone_no;
    public $home_phone_no;

    public $agreement;
    public $verifyCode;
    public $dataDialCode;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'trim'],
            [['first_name','last_name','birth_date','birth_country','gender','username'], 'required'],
            ['username', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This username has already been taken.'],
            ['username', 'string', 'min' => 2, 'max' => 255],
            ['email', 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'string', 'max' => 255],
            ['email', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This email address has already been taken.'],
            [['password','confirm_passwords'], 'required'],
            ['password', 'string', 'min' => 6],
            ['confirm_passwords', 'compare', 'compareAttribute' => 'password'],
            [['mobile_phone_no','home_phone_no'], 'string'],
            [['mobile_phone_no'], 'match', 'pattern' => '/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/','message'=>'Mobile Phone No does not match pattern e.g : 012-345-6789'],
            [['home_phone_no'], 'match', 'pattern' => '/^\(?([0-9]{2})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/','message'=>'Home Phone No does not match pattern e.g : 012-345-6789'],
            [['agreement'],'required','message'=>'(To proceed please agree to the term of use)'],
            ['home_phone_no', 'either', 'params' => ['other' => 'mobile_phone_no']],
        ];
    }

    public function either($attribute_name, $params)
    {
        $field1 = $this->getAttributeLabel($attribute_name);
        $field2 = $this->getAttributeLabel($params['other']);
        if (empty($this->$attribute_name) || empty($this->{$params['other']})) {
            $this->addError($attribute_name, "Either {$field1} or {$field2} is required.");
        }
    }

    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function register()
    {
        if (!$this->validate()) {
            return null;
        }
        
        $user = new User();
        $user->username = $this->username;
        $user->email = $this->email;
        $user->setPassword($this->password);
        $user->generateAuthKey();
        // for registration
        $user->first_name = $this->first_name;
        $user->last_name = $this->last_name;
        $user->birth_date = date_format(date_create($this->birth_date),'Y-m-d');
        $user->birth_country = $this->birth_country;
        $user->gender = $this->gender;
        $user->mobile_phone_no = $this->mobile_phone_no;
        $user->home_phone_no = $this->home_phone_no;
        //
        $user->save(false);

        // the following three lines were added:
        $auth = \Yii::$app->authManager;
        $authorRole = $auth->getRole('frontend_user');
        $auth->assign($authorRole, $user->getId());

        return $user;
    }
}