//
//  NewGameViewController.m
//  Scavengely
//
//  Created by Steven Palomino on 7/19/2014.
//  Copyright (c) 2014 Jay Whitsitt. All rights reserved.
//

#import "NewGameViewController.h"

@interface NewGameViewController ()
@property (retain, nonatomic) FBFriendPickerViewController *friendPickerController;


@end

@implementation NewGameViewController

-(void)viewWillAppear:(BOOL)animated
{


}

- (void)viewDidUnload {
    self.friendPickerController = nil;
    
    [super viewDidUnload];
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
                                          NSLog(@"%@", session);
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                    message:error.localizedDescription
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                [alertView show];
            } else if (session.isOpen) {
                NSLog(@"it's open!");
                [self checkOpenSession];
            }
        }];
        NSLog(@"before return");
        return;
    }
    

    if (self.friendPickerController == nil) {
        NSLog(@"picker is nil");
        // Create friend picker, and get data loaded into it.
        self.friendPickerController = [[FBFriendPickerViewController alloc] init];
        self.friendPickerController.title = @"Pick Friends";
        self.friendPickerController.delegate = self;
    }
    
    [self.friendPickerController loadData];
    [self.friendPickerController updateView];
    [self.friendPickerController clearSelection];
    
    [self presentViewController:self.friendPickerController animated:YES completion:nil];
    
    


}

-(void)friendsPopup
{
    NSLog(@"here");

    
    if (FBSessionStateOpen == YES) {
        NSLog(@"session open");
    }else{
        NSLog(@"session not open");
    }


}

-(void)checkSession
{


}

- (void)viewDidLoad
{
    [self checkOpenSession];
    //[self checkSession];
    

    
    
    [self.navigationController setNavigationBarHidden:NO];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)facebookViewControllerCancelWasPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)facebookViewControllerDoneWasPressed:(id)sender {
    NSMutableString *text = [[NSMutableString alloc] init];
    
    // we pick up the users from the selection, and create a string that we use to update the text view
    // at the bottom of the display; note that self.selection is a property inherited from our base class
    for (id<FBGraphUser> user in self.friendPickerController.selection) {
        if ([text length]) {
            [text appendString:@", "];
        }
        [text appendString:user.name];
    }
    
    [self fillTextBoxAndDismiss:text.length > 0 ? text : @"<None>"];
}

- (void)fillTextBoxAndDismiss:(NSString *)text {
    self.friendNameLabel.text = text;
    
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
