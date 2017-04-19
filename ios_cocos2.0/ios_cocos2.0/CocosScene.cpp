//
//  CocosScene.cpp
//  ios_cocos2.0
//
//  Created by yaofuyu on 17/3/28.
//  Copyright © 2017年 Beijing Diyicai Technology Co., Ltd. All rights reserved.
//

#include "CocosScene.hpp"
#include "iostream"
#include "Bridge.hpp"

using namespace std;

Scene*CocosScene::createScene()
{
    auto scene = Scene::create();
    auto layer = CocosScene::create();
    scene->addChild(layer);
    
    return scene;
}
bool CocosScene::init()
{
    if (!Layer::init()) {
        return false;
    }
    
    auto visiblesize = Director::getInstance()->getVisibleSize();
    auto origin = Director::getInstance()->getVisibleOrigin();
    
    cout<<visiblesize.width<<visiblesize.height<<origin.x<<origin.y<<endl;
    
    auto sprbg = Sprite::create("donghuabg.png");
    sprbg->setPosition(Vec2(origin.x+visiblesize.width/2, visiblesize.height));
    sprbg->setAnchorPoint(Vec2(0.5,1));
    addChild(sprbg);
    
    auto closeItem = MenuItemImage::create(
                                           "CloseNormal.png",
                                           "CloseSelected.png",
                                           CC_CALLBACK_1(CocosScene::menuCloseCallback, this));
    
    closeItem->setPosition(Vec2(visiblesize.width/2+200, visiblesize.height/2-400));
    closeItem->setScale(2.0);
    // create menu, it's an autorelease object
    auto menu = Menu::create(closeItem, NULL);
    menu->setPosition(Vec2::ZERO);
    this->addChild(menu, 1);
    
    return true;
}
void CocosScene::menuCloseCallback(Ref* pSender)
{
    //Close the cocos2d-x game scene and quit the application
    
    Director::getInstance()->end();
    Bridge::getBridge()->setstate(true);
//定义一个全局静态变量作为监听，实现oc的方法加载
    
    
//#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
//    exit(0);
//#endif
    
    /*To navigate back to native iOS screen(if present) without quitting the application  ,do not use Director::getInstance()->end() and exit(0) as given above,instead trigger a custom event created in RootViewController.mm as below*/
    
//    EventCustom customEndEvent("game_scene_close_event");
//    _eventDispatcher->dispatchEvent(&customEndEvent);
    
    
}
