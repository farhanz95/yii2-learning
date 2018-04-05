<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class ErrorAssets extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    // public $jsOptions = [
    //     'position' => \yii\web\View::POS_END
    // ];
    public $css = [
        // 'css/site.css',
        'theme_smooth\assets\skin\default_skin\css\theme.css'
    ];
    public $js = [
    ];
    public $depends = [
        // 'yii\web\YiiAsset',
        // 'yii\bootstrap\BootstrapAsset',
    ];
}
