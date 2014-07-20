//
//  ViewController.m
//  Scavengely
//
//  Created by Jay Whitsitt on 7/19/2014.
//  Copyright (c) 2014 Jay Whitsitt. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "GameScene.h"
#import "GameSelectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}

- (void)viewDidLoad
{

    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"gameSelectionSegue"]) {
        
        // initialize app delegate's game scene
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        GameScene *gameScene = appDelegate.gameScene;
        gameScene = [[GameScene alloc] init];
        
        Player *player = [[Player alloc] init];
        player.name = @"Me";
        gameScene.players = [NSArray arrayWithObject:player];
        
        gameScene.gameOption = gameOptionSolo;
        
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
