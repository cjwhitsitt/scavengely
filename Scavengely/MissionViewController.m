//
//  MissionViewController.m
//  Scavengely
//
//  Created by Steven Palomino on 7/19/2014.
//  Copyright (c) 2014 Jay Whitsitt. All rights reserved.
//

#import "MissionViewController.h"

@interface MissionViewController ()

@end

@implementation MissionViewController

@synthesize currentMission = _currentMission;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.currentMission != nil) {
        self.missionImage.image = self.currentMission.image;
        [self.missionPrompt setText:self.currentMission.prompt];
        if (self.currentMission.type == MissionTypeImage) {
            self.pictureButton.hidden = NO;
            self.micButton.hidden = YES;
        } else if (self.currentMission.type == MissionTypeAudio) {
            self.pictureButton.hidden = YES;
            self.micButton.hidden = NO;
        } else {
            NSLog(@"Uh oh, a mission has a bad type:\n%@", self.currentMission.prompt);
        }
        self.title = [NSString stringWithFormat:@"Mission %d", self.currentMission.number];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
