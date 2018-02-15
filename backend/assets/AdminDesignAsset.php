<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class AdminDesignAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $jsOptions = [
        'position' => \yii\web\View::POS_END
    ];
    public $css = [
        'theme_smooth/vendor/plugins/fullcalendar/fullcalendar.min.css',
        'theme_smooth/assets/skin/default_skin/css/theme.css',
        'theme_smooth/assets/admin-tools/admin-forms/css/admin-forms.css',
        'http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700',
    ];
    public $js = [
        'theme_smooth/vendor/jquery/jquery-1.11.1.min.js',
        'theme_smooth/vendor/jquery/jquery_ui/jquery-ui.min.js',
        'theme_smooth/vendor/plugins/fullcalendar/lib/moment.min.js',
        'theme_smooth/vendor/plugins/fullcalendar/fullcalendar.min.js',
        'theme_smooth/assets/js/utility/utility.js',
        'theme_smooth/assets/js/demo/demo.js',
        'theme_smooth/assets/js/main.js',
        'theme_smooth/vendor/plugins/highcharts/highcharts.js',
        'theme_smooth/vendor/plugins/tabdrop/bootstrap-tabdrop.js',
        'theme_smooth/assets/js/demo/widgets.js'
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
