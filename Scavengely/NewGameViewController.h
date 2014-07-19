//
//  NewGameViewController.h
//  Scavengely
//
//  Created by Steven Palomino on 7/19/2014.
//  Copyright (c) 2014 Jay Whitsitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface NewGameViewController : UIViewController<FBFriendPickerDelegate>
{
    
}

@property (weak, nonatomic) IBOutlet UILabel *friendNameLabel;

- (IBAction)startButtonPressed:(UIButton *)sender;


@property (strong, nonatomic) NSMutableArray *friendsArray;


@end
