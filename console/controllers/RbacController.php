<?php
namespace console\controllers;

use Yii;
use yii\console\Controller;

class RbacController extends Controller
{
    public function actionInit()
    {
        $auth = Yii::$app->authManager;
        $auth->removeAll();

        $createItem = $auth->createPermission('/create/item');
        $createItem->description = 'Create Item';
        $auth->add($createItem);

        $updateItem = $auth->createPermission('/update/item');
        $updateItem->description = 'Update Item';
        $auth->add($updateItem);

        $deleteItem = $auth->createPermission('/delete/item');
        $deleteItem->description = 'Delete Item';
        $auth->add($deleteItem);

        $frontenduser = $auth->createRole('frontend_user');
        $auth->add($frontenduser);

        // add the rule
        $rule = new \component\rbac\FrontendUserRule;
        $auth->add($rule);

        // add the "updateOwnItem" permission and associate the rule with it.
        $updateOwnItem = $auth->createPermission('updateOwnItem');
        $updateOwnItem->description = 'Update own item';
        $updateOwnItem->ruleName = $rule->name;
        $auth->add($updateOwnItem);

        // "updateOwnItem" will be used from "updateItem"
        $auth->addChild($updateOwnItem, $updateItem);

        // allow "frontenduser" to update their own item
        $auth->addChild($frontenduser, $updateOwnItem);

        $productmanager = $auth->createRole('product-manager');
        $auth->add($productmanager);
        $auth->addChild($productmanager,$createItem);

        $admin = $auth->createRole('admin');
        $auth->add($admin);
        $auth->addChild($admin, $deleteItem);
        $auth->addChild($admin, $productmanager);
        
        $auth->assign($admin, 1);
    }
}