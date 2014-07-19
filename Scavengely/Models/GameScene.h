//
//  GameScene.h
//  Scavengely
//
//  Created by Jay Whitsitt on 7/19/2014.
//  Copyright (c) 2014 Jay Whitsitt. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Game.h"
#import "Player.h"

@interface GameScene : NSObject

typedef enum {
    gameOptionSolo,
    gameOptionMultiplayer
} gameOption;

@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) NSArray *players;
@property (strong, nonatomic) NSArray *timePerMission;
@property (nonatomic) int gameOption;

@end
