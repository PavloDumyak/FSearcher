

#import <UIKit/UIKit.h>
#import "VKSdk.h"
#import "SWRevealViewController.h"
#import "FSMusicDownloader.h"
#import "FSMusicPlayer.h"
#import "CustomCellMusicPlayer.h"
@interface FSMusicViewController : UIViewController<SWRevealViewControllerDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView * tableView;
@end

