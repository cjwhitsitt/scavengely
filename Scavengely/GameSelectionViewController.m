//
//  GameSelectionViewController.m
//  Scavengely
//
//  Created by Jay Whitsitt on 7/19/2014.
//  Copyright (c) 2014 Jay Whitsitt. All rights reserved.
//

#import "GameSelectionViewController.h"
#import "GameTableViewCell.h"
#import "GameStartViewController.h"

#import "AppDelegate.h"

#import "Game.h"
#import "Mission.h"

@interface GameSelectionViewController ()

@property (strong, readonly, nonatomic) NSArray *gameData;
@property (strong, readonly, nonatomic) Game *selectedGame;

@end

@implementation GameSelectionViewController

- (void)loadDataFromPlistToObject {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"games" ofType:@"plist"];
    NSArray *rawGameData = [NSArray arrayWithContentsOfFile:plistPath];
    NSMutableArray *massagedGameData = [[NSMutableArray alloc] init];
    
    for (NSDictionary *rawGame in rawGameData) {
        Game *newGame = [[Game alloc] init];
        
        id gameName = [rawGame objectForKey:@"name"];
        NSAssert(![gameName isMemberOfClass:[NSString class]], @"The name of a game from the plist is not a string");
        newGame.name = (NSString *)gameName;
        
        id imageFileName = [rawGame objectForKey:@"image"];
        NSAssert1(![imageFileName isMemberOfClass:[NSString class]], @"The filename for game \"%@\" isn't a string.", gameName);
        NSString *imageNameWithoutExt = nil;
        NSString *imageExt = nil;
        NSRange lastPeriodRange = [imageFileName rangeOfString:@"." options:NSBackwardsSearch];
        if (lastPeriodRange.location != NSNotFound) {
            NSUInteger start = 0;
            NSUInteger length = lastPeriodRange.location - start;
            NSUInteger end = [imageFileName length]-1;
            imageNameWithoutExt = [imageFileName substringWithRange:NSMakeRange(start, length)];
            imageExt = [imageFileName substringWithRange:NSMakeRange(length+1, end-length)];
        }
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageNameWithoutExt  ofType:imageExt];
        newGame.image = [UIImage imageWithContentsOfFile:imagePath];
        
        id rawMissions = [rawGame objectForKey:@"missions"];
        NSAssert1(![rawMissions isMemberOfClass:[NSArray class]], @"The missions for game \"%@\" aren't formatted as an array.", gameName);
        NSMutableArray *missions = [[NSMutableArray alloc] init];
        
        int i = 0;
        for (NSDictionary *rawMission in rawMissions) {
            Mission *newMission = [[Mission alloc] init];
            newMission.number = i;
            
            id missionPrompt = [rawMission objectForKey:@"prompt"];
            NSAssert2(![missionPrompt isMemberOfClass:[NSString class]], @"Invalid prompt for mission #%d, game %@", i, gameName);
            newMission.prompt = (NSString *)missionPrompt;
            
            id missionTypeId = [rawMission objectForKey:@"type"];
            
            NSAssert2(![missionTypeId isMemberOfClass:[NSString class]], @"Invalid prompt type for #%d, game %@", i, gameName);
            NSString *missionTypeString = (NSString *)missionTypeId;
            if ([missionTypeString isEqualToString:@"image"]) {
                newMission.type = MissionTypeImage;
            } else if ([missionTypeString isEqualToString:@"audio"]) {
                newMission.type = MissionTypeAudio;
            } else {
                NSLog(@"Invalid mission type (\"%@\") for mission #%d, game %@", missionTypeString, i, gameName);
            }
            
            [missions addObject:newMission];
        }
        
        newGame.missions = missions;
        
        [massagedGameData addObject:newGame];
    }
    
    _gameData = massagedGameData;
}

#pragma mark UIViewController methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // load data
	if (self.gameData == nil) {
        [self loadDataFromPlistToObject];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    GameStartViewController *gameStartViewController = (GameStartViewController *)[segue destinationViewController];
    gameStartViewController.selectedGame = [self.gameData objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    
}

#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        // return number of games in plist
        return [self.gameData count];
    } else {
        return 0;
    }
};

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // get the correct game
    Game *game = [self.gameData objectAtIndex:indexPath.row];
    
    // put data in cell outlets
    GameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gameCell"];
    [cell.title setText:game.name];
    NSString *numberOfMissions = [NSString stringWithFormat:@"%lu", (unsigned long)[game.missions count]];
    [cell.numberOfMissions setText:[NSString stringWithFormat:@"%@ missions", numberOfMissions]];
    cell.gameImage.image = game.image;
    
    return cell;
};



#pragma mark UITableViewDelegate methods

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return indexPath;
}

@end
