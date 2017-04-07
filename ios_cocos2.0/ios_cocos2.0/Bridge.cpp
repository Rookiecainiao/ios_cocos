//
//  Bridge.cpp
//  ios_cocos2.0
//
//  Created by yaofuyu on 17/3/30.
//  Copyright © 2017年 Beijing Diyicai Technology Co., Ltd. All rights reserved.
//

#include "Bridge.hpp"
static Bridge*instance;
Bridge* Bridge::getBridge(){
    if (instance == NULL) {
        instance = new Bridge();
    }
    return instance;
}
bool Bridge::getstate(){
    return state;
}
void Bridge::setstate(bool _state){
    state = _state;
}
