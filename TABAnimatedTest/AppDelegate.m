//
//  AppDelegate.m
//  TABAnimatedTest
//
//  Created by 杨翊楷 on 7/19/21.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Init `TABAnimated`, and set the properties you need.
    // 初始化TABAnimated，并设置TABAnimated相关属性
    // 初始化方法仅仅设置的是全局的动画效果
    // 你可以设置`TABViewAnimated`中局部动画属性`superAnimationType`覆盖全局属性，在工程中兼容多种动画
    [[TABAnimated sharedAnimated] initWithOnlySkeleton];
    // open log
    // 开启日志
    [TABAnimated sharedAnimated].openLog = YES;
    // 是否开启动画坐标标记，如果开启，也仅在debug环境下有效。
    // 开启后，会在每一个动画元素上增加一个红色的数字，该数字表示该动画元素所在下标，方便快速定位某个动画元素。
//    [TABAnimated sharedAnimated].openAnimationTag = YES;

    /*****************************************
     *****************************************
     ************     重要必读    *************
     *****************************************
     *****************************************
     */
    // debug 环境下，默认关闭缓存功能（为了方便调试预处理回调)
    // release 环境下，默认开启缓存功能
    // 如果你想在 debug 环境下测试缓存功能，可以手动置为NO，但是预处理回调只生效一次！！！！
    // 如果你始终都不想使用缓存功能，可以手动置为YES
    // 请仔细阅读：https://www.jianshu.com/p/7eeef75377df
//    [TABAnimated sharedAnimated].closeCache = NO;
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
