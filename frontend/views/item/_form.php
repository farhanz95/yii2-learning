<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\date\DatePicker;
use kartik\select2\Select2;
$masterCountry = ArrayHelper::map(\frontend\models\MasterNegara::find()->orderBy(['negara_nama'=>SORT_ASC])->asArray()->all(),'negara_id','negara_nama');
?>

<?php 
$this->registerCss("

@media screen and (min-width: 770px) {
    .brp {
        border-right: solid 1px #ababab;
    }
}

");
?>

<div class="item-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="panel panel-default">
      <div class="panel-heading">
        BASIC DETAIL
      </div>
      <div class="panel-body">

        <?= $form->field($model, 'item_product_id')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'item_name')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'item_brand')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'item_model')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'item_company_manufacturer')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'item_type')->dropDownList([
            'Household'=>'Household',
            'Apparatus'=>'Apparatus',
            'Work Tools'=>'Work Tools',
            'Hybrid'=>'Hybrid',
            'Gadget'=>'Gadget',
            ],['prompt'=>'-Select Item Type-']) ?>

        <?= $form->field($model, 'item_price')->textInput(['maxlength' => true]) ?>
          

      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading">
        PRODUCEMENT
      </div>
      <div class="panel-body">

        <?= $form->field($model, 'item_quantity')->textInput() ?>
          

      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading">
        MANUFACTURING INFORMATION
      </div>
      <div class="panel-body">

        <?= $form->field($model, 'item_manufactured_country_address')->widget(Select2::classname(), [
            'data' => $masterCountry,
            'language' => 'en',
            'options' => ['placeholder' => '-Select Country-'],
            'pluginOptions' => [
                'allowClear' => true
            ],
        ]); ?>

        <?= $form->field($model, 'item_manufactured_state_address')->widget(Select2::classname(), [
            'data' => [],
            'language' => 'en',
            'options' => ['placeholder' => '-Select Country First-'],
            'pluginOptions' => [
                'allowClear' => true
            ],
        ]); ?>


        <?= $form->field($model, 'item_manufactured_city_address')->widget(Select2::classname(), [
            'data' => [],
            'language' => 'en',
            'options' => ['placeholder' => '-Select State First-'],
            'pluginOptions' => [
                'allowClear' => true
            ],
        ]); ?>

        <?= $form->field($model, 'item_manufactured_postcode_address')->textInput() ?>

        <?= $form->field($model, 'item_manufactured_street_address')->textArea(['maxlength' => true]) ?>

        <?= $form->field($model, 'item_manufactured_no_address')->textInput(['maxlength' => true]) ?>


        <?= '<label>'.$model->getAttributeLabel('item_manufactured_date').'</label>' ?>

        <?= DatePicker::widget([
            'model' => $model,
            'attribute' => 'item_manufactured_date',
            'pluginOptions' => [
              'format' => 'yyyy-mm-dd',
              'todayHighlight' => true
            ]
        ]); ?> 

          

      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading">
        ITEM PROPERTIES
      </div>
      <div class="panel-body">
        
        <div class="col-lg-3 col-md-3 col-sm-3 brp">
        <?= $form->field($model, 'item_weight')->textInput()->label('Item Weight (KG)') ?>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-3 brp">
        <?= $form->field($model, 'item_size_height')->textInput()->label('Item Height (CM)') ?>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-3 brp">
        <?= $form->field($model, 'item_size_width')->textInput()->label('Item Width (CM)') ?>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-3 brp">
        <?= $form->field($model, 'item_size_length')->textInput()->label('Item Length (CM)') ?>
        </div>
          

      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading">
        ITEM AVAILABILITY
      </div>
      <div class="panel-body">


        <?= '<label>'.$model->getAttributeLabel('item_availability_date_start').'</label>' ?>

        <?= DatePicker::widget([
            'model' => $model,
            'attribute' => 'item_availability_date_start',
            'pluginOptions' => [
              'format' => 'yyyy-mm-dd',
              'todayHighlight' => true
            ]
        ]); ?> 

        <?= '<label>'.$model->getAttributeLabel('item_availability_date_end').'</label>' ?>

        <?= DatePicker::widget([
            'model' => $model,
            'attribute' => 'item_availability_date_end',
            'pluginOptions' => [
              'format' => 'yyyy-mm-dd',
              'todayHighlight' => true
            ]
        ]); ?> 

        <?= $form->field($model, 'item_activeness')->dropDownList([1=>'Active',0=>'Not Active']) ?>
          

      </div>
    </div>

    <?php if (!$model->isNewRecord): ?>

    <?= $form->field($model, 'item_registered_on_system_date')->textInput(['readOnly'=>true]) ?>
    
    <?php if ($model->item_updated_on_system_date): ?>
        <?= $form->field($model, 'item_updated_on_system_date')->textInput(['readOnly'=>true]) ?>
    <?php endif ?>

    <?php endif ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<?php 
