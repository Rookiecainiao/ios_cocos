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
    cout<<visiblesize.width<<visiblesize.height<<endl;
    auto sprite = Sprite::create("HelloWorld.png");
    sprite->setPosition(Vec2(visiblesize.width/2, visiblesize.height/2));
    sprite->setScale(3);
    addChild(sprite);
    auto label = Label::createWithTTF("hello world", "Marker Felt.ttf", 30);
    label->setPosition(Vec2(visiblesize.width/2, visiblesize.height/2-200));
    label->setAnchorPoint(Vec2(0.5, 0.5));
    label->setColor(Color3B::GREEN);
    label->setScale(3);
    addChild(label);
    
    auto closeItem = MenuItemImage::create(
                                           "CloseNormal.png",
                                           "CloseSelected.png",
                                           CC_CALLBACK_1(CocosScene::menuCloseCallback, this));
    
    closeItem->setPosition(Vec2(visiblesize.width/2+200, visiblesize.height/2-300));
    
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
