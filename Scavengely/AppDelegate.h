//
//  AppDelegate.h
//  Scavengely
//
//  Created by Jay Whitsitt on 7/19/2014.
//  Copyright (c) 2014 Jay Whitsitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

#import "GameScene.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) GameScene *gameScene;

@end
