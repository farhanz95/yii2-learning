<?php
use backend\assets\ErrorAssets;
ErrorAssets::register($this);

use yii\helpers\Html;

$this->title = $name;
?>
      <!-- Begin: Content -->
      <section id="content" class="pn animated fadeIn">

        <div class="center-block mt50 mw800">
          <h1 class="error-title"> <?= $this->title ?> </h1>
          <h2 class="error-subtitle"><?= nl2br(Html::encode($message)) ?></h2>
        </div>
        <div class="mid-section">
          <div class="mid-content clearfix">
            <!-- <input type="text" class="form-control" placeholder="Ask me a question!" value="Let Me Help You Search!"> -->
            <!-- <div class="pull-left">
              <img src="assets/img/logos/logo_grey.png" class="img-responsive mt20 w225" alt="logo">
            </div> -->
            <div class="pull-right mt20">
              <a href="#" title="facebook link">
                <i class="fa fa-facebook-square fs40 text-primary mr15"></i>
              </a>
              <a href="#" title="twitter link">
                <i class="fa fa-twitter-square fs40 text-info mr15"></i>
              </a>
              <a href="#" title="google plus link">
                <i class="fa fa-google-plus-square fs40 text-danger-light mr15"></i>
              </a>
              <a href="#" title="email link">
                <i class="fa fa-envelope-square fs40 text-warning"></i>
              </a>
            </div>

          </div>
        </div>

      </section>


<?php 

$this->registerJs("

$('body').addClass('error-page');

");

?>