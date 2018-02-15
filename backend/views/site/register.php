<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\MasterNegara;
use yii\captcha\Captcha;
use kartik\date\DatePicker;
use yii\widgets\MaskedInput;

$countryList = ArrayHelper::map(MasterNegara::find()->groupBy(['negara_nama'])->asArray()->all(),'negara_id','negara_nama');

$this->title = 'Register';
$this->params['breadcrumbs'][] = $this->title;
?>

<?php 

$this->registerCss("
div.required label.control-label:after {
    content: \" *\";
    color: red;
    font-size: 20px;
}
body {
  min-height: 2200px !important;
}
.asterisk:after {
  content: \" *\";
  color: red;
  font-size: 20px;
}
");
$this->registerJs("

$('body').on('keyup','input[name=\"RegisterForm[mobile_phone_no]\"]',function(e){
  
  var valueSubString3 = $(this).val().substring(0,3);

  var value = $(this).val();

  if($.isNumeric(valueSubString3)){

    $.ajax({
        type: 'post',
        url: '".Yii::getAlias('@web')."/get/get-pelan-nombor-telefon-malaysia?id='+value,
        success: function(data){
           if(data){
            $('.operator_no_telefon_bimbit').text('Operator : '+data);
           }else{
            $('.operator_no_telefon_bimbit').text('');
           }
        } 
    })

  }else{
     $('.operator_no_telefon_bimbit').text('');
  }

})

");

?>  

    <?php $form = ActiveForm::begin(['id' => 'register-form']); ?>

    <div class="admin-form theme-danger tab-pane mw700 active" id="register1" role="tabpanel">
                <div class="panel">
                  <div class="panel-heading">
                    <span class="panel-title">
                      <i class="fa fa-pencil-square"></i>Register Account
                    </span>
                  </div>

                    <div class="panel-body p25">

                      <div class="panel">
                        <div class="panel-heading">
                          <span class="panel-title"><span class='fa fa-user' style="font-size:40px"></span></span>
                        </div>
                        <div class="panel-body">

                          <?= $form->field($model, 'first_name',['template'=>'
                          <label for="first_name" class="field-label control-label">'.$model->getAttributeLabel('first_name').'</label>
                          <label for="first_name" class="field prepend-icon">
                            {input}{hint}{error}
                            <label for="first_name" class="field-icon">
                              <i class="fa fa-user"></i>
                          </label>
                          '])->textInput(['autofocus' => false]) ?>

                            
                          <?= $form->field($model, 'last_name',['template'=>'
                          <label for="last_name" class="field-label control-label">'.$model->getAttributeLabel('last_name').'</label>
                          <label for="last_name" class="field prepend-icon">
                            {input}{hint}{error}
                            <label for="last_name" class="field-icon">
                              <i class="fa fa-user"></i>
                          </label>
                          '])->textInput(['autofocus' => false]) ?>
                          
                          <?= $form->field($model, 'username',['template'=>'
                          <div class="smart-widget sm-right">
                          <label for="username" class="field-label control-label">'.$model->getAttributeLabel('username').'</label>
                          <label for="username" class="field prepend-icon">
                            {input}{hint}{error}
                            <label for="username" class="field-icon">
                              <i class="fa fa-user"></i>
                          </label>
                          <label for="username" class="button">@fstech.com</label>
                          </div>
                          '])->textInput(['autofocus' => false]) ?>

                          <?=
                            $form->field($model, 'gender')
                                ->radioList(
                                    ['M' => 'Male', 'F' => 'Female', 'O' => 'Other'],
                                    [
                                        'item' => function($index, $label, $name, $checked, $value) {

                                            $return = '<label for="'.$label.'" class="block mt15 option option-primary">';
                                            $return .= '<input type="radio" name="' . $name . '" id="'.$label.'" value="' . $value . '" tabindex="3">';
                                            $return .= '<span class="radio"></span> '.$label;
                                            $return .= '</label>';

                                            return $return;
                                        }
                                    ]
                                )
                            ->label(true);
                          ?>

                        </div>

                      </div>

                      <div class="panel">
                        <div class="panel-heading">
                          <span class="panel-title"><span class='fa fa-home' style="font-size:40px"></span></span>
                        </div>
                        <div class="panel-body">

                        <?= $form->field($model, 'birth_country',['template'=>'
                        <label for="birth_country" class="field-label control-label">'.$model->getAttributeLabel('birth_country').'</label>
                          {input}{hint}{error}
                        '])->dropDownList($countryList,['prompt'=>'-Select Country-']) ?>

                        <?= $form->field($model, 'birth_date', ['template' => '
                          <label for="birth_date" class="field-label control-label">'.$model->getAttributeLabel('birth_date').'</label>
                            <label for="birth_date" class="field prepend-icon">
                              {input}{hint}{error}
                          '])->widget(DatePicker::classname(),[
                          'options' => ['placeholder' => ''],
                          'value' => date('d-M-Y'),
                          'type' => DatePicker::TYPE_COMPONENT_APPEND,
                          'pluginOptions' => [
                            'autoclose'=>true,
                            'format' => 'dd-mm-yyyy',
                            'todayHighlight' => TRUE,
                        ]
                        ]);
                        ?>

                        </div>

                      </div>

                      <div class="panel">
                        <div class="panel-heading">
                          <span class="panel-title"><span class='fa fa-phone' style="font-size:40px"></span></span>
                        </div>
                        <div class="panel-body">


                      <?= $form->field($model, 'email',['template'=>'
                          <label for="email" class="field-label control-label">'.$model->getAttributeLabel('email').'</label>
                          <label for="email" class="field prepend-icon">
                            {input}{hint}{error}
                            <label for="email" class="field-icon">
                              <i class="fa fa-envelope"></i>
                          </label>
                          '])->textInput(['autofocus' => false]) ?>

                     <label class="control-label text-primary mb20 asterisk">Either one phone number need to be filled</label>

                      <?= $form->field($model, 'mobile_phone_no', ['template' => '
                          <label for="mobile_phone_no" class="field-label control-label">'.$model->getAttributeLabel('mobile_phone_no').'</label>
                          <label for="mobile_phone_no" class="field prepend-icon">
                            {input}{hint}{error}
                            <span class="operator_no_telefon_bimbit text-primary"></span>
                            <label for="mobile_phone_no" class="field-icon">
                              <i class="fa fa-phone"></i>
                          </label>
                          '])->widget(MaskedInput::classname(),[
                          'name' => 'mobile_phone_no',
                          'mask' => '999-999-9999',
                        ]);
                      ?>

                      <?= $form->field($model, 'home_phone_no', ['template' => '
                          <label for="home_phone_no" class="field-label control-label">'.$model->getAttributeLabel('home_phone_no').'</label>
                          <label for="home_phone_no" class="field prepend-icon">
                            {input}{hint}{error}
                            <label for="home_phone_no" class="field-icon">
                              <i class="fa fa-phone"></i>
                          </label>
                          '])->widget(MaskedInput::classname(),[
                          'name' => 'home_phone_no',
                          'mask' => '99-9999-9999',
                        ]);
                      ?>
  

                        </div>

                      </div>

                      <div class="panel">
                        <div class="panel-heading">
                          <span class="panel-title"><span class='fa fa-key' style="font-size:40px"></span></span>
                        </div>
                        <div class="panel-body">

                        <?= $form->field($model, 'password',['template'=>'
                        <label for="password" class="field-label control-label">'.$model->getAttributeLabel('password').'</label>
                        <label for="password" class="field prepend-icon">
                          {input}{hint}{error}
                          <label for="password" class="field-icon">
                            <i class="fa fa-lock"></i>
                        </label>
                        '])->passwordInput(['autofocus' => false,'placeholder'=>'']) ?>

                        <?= $form->field($model, 'confirm_passwords',['template'=>'
                        <label for="confirm_passwords" class="field-label control-label">'.$model->getAttributeLabel('confirm_passwords').'</label>
                        <label for="confirm_passwords" class="field prepend-icon">
                          {input}{hint}{error}
                          <label for="confirm_passwords" class="field-icon">
                            <i class="fa fa-unlock-alt"></i>
                        </label>
                        '])->passwordInput(['autofocus' => false,'placeholder'=>'']) ?>

                        </div>

                      </div>
                      

                      <div class="section">

                        <?=
                        $form->field($model, 'agreement')
                            ->checkBoxList(
                                [1 => 'Agreement'],
                                [
                                    'item' => function($index, $label, $name, $checked, $value) {

                                        $return = '<label class="block mt15 option option-primary">';
                                        $return .= '<input type="checkbox" name="' . $name . '"><span class="checkbox mr10"></span> I agree to the <a href="#" class="theme-link"> terms of use </a>';
                                        $return .= '</label>';

                                        return $return;
                                    }
                                ]
                            )
                        ->label(false);
                        ?>

                      </div>
                      <!-- end section -->

                    </div>
                    <!-- end .form-body section -->
                    <div class="panel-footer">
                      <button type="submit" class="button btn-primary">Create Account</button>
                    </div>
                    <!-- end .form-footer section -->
                  </form>
                </div>
                <!-- end .admin-form section -->
              </div>

    <?php ActiveForm::end(); ?>
