

#import "FSMusicViewController.h"

@interface FSMusicViewController ()<VKSdkDelegate>

@end

@implementation FSMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.revealViewController.delegate = self;
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [VKSdk initializeWithDelegate:self andAppId:@"5160630"];
    
    if ([VKSdk isLoggedIn])
    {
        NSLog(@"YES");
    }
    else
    {
        NSLog(@"NO");
    }
    
    if (![VKSdk wakeUpSession])
    {
        NSArray *scope = @[@"friends,audio"];
        [VKSdk authorize:scope];
        NSLog(@"%@",  [[VKSdk  getAccessToken]  userId]);
    }
    
    else
    {
        NSLog(@"wakeUpSession will die");
        
    }
    
    [FSMusicDownloader getMyMusicFromVK:^{
        [self.tableView reloadData];
    }];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FSDataSaver *dataSaver = [FSDataSaver sharedInstance];
    VKAudio *tempAudio = [dataSaver.musicList objectAtIndex:indexPath.row];
    [[FSMusicPlayer sharedPlayer] playWithStringPath:tempAudio.url];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - VKSdkDelegate

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
    
}

/**
 Notifies delegate about existing token has expired
 @param expiredToken old token that has expired
 */
- (void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken
{
    
}

/**
 Notifies delegate about user authorization cancelation
 @param authorizationError error that describes authorization error
 */
- (void)vkSdkUserDeniedAccess:(VKError *)authorizationError
{
    

}

/**
 Pass view controller that should be presented to user. Usually, it's an authorization window
 @param controller view controller that must be shown to user
 */
- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
    
    [self presentViewController:controller
                       animated:YES
                     completion:^{}];
}

/**
 Notifies delegate about receiving new access token
 @param newToken new token for API requests
 */
- (void)vkSdkReceivedNewToken:(VKAccessToken *)newToken {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    FSDataSaver *dataSaver = [FSDataSaver sharedInstance];
    return [dataSaver.musicList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FSDataSaver *dataSaver = [FSDataSaver sharedInstance];
    static NSString *simpleTableIdentifier = @"cell";
    CustomCellMusicPlayer *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    VKAudio *tempAudio = [dataSaver.musicList objectAtIndex:indexPath.row];
    cell.textLabel.text = tempAudio.artist;
    cell.detailTextLabel.text = tempAudio.title;
    cell.duration.text = [NSString stringWithFormat:@"%1.2f", [tempAudio.duration floatValue]/60];
    return cell;

}



@end
