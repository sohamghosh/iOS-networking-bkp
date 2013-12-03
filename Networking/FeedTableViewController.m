#import "FeedTableViewController.h"
#import "PhotoViewController.h"
#import "AFJSONRequestOperation.h"
#import "UIImageView+AFNetworking.h"

@interface FeedTableViewController ()

@end

@implementation FeedTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Feed";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_icon_feed.png"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [[NSURL alloc] initWithString:@"http://courseware.codeschool.com.s3.amazonaws.com/try_ios/level6demo/feedImages.json"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:request
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                             self.images = JSON;
                                             // Necessary, because by the time this runs, tableView:numberOfRowsInSection has already executed
                                             [self.tableView reloadData];
                                         }
                                         failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                             NSLog(@"NSError: %@",[error localizedDescription]);
                                         }];
    
    [operation start];     
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }    
    
    cell.textLabel.text = self.images[indexPath.row][@"title"];
    cell.detailTextLabel.text = self.images[indexPath.row][@"detail"];
    
    NSString *thumbnail = self.images[indexPath.row][@"thumbnail"];
    
    [cell.imageView setImageWithURL:[NSURL URLWithString:thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; //??
    
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    
    photoVC.imageFileName = self.images[indexPath.row][@"filename"];
    photoVC.imageTitle = self.images[indexPath.row][@"title"];

    [self.navigationController pushViewController:photoVC animated:YES];
}

@end
