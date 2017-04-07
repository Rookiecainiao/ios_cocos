//
//  Bridge.hpp
//  ios_cocos2.0
//
//  Created by yaofuyu on 17/3/30.
//  Copyright © 2017年 Beijing Diyicai Technology Co., Ltd. All rights reserved.
//

#ifndef Bridge_hpp
#define Bridge_hpp

#include <stdio.h>
class Bridge
{
private:
    Bridge(){}
    /*state用于监听界面跳转的状态，当在cocos界面结束时设为true，ios界面结束时设为false*/
    bool state;
public:
    static Bridge* getBridge();
    bool getstate();
    void setstate(bool _state);
};
#endif /* Bridge_hpp */
