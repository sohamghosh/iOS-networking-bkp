#import "PhotoViewController.h"
#import "UIImageView+AFNetworking.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // custom code
    }
    return self;   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(10, 10, 300, 300);
    [imageView setImageWithURL:[NSURL URLWithString:self.imageFileName]];
    [self.view addSubview:imageView];
    
    UILabel *imageTitleLabel = [[UILabel alloc] init];
    imageTitleLabel.text = self.imageTitle;
    imageTitleLabel.frame = CGRectMake(11,320,300,40);
    [self.view addSubview:imageTitleLabel];
}

@end
