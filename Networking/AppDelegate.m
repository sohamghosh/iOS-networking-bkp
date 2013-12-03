#import "AppDelegate.h"
#import "FeedTableViewController.h"
#import "ProfileViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Feed Nav
    FeedTableViewController *feedTableViewController = [[FeedTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *feedNavController = [[UINavigationController alloc]
                                             initWithRootViewController:feedTableViewController];
    
    //Profile
    ProfileViewController *profileViewController = [[ProfileViewController alloc] init];
    
    // Root (Tab Bar)
    UITabBarController *tabBarViewController = [[UITabBarController alloc] init];
    [tabBarViewController setViewControllers:@[feedNavController, profileViewController]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarViewController;
    [self.window makeKeyAndVisible];
    return YES;
    
    
}

@end
