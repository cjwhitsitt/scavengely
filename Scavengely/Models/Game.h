//
//  Game.h
//  Scavengely
//
//  Created by Jay Whitsitt on 7/19/2014.
//  Copyright (c) 2014 Jay Whitsitt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property (strong, readonly, nonatomic) NSString *title;
@property (strong, readonly, nonatomic) UIImage *image;
@property (strong, readonly, nonatomic) NSArray *missions;

@end
