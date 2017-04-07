//
//  ViewController.m
//  ios_cocos2.0
//
//  Created by yaofuyu on 17/3/28.
//  Copyright © 2017年 Beijing Diyicai Technology Co., Ltd. All rights reserved.
//
#import "AppDelegate.h"
#import "ViewController.h"
#import "platform/ios/CCEAGLView-ios.h"
#import "RootViewController.h"
#import "CocosScene.hpp"
#import "base/CCEventDispatcher.h"
#import "Bridge.hpp"
#import "scendView.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(gotoFirstAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"viewdidload");
    
   
}
- (void)reStartView{
    NSLog(@"listener");
    if (Bridge::getBridge()->getstate()) {
        NSLog(@"restartview");
        [self.view removeFromSuperview];
        [self viewDidLoad];
    }
    
    Bridge::getBridge()->setstate(false);
   
    
}
- (void)gotoFirstAction{
    NSLog(@"tiaotiaotiao");
//    _dview = [[UIView alloc]init];
//    _dview.frame = [UIScreen mainScreen].bounds;
//    [_dview setBackgroundColor:[UIColor blueColor]];
//    [self.view addSubview:_dview];
//    
//    NSDate* scheduledTime = [NSDate dateWithTimeIntervalSinceNow:0.1];
//    NSTimer *timer = [[NSTimer alloc]initWithFireDate:scheduledTime interval:0.5 target:self selector:@selector(reStartView) userInfo:@"begin" repeats:YES];
//    NSRunLoop* runloop = [NSRunLoop currentRunLoop];
//    [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
//    
//    NSLog(@"1111");
//    
//    cocos2d::Application *app = cocos2d::Application::getInstance();
//    
//    // Initialize the GLView attributes
//    app->initGLContextAttrs();
//    cocos2d::GLViewImpl::convertAttrs();
//    
//    // Override point for customization after application launch.
//    
//    // Add the view controller's view to the window and display.
//    
//    // Use RootViewController to manage CCEAGLView
//    //    _viewController = [[RootViewController alloc]init];
//    //    _viewController.wantsFullScreenLayout = YES;
//    
//    CCEAGLView *eaglView = [CCEAGLView viewWithFrame: [UIScreen mainScreen].bounds
//                                         pixelFormat: (__bridge NSString *)cocos2d::GLViewImpl::_pixelFormat
//                                         depthFormat: cocos2d::GLViewImpl::_depthFormat
//                                  preserveBackbuffer: NO
//                                          sharegroup: nil
//                                       multiSampling: NO
//                                     numberOfSamples: 0 ];
//    
//    // Enable or disable multiple touches
//    [eaglView setMultipleTouchEnabled:NO];
////    _dview = eaglView;
//    self.view = eaglView;
//    
//    [[UIApplication sharedApplication] setStatusBarHidden:true];
//    
//    // IMPORTANT: Setting the GLView should be done after creating the RootViewController
//    cocos2d::GLView *glview = cocos2d::GLViewImpl::createWithEAGLView((__bridge void *)self.view);
//    cocos2d::Director::getInstance()->setOpenGLView(glview);
//    auto scene = CocosScene::createScene();
//    Bridge::getBridge()->setstate(false);
//    Director::getInstance()->runWithScene(scene);
//    
////    app->run();
/*****************************************************************/
    scendView* newview = [[scendView alloc]init];
    [self presentViewController:newview animated: YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
