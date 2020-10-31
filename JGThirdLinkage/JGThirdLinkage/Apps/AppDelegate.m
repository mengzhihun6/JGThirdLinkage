//
//  AppDelegate.m
//  JGThirdLinkage
//
//  Created by spring on 2020/10/31.
//  Copyright © 2020 spring. All rights reserved.
//

#import "AppDelegate.h"
#import "JGMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"mainNavId"];
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}



@end
