//
//  MissionViewController.h
//  Scavengely
//
//  Created by Steven Palomino on 7/19/2014.
//  Copyright (c) 2014 Jay Whitsitt. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Mission.h"

@interface MissionViewController : UIViewController

@property (strong, nonatomic) Mission *currentMission;

@property (weak, nonatomic) IBOutlet UIImageView *missionImage;
@property (weak, nonatomic) IBOutlet UILabel *missionPrompt;
@property (weak, nonatomic) IBOutlet UIButton *pictureButton;
@property (weak, nonatomic) IBOutlet UIButton *micButton;

@end
