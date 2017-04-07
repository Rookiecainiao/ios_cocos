//
//  CocosScene.hpp
//  ios_cocos2.0
//
//  Created by yaofuyu on 17/3/28.
//  Copyright © 2017年 Beijing Diyicai Technology Co., Ltd. All rights reserved.
//

#ifndef CocosScene_hpp
#define CocosScene_hpp

#include <stdio.h>
#include "cocos2d.h"
USING_NS_CC;
class CocosScene:public Layer 
{
public:
    static Scene*createScene();
    virtual bool init();
    CREATE_FUNC(CocosScene);
    void menuCloseCallback(cocos2d::Ref* pSender);

};
#endif /* CocosScene_hpp */
