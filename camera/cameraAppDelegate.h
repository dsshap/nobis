//
//  cameraAppDelegate.h
//  camera
//
//  Created by David Shapiro on 4/14/12.
//  Copyright (c) 2012 JPMC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cameraAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
