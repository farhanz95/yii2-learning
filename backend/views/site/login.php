<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
  
    <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>

    <div class="tab-content mw900 center-block center-children">
    <!-- Login 2 -->
      <div class="admin-form theme-primary tab-pane active" id="login2" role="tabpanel">
        <div class="panel panel-primary heading-border">
          <div class="panel-heading">
            <span class="panel-title">
              <i class="fa fa-sign-in"></i>Login</span>
          </div>
          <!-- end .form-header section -->

          <form method="post" action="/" id="form-login2">
            <div class="panel-body p25 pt10">
              <div class="section row">
                <div class="col-md-6">
                  <div class="section-divider mv40">
                    <span>Sign in With</span>
                  </div>
                  <!-- .tagline -->

                  <div class="section">
                    <a href="#" class="button btn-social facebook span-left btn-block">
                      <span>
                        <i class="fa fa-facebook"></i>
                      </span>Facebook</a>
                    <a href="#" class="button btn-social twitter span-left btn-block">
                      <span>
                        <i class="fa fa-twitter"></i>
                      </span>Twitter</a>
                    <a href="#" class="button btn-social googleplus span-left btn-block">
                      <span>
                        <i class="fa fa-google-plus"></i>
                      </span>Google+</a>
                  </div>
                  <!-- end section -->

                </div>
                <!-- end .colm section -->

                <div class="col-md-6">
                  <div class="section-divider mv40">
                    <span>OR Login</span>
                  </div>
                  <!-- .tagline -->

                  <?= $form->field($model, 'username',['template'=>'
                  <label for="username" class="field prepend-icon">
                    {input}{hint}{error}
                    <label for="username" class="field-icon">
                      <i class="fa fa-user"></i>
                  </label>
                  '])->textInput(['autofocus' => false,'placeholder'=>'Enter username'])->label(false) ?>

                  <!-- end section -->

                  <?= $form->field($model, 'password',['template'=>'
                  <label for="password" class="field prepend-icon">
                    {input}{hint}{error}
                    <label for="password" class="field-icon">
                      <i class="fa fa-lock"></i>
                  </label>
                  '])->passwordInput(['autofocus' => false,'placeholder'=>'Enter password'])->label(false) ?>

                  <!-- end section -->

                  <div class="section">
                    <div class="form-group field-loginform-rememberme">
                      <label class="switch block">
                        <input type="checkbox" name="LoginForm[rememberMe]" id="loginform-rememberme" checked>
                        <label for="loginform-rememberme" data-on="YES" data-off="NO"></label>
                        <span>Remember me</span>
                      </label>
                    </div>
                  </div>

                  <!-- end section -->

                </div>
                <!-- end .colm section -->

              </div>
              <!-- end .section row section -->

            </div>
            <!-- end .form-body section -->
            <div class="panel-footer">
              <button type="submit" class="button btn-primary">Sign in</button>
            </div>
            <!-- end .form-footer section -->
          </form>
        </div>
        <!-- end .admin-form section -->
      </div>
      <!-- end: .admin-form --> 
    </div>

    <?php ActiveForm::end(); ?>