#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController

@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) NSDictionary *userProfile;

- (void) requestSuccessful;

@end
