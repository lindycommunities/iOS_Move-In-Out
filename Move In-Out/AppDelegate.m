//
//  AppDelegate.m
//  Move In-Out
//
//  Created by S S D on 08/04/17.
//  Copyright © 2017 Move In-Out. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
#import "MoveInMoveOutWebRequestHelper.h"
#import <AFNetworking/AFNetworking.h>
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize arrAllData,resultData,arrAllDataDict;
@synthesize addRequest;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.arrAllData=[[NSMutableArray alloc]init];
    self.arrAllDataDict=[[NSMutableDictionary alloc]init];
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    MoveInMoveOutWebRequestHelper *webHelper = [MoveInMoveOutWebRequestHelper sharedInstance];
    [webHelper CheckInternet];

    if([[UIApplication sharedApplication] respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:  [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound) categories:nil]];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
            //# if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_8_0
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIUserNotificationTypeAlert | UIUserNotificationTypeBadge |    UIUserNotificationTypeSound)];
            //#endif
    }
    
    application.applicationIconBadgeNumber=0;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previouMoveInMoveOuty in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSString *devicetokenString = [[[[deviceToken description] stringByReplacingOccurrencesOfString: @"<" withString: @""] stringByReplacingOccurrencesOfString: @">" withString: @""] stringByReplacingOccurrencesOfString: @" " withString: @""];
    
    NSLog(@"Did Register for Remote Notifications with Device Token DATA (%@) \n STRING token (%@)", deviceToken,devicetokenString);
    
    
//    NSLog(@"didRegisterForRemoteNotificationsWithDeviceToken: %@", deviceToken);
//    NSString *dt = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
//    dt = [dt stringByReplacingOccurrencesOfString:@" " withString:@""];
//    NSLog(@"~~~~devToken(dv)=%@",deviceToken);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSString stringWithFormat:@"%@", devicetokenString] forKey:@"DeviceToken"];
    [defaults synchronize];
    
    
    
    //If Same token received again dont take any action else save in NSUserdefaults or system and send to server to register against this device to send push notification on the token specified here.
}

-(void)application:(UIApplication *)application    didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Did Fail to Register for Remote Notifications");
    NSLog(@"%s:%@, %@",__PRETTY_FUNCTION__,error, error.localizedDescription);
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"Did Receive for Remote Notifications with UserInfo:%@", userInfo);
    
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    array = [userInfo valueForKey:@"aps"];
    
    NSString *str = [array valueForKey:@"alert"]; // [[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
    NSLog(@"%@",[userInfo valueForKey:@"aps"]);
    
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:str message:@"" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:nil];
//    [alert setTag:1];
//    [alert show];
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
        
        
    }];
    [alert addAction:otherAction];
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    
    
    
}


@end
