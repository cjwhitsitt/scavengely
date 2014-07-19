//
//  Mission.h
//  Scavengely
//
//  Created by Jay Whitsitt on 7/19/2014.
//  Copyright (c) 2014 Jay Whitsitt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mission : NSObject

enum SCMissionType {
    image,
    text,
    multiplechoice,
    audio
};

@property (nonatomic, readonly) int number;
@property (nonatomic, readonly, strong) NSString *prompt;
@property (nonatomic, readonly) int type;
@property (nonatomic, strong) NSObject *answer;
@property (nonatomic) NSTimeInterval elapsedTime;

@end
