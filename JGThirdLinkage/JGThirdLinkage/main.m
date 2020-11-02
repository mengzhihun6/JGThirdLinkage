//
//  main.m
//  JGThirdLinkage
//
//  Created by spring on 2020/10/31.
//  Copyright © 2020 spring. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * JGAppDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        JGAppDelegateClassName = NSStringFromClass([JGAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, JGAppDelegateClassName);
}
