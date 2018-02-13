<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class LoginAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/loginsite.css',
        'theme/assets/skin/default_skin/css/logintheme.css',
        'theme/assets/admin-tools/admin-forms/css/admin-forms.css',
    ];
    public $js = [
        // 'theme/vendor/jquery/jquery-1.11.1.min.js',
        // 'theme/vendor/jquery/jquery_ui/jquery-ui.min.js',
        'theme/assets/js/utility/utility.js',
        'theme/assets/js/demo/demo.js',
        'theme/assets/js/main.js',
        'js/main.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
