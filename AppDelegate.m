#import "AppDelegate.h"
#import "ProfileViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ProfileViewController *profileViewController = [[ProfileViewController alloc] init];
    
    UITabBarController *tabBarViewController = [[UITabBarController alloc] init];
    [tabBarViewController setViewControllers:@[profileViewController]];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
