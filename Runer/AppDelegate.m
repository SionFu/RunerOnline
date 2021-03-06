//
//  AppDelegate.m
//  Runer
//
//  Created by tarena on 16/5/10.
//  Copyright © 2016年 Fu_sion. All rights reserved.
//

#import "AppDelegate.h"
#import <AVOSCloud.h>
#import <AVOSCloudSNS.h>
#import "BMapKit.h"
@interface AppDelegate ()<BMKGeneralDelegate>
@property (nonatomic, strong) BMKMapManager *manger;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [AVOSCloud setApplicationId:@"ghkO6er3yyKAwOwuA27KA60r-gzGzoHsz"
                      clientKey:@"prMiAUMqwqNlKQ3oRaBhHK8y"];
    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    /**
     *  百度地图
     */
    self.manger = [BMKMapManager new];
    [self.manger start:@"izFdfwhWdXIv7YjvY9OzbQ9mvOOcVrKF" generalDelegate:self];
    return YES;
}
- (void)onGetNetworkState:(int)iError{
    NSLog(@"联网状况%d",iError);
}
-(void)onGetPermissionState:(int)iError{
    NSLog(@"授权状况%d",iError);
}
#pragma mark -- 三方登录
-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [AVOSCloudSNS handleOpenURL:url];
}

// When Build with IOS 9 SDK
// For application on system below ios 9
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [AVOSCloudSNS handleOpenURL:url];
}
// For application on system equals or larger ios 9
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    return [AVOSCloudSNS handleOpenURL:url];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