$this->registerJs("
$('body').on('change','select[name=\"Item[item_manufactured_country_address]\"]',function(){
    if($('select[name=\"Item[item_manufactured_country_address]\"] option:selected').val()){
        var selected = $('select[name=\"Item[item_manufactured_country_address]\"] option:selected').val();
        $.ajax({
            type: 'post',
            url: '".Yii::getAlias('@web')."/item/get-state',
            data: 'negara_id='+selected,
            success: function(data){
                var stateSelect = $('select[name=\"Item[item_manufactured_state_address]\"]');
                
                console.log(data);

            } 
        })
    }else{
        $('select[name=\"Item[item_manufactured_state_address]\"]').html('<option value=\"\">-Select Country First-</option>')
    }
    if($('select[name=\"Item[item_manufactured_state_address]\"] option:selected').val()){
        var selected = $('select[name=\"Item[item_manufactured_state_address]\"] option:selected').val();
        $.ajax({
            type: 'post',
            url: '".Yii::getAlias('@web')."/item/get-city',
            data: 'negeri_id='+selected,
            success: function(data){
                $('select[name=\"Item[item_manufactured_city_address]\"]').html(data);
            } 
        })
    }else{
        $('select[name=\"Item[item_manufactured_city_address]\"]').html('<option value=\"\">-Select State First-</option>')
    }
});
if($('select[name=\"Item[item_manufactured_country_address]\"] option:selected').val()){
    var selected = $('select[name=\"Item[item_manufactured_country_address]\"] option:selected').val();
    $.ajax({
        type: 'post',
        url: '".Yii::getAlias('@web')."/item/get-state',
        data: 'negara_id='+selected,
        success: function(data){
            $('select[name=\"Item[item_manufactured_state_address]\"]').html(data);
        } 
    })
}else{
    $('select[name=\"Item[item_manufactured_state_address]\"]').html('<option value=\"\">-Select Country First-</option>')
}
$('body').on('change','select[name=\"Item[item_manufactured_state_address]\"]',function(){
    if($('select[name=\"Item[item_manufactured_state_address]\"] option:selected').val()){
        var selected = $('select[name=\"Item[item_manufactured_state_address]\"] option:selected').val();
        $.ajax({
            type: 'post',
            url: '".Yii::getAlias('@web')."/item/get-city',
            data: 'negeri_id='+selected,
            success: function(data){
                $('select[name=\"Item[item_manufactured_city_address]\"]').html(data);
            } 
        })
    }else{
        $('select[name=\"Item[item_manufactured_city_address]\"]').html('<option value=\"\">-Select State First-</option>')
    }
});
if($('select[name=\"Item[item_manufactured_state_address]\"] option:selected').val()){
    var selected = $('select[name=\"Item[item_manufactured_state_address]\"] option:selected').val();
    $.ajax({
        type: 'post',
        url: '".Yii::getAlias('@web')."/item/get-city',
        data: 'negeri_id='+selected,
        success: function(data){
            $('select[name=\"Item[item_manufactured_city_address]\"]').html(data);
        } 
    })
}else{
    $('select[name=\"Item[item_manufactured_city_address]\"]').html('<option value=\"\">-Select State First-</option>')
}
");
?>


<!-- Capture The Value In DropDownList -->
<?php if (!$model->isNewRecord): ?>

<?php 
$this->registerJs("
var selectedCountry = $('select[name=\"Item[item_manufactured_country_address]\"] option:selected').val();
$('select[name=\"Item[item_manufactured_state_address]\"]').val(".$model->item_manufactured_state_address.");
$('select[name=\"Item[item_manufactured_city_address]\"]').val(".$model->item_manufactured_city_address.");
$.ajax({
    type: 'post',
    url: '".Yii::getAlias('@web')."/item/get-state',
    data: 'negara_id='+selectedCountry,
    success: function(data){
        $('select[name=\"Item[item_manufactured_state_address]\"]').html(data);
        $('select[name=\"Item[item_manufactured_state_address]\"]').val(".$model->item_manufactured_state_address.");
    } 
});
$.ajax({
    type: 'post',
    url: '".Yii::getAlias('@web')."/item/get-city',
    data: 'negeri_id='+".$model->item_manufactured_state_address.",
    success: function(data){
        $('select[name=\"Item[item_manufactured_city_address]\"]').html(data);
        $('select[name=\"Item[item_manufactured_city_address]\"]').val(".$model->item_manufactured_city_address.");
    } 
});
");
?>    

<?php endif ?>