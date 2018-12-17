//
//  main.m
//  LocalizationDemo
//
//  Created by Santosh on 28/11/18.
//  Copyright © 2018 sagarsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        [[NSUserDefaults standardUserDefaults] setObject:@"hi" forKey:@"AppleLanguages"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
