//
//  scendView.m
//  ios_cocos2.0
//
//  Created by yaofuyu on 17/3/30.
//  Copyright © 2017年 Beijing Diyicai Technology Co., Ltd. All rights reserved.
//

#import "scendView.h"
#import "cocos2d.h"
#import "platform/ios/CCEAGLView-ios.h"
#import "CocosScene.hpp"
#import "Bridge.hpp"
USING_NS_CC;
@implementation scendView


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //
    cocos2d::Application *app = cocos2d::Application::getInstance();
    
    // Initialize the GLView attributes
    app->initGLContextAttrs();
    cocos2d::GLViewImpl::convertAttrs();
    
    CCEAGLView *eaglView = [CCEAGLView viewWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-200)
                                         pixelFormat: (__bridge NSString *)cocos2d::GLViewImpl::_pixelFormat
                                         depthFormat: cocos2d::GLViewImpl::_depthFormat
                                  preserveBackbuffer: NO
                                          sharegroup: nil
                                       multiSampling: NO
                                     numberOfSamples: 0 ];
    
    // Enable or disable multiple touches
    [eaglView setMultipleTouchEnabled:NO];
    eaglView.backgroundColor = [UIColor clearColor];
    eaglView.opaque = NO;
    
    [self.view addSubview:eaglView];
    
    [[UIApplication sharedApplication] setStatusBarHidden:true];
    
    // IMPORTANT: Setting the GLView should be done after creating the RootViewController
    cocos2d::GLView *glview = cocos2d::GLViewImpl::createWithEAGLView((__bridge void *)eaglView);
    
    cocos2d::Director::getInstance()->setOpenGLView(glview);
    auto scene = CocosScene::createScene();
    
    Director::getInstance()->runWithScene(scene);

    NSDate* scheduledTime = [NSDate dateWithTimeIntervalSinceNow:0.1];
    _timer = [[NSTimer alloc]initWithFireDate:scheduledTime interval:0.01 target:self selector:@selector(reStartView) userInfo:@"begin" repeats:YES];
    NSRunLoop* runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:_timer forMode:NSDefaultRunLoopMode];
    
    self.view.backgroundColor = [UIColor yellowColor];
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"123.png"]];
    background.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    
}

- (void)reStartView{
//    NSLog(@"listener");
    if (Bridge::getBridge()->getstate()) {
//        NSLog(@"restartview");
        [_timer invalidate];
//        Director::getInstance()->end();
        [self dismissViewControllerAnimated: YES completion: nil ];
    }
    
    Bridge::getBridge()->setstate(false);
    
    
}
- (void)gotoFirstAction{
       //
    ////    app->run();
    /*****************************************************************/
    
//   [ self dismissViewControllerAnimated: YES completion: nil ];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
