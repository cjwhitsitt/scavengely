//
//  NewGameViewController.m
//  Scavengely
//
//  Created by Steven Palomino on 7/19/2014.
//  Copyright (c) 2014 Jay Whitsitt. All rights reserved.
//

#import "NewGameViewController.h"

@interface NewGameViewController ()

@end

@implementation NewGameViewController

-(void)viewWillAppear:(BOOL)animated
{


}

-(void)checkOpenSession
{
    // if the session is open, then load the data for our view controller
    if (!FBSession.activeSession.isOpen) {
        // if the session is closed, then we open it here, and establish a handler for state changes
        [FBSession openActiveSessionWithReadPermissions:@[@"public_profile", @"user_friends"]
                                           allowLoginUI:YES
                                      completionHandler:^(FBSession *session,
                                                          FBSessionState state,
                                                          NSError *error) {
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                    message:error.localizedDescription
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                [alertView show];
            } else if (session.isOpen) {
                [self friendsPopup];
            }
        }];
        NSLog(@"before return");
        return;
    }
    


}

-(void)friendsPopup
{
    NSLog(@"here");
    if (self.friendPickerController == nil) {
        // Create friend picker, and get data loaded into it.
        self.friendPickerController = [[FBFriendPickerViewController alloc] init];
        self.friendPickerController.title = @"Pick Friends";
        self.friendPickerController.delegate = self;
    }
    
    [self.friendPickerController loadData];
    [self.friendPickerController clearSelection];
    
    [self presentViewController:self.friendPickerController animated:YES completion:nil];
    
    
    
    if (FBSessionStateOpen == YES) {
        NSLog(@"session open");
    }else{
        NSLog(@"session not open");
    }
    FBRequest* friendsRequest = [FBRequest requestForMyFriends];
    [friendsRequest startWithCompletionHandler: ^(FBRequestConnection *connection,
                                                  NSDictionary* result,
                                                  NSError *error)
     {
         
         self.friendsArray = [result objectForKey:@"data"];
         [[[self friendPickerController]tableView]reloadData];
     }];

}

- (void)viewDidLoad
{
    [self checkOpenSession];

    

    
    
    [self.navigationController setNavigationBarHidden:NO];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)facebookViewControllerCancelWasPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
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
























- (IBAction)startButtonPressed:(UIButton *)sender {
}
@end
