//
//  Mission.h
//  Scavengely
//
//  Created by Jay Whitsitt on 7/19/2014.
//  Copyright (c) 2014 Jay Whitsitt. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kMissionTypeImage = @"image";
#define kMissionTypeText = @"text";
#define kMissionTypeAudio = @"audio";
#define kMissionTypeMultipleChoice = @"multiplechoice";

@interface Mission : NSObject

@property (nonatomic) int number;
@property (nonatomic, strong) NSString *prompt;
@property (nonatomic, strong) NSString *type;
@property (nonatomic) NSTimeInterval elapsedTime;

@end
