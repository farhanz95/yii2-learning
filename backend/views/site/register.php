<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

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
                          <label for="firstname" class="field prepend-icon">
                            <input type="text" name="firstname" id="firstname" class="gui-input" placeholder="First name...">
                            <label for="firstname" class="field-icon">
                              <i class="fa fa-user"></i>
                            </label>
                          </label>
                        </div>
                        <!-- end section -->

                        <div class="col-md-6">
                          <label for="lastname" class="field prepend-icon">
                            <input type="text" name="lastname" id="lastname" class="gui-input" placeholder="Last name...">
                            <label for="lastname" class="field-icon">
                              <i class="fa fa-user"></i>
                            </label>
                          </label>
                        </div>
                        <!-- end section -->

                      </div>
                      <!-- end section row section -->

                      <div class="section">
                        <label for="username" class="field-label">Choose your username</label>
                        <div class="smart-widget sm-right smr-120">
                          <label for="username" class="field prepend-icon">
                            <input type="text" name="username" id="username" class="gui-input" placeholder="john-doe">
                            <label for="username" class="field-icon">
                              <i class="fa fa-user"></i>
                            </label>
                          </label>
                          <label for="username" class="button">.envato.com</label>
                        </div>
                        <!-- end .smart-widget section -->
                      </div>
                      <!-- end section -->

                      <div class="section">
                        <label for="password" class="field-label">Create a password</label>
                        <label for="password" class="field prepend-icon">
                          <input type="password" name="password" id="password" class="gui-input">
                          <label for="password" class="field-icon">
                            <i class="fa fa-lock"></i>
                          </label>
                        </label>
                      </div>
                      <!-- end section -->

                      <div class="section">
                        <label for="confirmPassword" class="field-label">Confirm your password</label>
                        <label for="confirmPassword" class="field prepend-icon">
                          <input type="password" name="confirmPassword" id="confirmPassword" class="gui-input">
                          <label for="confirmPassword" class="field-icon">
                            <i class="fa fa-unlock-alt"></i>
                          </label>
                        </label>
                      </div>
                      <!-- end section -->

                      <label for="birthday" class="field-label">Your birthday</label>
                      <div class="section row">
                        <div class="col-md-4">
                          <label for="month" class="field select">
                            <select id="month" name="month">
                              <option value="01">01 - Jan</option>
                              <option value="02">02 - Feb</option>
                              <option value="03">03 - Mar</option>
                              <option value="04">04 - Apr</option>
                              <option value="05">05 - May</option>
                              <option value="06">06 - Jun</option>
                              <option value="07">07 - Jul</option>
                              <option value="08">08 - Aug</option>
                              <option value="09">09 - Sep</option>
                              <option value="10">10 - Oct</option>
                              <option value="11">11 - Nov</option>
                              <option value="12">12 - Dec</option>
                            </select>
                            <i class="arrow double"></i>
                          </label>
                        </div>
                        <!-- end section -->

                        <div class="col-md-4">
                          <label for="day" class="field">
                            <input type="text" name="day" id="day" class="gui-input" placeholder="Day...">
                          </label>
                        </div>
                        <!-- end section -->

                        <div class="col-md-4">
                          <label for="year" class="field">
                            <input type="text" name="year" id="year" class="gui-input" placeholder="Year...">
                          </label>
                        </div>
                        <!-- end section -->

                      </div>
                      <!-- end .section row section -->

                      <div class="section">
                        <label for="location" class="field-label">Location</label>
                        <label class="field select">
                          <select id="location" name="location">
                            <option value="">Select country...</option>
                            <option value="AL">Albania</option>
                            <option value="DZ">Algeria</option>
                            <option value="AD">Andorra</option>
                            <option value="AO">Angola</option>
                            <option value="AI">Anguilla</option>
                            <option value="AG">Antigua and Barbuda</option>
                            <option value="AR">Argentina</option>
                            <option value="AM">Armenia</option>
                            <option value="AW">Aruba</option>
                            <option value="AU">Australia</option>
                            <option value="AT">Austria</option>
                            <option value="AZ">Azerbaijan Republic</option>
                            <option value="BS">Bahamas</option>
                            <option value="BH">Bahrain</option>
                            <option value="BB">Barbados</option>
                            <option value="BE">Belgium</option>
                            <option value="BZ">Belize</option>
                            <option value="BJ">Benin</option>
                            <option value="BM">Bermuda</option>
                            <option value="BT">Bhutan</option>
                            <option value="BO">Bolivia</option>
                            <option value="BA">Bosnia and Herzegovina</option>
                            <option value="BW">Botswana</option>
                            <option value="BR">Brazil</option>
                            <option value="BN">Brunei</option>
                            <option value="BG">Bulgaria</option>
                            <option value="BF">Burkina Faso</option>
                            <option value="BI">Burundi</option>
                            <option value="KH">Cambodia</option>
                            <option value="CA">Canada</option>
                            <option value="CV">Cape Verde</option>
                            <option value="KY">Cayman Islands</option>
                            <option value="TD">Chad</option>
                            <option value="CL">Chile</option>
                            <option value="C2">China Worldwide</option>
                            <option value="CO">Colombia</option>
                            <option value="KM">Comoros</option>
                            <option value="CK">Cook Islands</option>
                            <option value="CR">Costa Rica</option>
                            <option value="HR">Croatia</option>
                            <option value="CY">Cyprus</option>
                            <option value="CZ">Czech Republic</option>
                            <option value="CD">Democratic Republic of the Congo</option>
                            <option value="DK">Denmark</option>
                            <option value="DJ">Djibouti</option>
                            <option value="DM">Dominica</option>
                            <option value="DO">Dominican Republic</option>
                            <option value="EC">Ecuador</option>
                            <option value="EG">Egypt</option>
                            <option value="SV">El Salvador</option>
                            <option value="ER">Eritrea</option>
                            <option value="EE">Estonia</option>
                            <option value="ET">Ethiopia</option>
                            <option value="FK">Falkland Islands</option>
                            <option value="FO">Faroe Islands</option>
                            <option value="FJ">Fiji</option>
                            <option value="FI">Finland</option>
                            <option value="FR">France</option>
                            <option value="GF">French Guiana</option>
                            <option value="PF">French Polynesia</option>
                            <option value="GA">Gabon Republic</option>
                            <option value="GM">Gambia</option>
                            <option value="GE">Georgia</option>
                            <option value="DE">Germany</option>
                            <option value="GI">Gibraltar</option>
                            <option value="GR">Greece</option>
                            <option value="GL">Greenland</option>
                            <option value="GD">Grenada</option>
                            <option value="GP">Guadeloupe</option>
                            <option value="GT">Guatemala</option>
                            <option value="GN">Guinea</option>
                            <option value="GW">Guinea Bissau</option>
                            <option value="GY">Guyana</option>
                            <option value="HN">Honduras</option>
                            <option value="HK">Hong Kong</option>
                            <option value="HU">Hungary</option>
                            <option value="IS">Iceland</option>
                            <option value="IN">India</option>
                            <option value="ID">Indonesia</option>
                            <option value="IE">Ireland</option>
                            <option value="IL">Israel</option>
                            <option value="IT">Italy</option>
                            <option value="JM">Jamaica</option>
                            <option value="JP">Japan</option>
                            <option value="JO">Jordan</option>
                            <option value="KZ">Kazakhstan</option>
                            <option value="KE">Kenya</option>
                            <option value="KI">Kiribati</option>
                            <option value="KW">Kuwait</option>
                            <option value="KG">Kyrgyzstan</option>
                            <option value="LA">Laos</option>
                            <option value="LV">Latvia</option>
                            <option value="LS">Lesotho</option>
                            <option value="LI">Liechtenstein</option>
                            <option value="LT">Lithuania</option>
                            <option value="LU">Luxembourg</option>
                            <option value="MG">Madagascar</option>
                            <option value="MW">Malawi</option>
                            <option value="MY">Malaysia</option>
                            <option value="MV">Maldives</option>
                            <option value="ML">Mali</option>
                            <option value="MT">Malta</option>
                            <option value="MH">Marshall Islands</option>
                            <option value="MQ">Martinique</option>
                            <option value="MR">Mauritania</option>
                            <option value="MU">Mauritius</option>
                            <option value="YT">Mayotte</option>
                            <option value="MX">Mexico</option>
                            <option value="FM">Micronesia</option>
                            <option value="MN">Mongolia</option>
                            <option value="MS">Montserrat</option>
                            <option value="MA">Morocco</option>
                            <option value="MZ">Mozambique</option>
                            <option value="NA">Namibia</option>
                            <option value="NR">Nauru</option>
                            <option value="NP">Nepal</option>
                            <option value="NL">Netherlands</option>
                            <option value="AN">Netherlands Antilles</option>
                            <option value="NC">New Caledonia</option>
                            <option value="NZ">New Zealand</option>
                            <option value="NI">Nicaragua</option>
                            <option value="NE">Niger</option>
                            <option value="NU">Niue</option>
                            <option value="NF">Norfolk Island</option>
                            <option value="NO">Norway</option>
                            <option value="OM">Oman</option>
                            <option value="PW">Palau</option>
                            <option value="PA">Panama</option>
                            <option value="PG">Papua New Guinea</option>
                            <option value="PE">Peru</option>
                            <option value="PH">Philippines</option>
                            <option value="PN">Pitcairn Islands</option>
                            <option value="PL">Poland</option>
                            <option value="PT">Portugal</option>
                            <option value="QA">Qatar</option>
                            <option value="CG">Republic of the Congo</option>
                            <option value="RE">Reunion</option>
                            <option value="RO">Romania</option>
                            <option value="RU">Russia</option>
                            <option value="RW">Rwanda</option>
                            <option value="KN">Saint Kitts and Nevis Anguilla</option>
                            <option value="PM">Saint Pierre and Miquelon</option>
                            <option value="VC">Saint Vincent and Grenadines</option>
                            <option value="WS">Samoa</option>
                            <option value="SM">San Marino</option>
                            <option value="ST">São Tomé and Príncipe</option>
                            <option value="SA">Saudi Arabia</option>
                            <option value="SN">Senegal</option>
                            <option value="RS">Serbia</option>
                            <option value="SC">Seychelles</option>
                            <option value="SL">Sierra Leone</option>
                            <option value="SG">Singapore</option>
                            <option value="SK">Slovakia</option>
                            <option value="SI">Slovenia</option>
                            <option value="SB">Solomon Islands</option>
                            <option value="SO">Somalia</option>
                            <option value="ZA">South Africa</option>
                            <option value="KR">South Korea</option>
                            <option value="ES">Spain</option>
                            <option value="LK">Sri Lanka</option>
                            <option value="SH">St. Helena</option>
                            <option value="LC">St. Lucia</option>
                            <option value="SR">Suriname</option>
                            <option value="SJ">Svalbard and Jan Mayen Islands</option>
                            <option value="SZ">Swaziland</option>
                            <option value="SE">Sweden</option>
                            <option value="CH">Switzerland</option>
                            <option value="TW">Taiwan</option>
                            <option value="TJ">Tajikistan</option>
                            <option value="TZ">Tanzania</option>
                            <option value="TH">Thailand</option>
                            <option value="TG">Togo</option>
                            <option value="TO">Tonga</option>
                            <option value="TT">Trinidad and Tobago</option>
                            <option value="TN">Tunisia</option>
                            <option value="TR">Turkey</option>
                            <option value="TM">Turkmenistan</option>
                            <option value="TC">Turks and Caicos Islands</option>
                            <option value="TV">Tuvalu</option>
                            <option value="UG">Uganda</option>
                            <option value="UA">Ukraine</option>
                            <option value="AE">United Arab Emirates</option>
                            <option value="GB">United Kingdom</option>
                            <option value="US">United States</option>
                            <option value="UY">Uruguay</option>
                            <option value="VU">Vanuatu</option>
                            <option value="VA">Vatican City State</option>
                            <option value="VE">Venezuela</option>
                            <option value="VN">Vietnam</option>
                            <option value="VG">Virgin Islands (British)</option>
                            <option value="WF">Wallis and Futuna Islands</option>
                            <option value="YE">Yemen</option>
                            <option value="ZM">Zambia</option>
                          </select>
                          <i class="arrow double"></i>
                        </label>
                      </div>
                      <!-- end section -->

                      <div class="section">
                        <label for="gender" class="field-label">Gender</label>
                        <label class="field select">
                          <select id="gender" name="gender">
                            <option value="">I am...</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                          </select>
                          <i class="arrow double"></i>
                        </label>
                      </div>
                      <!-- end section -->

                      <div class="section">
                        <label for="email" class="field-label">Your email address</label>
                        <label for="email" class="field prepend-icon">
                          <input type="email" name="email" id="email" class="gui-input" placeholder="example@domain.com...">
                          <label for="email" class="field-icon">
                            <i class="fa fa-envelope"></i>
                          </label>
                        </label>
                      </div>
                      <!-- end section -->

                      <div class="section">
                        <label for="mobile" class="field-label">Mobile phone</label>
                        <label for="mobile" class="field prepend-icon">
                          <input type="tel" name="mobile" id="mobile" class="gui-input" placeholder="+256">
                          <label for="mobile" class="field-icon">
                            <i class="fa fa-phone-square"></i>
                          </label>
                        </label>
                      </div>
                      <!-- end section -->

                      <div class="section">
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
                        <!-- end .smart-widget section -->
                      </div>
                      <!-- end section -->

                      <div class="section">
                        <label class="option">
                          <input type="checkbox" name="check1">
                          <span class="checkbox mr10"></span>Agree to our
                          <a href="#" class="theme-link"> terms of service </a>
                        </label>
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