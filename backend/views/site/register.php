<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\MasterNegara;
use yii\captcha\Captcha;
use borales\extensions\phoneInput\PhoneInput;

$countryList = ArrayHelper::map(MasterNegara::find()->groupBy(['negara_nama'])->asArray()->all(),'negara_id','negara_nama');

$this->title = 'Register';
$this->params['breadcrumbs'][] = $this->title;
?>
  
    <?php $form = ActiveForm::begin(['id' => 'register-form']); ?>

    <div class="admin-form theme-danger tab-pane mw700 active" id="register1" role="tabpanel">
                <div class="panel panel-danger heading-border">
                  <div class="panel-heading">
                    <span class="panel-title">
                      <i class="fa fa-pencil-square"></i>Create Account
                    </span>
                  </div>
                  <!-- end .form-header section -->

                  <form method="post" action="/" id="form-register1">
                    <div class="panel-body p25">
                      <label for="names" class="field-label">Your names</label>
                      <div class="section row">
                        <div class="col-md-6">

                          <?= $form->field($model, 'first_name',['template'=>'
                          <label for="first_name" class="field prepend-icon">
                            {input}{hint}{error}
                            <label for="first_name" class="field-icon">
                              <i class="fa fa-user"></i>
                          </label>
                          '])->textInput(['autofocus' => false,'placeholder'=>'First Name..'])->label(false) ?>

                        </div>
                        <!-- end section -->

                        <div class="col-md-6">

                          <?= $form->field($model, 'last_name',['template'=>'
                          <label for="last_name" class="field prepend-icon">
                            {input}{hint}{error}
                            <label for="last_name" class="field-icon">
                              <i class="fa fa-user"></i>
                          </label>
                          '])->textInput(['autofocus' => false,'placeholder'=>'Last Name..'])->label(false) ?>

                        </div>
                        <!-- end section -->

                      </div>
                      <!-- end section row section -->

                      <div class="section">
                        <label for="username" class="field-label">Choose your username</label>
                        <div class="smart-widget sm-right smr-120">
                          
                          <?= $form->field($model, 'username',['template'=>'
                          <label for="username" class="field prepend-icon">
                            {input}{hint}{error}
                            <label for="username" class="field-icon">
                              <i class="fa fa-user"></i>
                          </label>
                          '])->textInput(['autofocus' => false,'placeholder'=>'Example : '])->label(false) ?>

                          <label for="username" class="button">.farhanramli.com</label>
                        </div>
                        <!-- end .smart-widget section -->
                      </div>
                      <!-- end section -->

                      <div class="section">
                        <label for="password" class="field-label">Create a password</label>

                        <?= $form->field($model, 'password',['template'=>'
                        <label for="password" class="field prepend-icon">
                          {input}{hint}{error}
                          <label for="password" class="field-icon">
                            <i class="fa fa-lock"></i>
                        </label>
                        '])->passwordInput(['autofocus' => false,'placeholder'=>''])->label(false) ?>

                      </div>
                      <!-- end section -->

                      <div class="section">
                        <label for="confirmPassword" class="field-label">Confirm your password</label>

                        <?= $form->field($model, 'confirm_passwords',['template'=>'
                        <label for="confirm_passwords" class="field prepend-icon">
                          {input}{hint}{error}
                          <label for="confirm_passwords" class="field-icon">
                            <i class="fa fa-unlock-alt"></i>
                        </label>
                        '])->passwordInput(['autofocus' => false,'placeholder'=>''])->label(false) ?>

                      </div>
                      <!-- end section -->

                      <label for="birthday" class="field-label">Your Birth Date</label>
                      <div class="section row">

                        <div class="col-md-4">
                            <?= $form->field($model, 'birth_year')->dropDownList(array_combine(array_merge([''], range(date('Y'), 1880)), array_merge(['-Select Year-'], range(date('Y'), 1880))))->label(false) ?>
                        </div>

                        <div class="col-md-4">
                          <?php 
                          $monthList['01'] = '01 - January';
                          $monthList['02'] = '02 - February';
                          $monthList['03'] = '03 - March';
                          $monthList['04'] = '04 - April';
                          $monthList['05'] = '05 - May';
                          $monthList['06'] = '06 - Jun';
                          $monthList['07'] = '07 - July';
                          $monthList['08'] = '08 - August';
                          $monthList['09'] = '09 - September';
                          $monthList['10'] = '10 - October';
                          $monthList['11'] = '11 - November';
                          $monthList['12'] = '12 - December';
                          ?>

                          <?= $form->field($model, 'birth_month')->dropDownList($monthList,['prompt'=>'-Select Month-'])->label(false) ?>
                        </div>

                        <div class="col-md-4">
                          <label for="birth_day" class="field">
                            <?= $form->field($model, 'birth_day')->dropDownList(array_combine(array_merge([''], range(1, 28)), array_merge(['-Select Day-'], range(1,28))))->label(false) ?>
                          </label>
                        </div>

                      </div>

                      <div class="section">
                        <label for="location" class="field-label">Birth Country</label>

                        <?= $form->field($model, 'birth_country')->dropDownList($countryList,['prompt'=>'-Select Country-'])->label(false) ?>

                      </div>

                      <div class="section">

                            <label for="gender" class="field-label">Gender</label>

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
                            ->label(false);
                            ?>

                      </div>
                      <!-- end section -->

                      <div class="section">
                        <label for="email" class="field-label">Your email address</label>

                        <?= $form->field($model, 'email',['template'=>'
                          <label for="email" class="field prepend-icon">
                            {input}{hint}{error}
                            <label for="email" class="field-icon">
                              <i class="fa fa-envelope"></i>
                          </label>
                          '])->textInput(['autofocus' => false,'placeholder'=>'example@domain.com...'])->label(false) ?>

                      </div>
                      <!-- end section -->
                      
                      <div class="section">
                        <label for="mobile_phone_no" class="field-label"><?= $model->getAttributeLabel('mobile_phone_no') ?></label>

                        <?php 

                        $this->registerCss(" 
                          .intl-tel-input {
                              display: inherit !important;
                          } 
                        ");

                        echo $form->field($model, 'mobile_phone_no')->widget(PhoneInput::className(), [
                            'jsOptions' => [
                                'preferredCountries' => ['my'],
                            ]
                        ])->label(false);

                        ?>

                      </div>

                      <!-- <div class="section">
                        <label for="verify" class="field-label">Prove you're not a robot</label>
                        <div class="smart-widget sm-left sml-80">
                          <label for="verify" class="field prepend-icon">
                            <input type="text" name="verify" id="verify" class="gui-input" placeholder="Enter captcha">
                            <label for="verify" class="field-icon">
                              <i class="fa fa-shield"></i>
                            </label>
                          </label>
                          <label for="verify" class="button">4 + 12</label>
                        </div>

                      </div> -->
                      

                      <div class="section">

                        <?=
                        $form->field($model, 'agreement')
                            ->checkBoxList(
                                [1 => 'Agreement'],
                                [
                                    'item' => function($index, $label, $name, $checked, $value) {

                                        $return = '<label class="block mt15 option option-primary">';
                                        $return .= '<input type="checkbox" name="' . $name . '"><span class="checkbox mr10"></span> Agree to our <a href="#" class="theme-link"> terms of service </a>';
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



<?php 
$js = "
$('body').on('change','select[name=\"RegisterForm[birth_month]\"],select[name=\"RegisterForm[birth_year]\"]',function(){
  
  if($('select[name=\"RegisterForm[birth_month]\"] option:selected').val()){

      var monthSelect = $('select[name=\"RegisterForm[birth_month]\"] option:selected').val();

      if(jQuery.inArray(monthSelect,['01','03','05','07','08','10','12']) != -1 ){
        var day = 31;
      }
      if(jQuery.inArray(monthSelect,['04','06','09','11']) != -1 ){
        var day = 30;
      }
      if(jQuery.inArray(monthSelect,['02']) != -1 ){
        var day = 28;

        if($('select[name=\"RegisterForm[birth_year]\"] option:selected').val()){
            
            if($(this).val() % day == 0){
                day = 29;
            }

        }

      }
      var rangeDay = range(1,(day+1));
      
      $('select[name=\"RegisterForm[birth_day]\"]').html('');

      $('select[name=\"RegisterForm[birth_day]\"]').append('<option value=\"\">-Select Day-</option>')

      $.each(rangeDay, function (i,v) {
          $('select[name=\"RegisterForm[birth_day]\"]').append($('<option>', { 
              value: v,
              text : v 
          }));
      });

  }else{
      $('select[name=\"RegisterForm[birth_day]\"]').html('<option value=\"\">-Select Month First-</option>')
  }

})
";
$this->registerJs($js);
?>