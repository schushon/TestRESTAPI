//
//  SlideMenu.m
//
//  Created by Shon on 2017. 4. 23..
//

#import "SlideMenu.h"
#import "ViewController.h"
#import <RestKit/RestKit.h>
#import "User.h"

#define kBASEURL    @"https://api.github.com"
#define kUSERNAME   "jakewharton"

CGFloat PointDistance(CGPoint a, CGPoint b)
{
    CGFloat deltaX = a.x - b.x;
    CGFloat deltaY = a.y - b.y;
    
    return sqrt( (deltaX * deltaX) + (deltaY * deltaY) );
}

//#define FULL_MENU

@interface SlideMenu ()

@property (nonatomic, strong) NSArray *profiles;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint oldPoint;
@property (nonatomic, assign) CGPoint lastPoint;
@property (nonatomic, assign) BOOL bReload;

@end


@implementation SlideMenu

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.width = self.view.frame.size.width;
    
    self.bReload = YES;
    
    self.profiles = nil;  //self.profiles[0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.sectionHeaderHeight)];
    headerView.backgroundColor = self.view.backgroundColor;
    
    return headerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
 // Configure the cell...
 cell.backgroundColor = [UIColor redColor];
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate
// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)reloadData
{
//    User *user = _users[0];
//    
//    NSURL *imageURL = [NSURL URLWithString:user.profile.avatarUrl_];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^
//                   {
//                       NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
//                       
//                       dispatch_async(dispatch_get_main_queue(), ^
//                                      {
//                                          self.profileImageView.image = [UIImage imageWithData:imageData];
//                                      });
//                   });
//    
//    dispatch_async(dispatch_get_main_queue(), ^
//                   {
//                       self.nameLabel.text = user.profile.name_;
//                       self.emailLabel.text = user.profile.email_;
//                       self.companyLabel.text = user.profile.company_;
//                       self.locationLabel.text = user.profile.location_;
//                       //self.blogLabel.text = user.profile.bio_;
//                       self.followersLabel.text = [NSString stringWithFormat:@"%@", user.profile.followers_];
//                       self.followingLabel.text = [NSString stringWithFormat:@"%@", user.profile.following_];
//                       self.repositoriesLabel.text = [NSString stringWithFormat:@"%@", user.profile.publicRepos_];
//                       [self.tableView reloadData];
//                   });
    
    [self.tableView reloadData];
}

#pragma mark - IBAction
- (void)dismissFromView:(UIView *)aView
{
    [UIView animateKeyframesWithDuration:0.3 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^
     {
         CGRect f = aView.frame;
         f.origin.x -= self.width;
         f.size.width = self.width;
         self.view.frame = f;
         self.view.layer.shadowOpacity = 0.0;
     } completion:^(BOOL finished)
     {
         self.dismissMenuButton.hidden = YES;
         CGRect f = self.dragDelegateView.frame;
         f.origin.x = 0.0;
         self.dragDelegateView.frame = f;
         self.view.hidden = YES;
     }];
}

- (IBAction)dismiss:(id)sender
{
    [self dismissFromView:self.view.superview];
}

- (void)resetPosition
{
    CGRect f = self.view.superview.frame;
    f.origin.x -= self.width;
    f.size.width = self.width;
    self.view.frame = f;
}

- (IBAction)slideUp:(id)sender
{
    [self configureRestKitForUser];
    [self loadUsers];
    
    [UIView animateKeyframesWithDuration:0.3 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^
     {
         CGRect f = self.view.superview.frame;
         f.origin.x = 0;
         f.size.width = self.width;
         self.view.frame = f;
         self.view.layer.shadowOpacity = 0.1;
         self.view.hidden = NO;
     } completion:^(BOOL finished)
     {
         self.dismissMenuButton.hidden = NO;
         CGRect f = self.dragDelegateView.frame;
         f.origin.x = CGRectGetMaxX(self.view.frame);
         self.dragDelegateView.frame = f;
     }];
    
    [self.tableView reloadData];
}

#pragma mark - GestureRecognizer
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.startPoint = [touch locationInView:self.view];
    self.oldPoint = [touch locationInView:self.view.superview];
    self.lastPoint = [touch locationInView:self.view.superview];
    self.view.hidden = NO;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pt = [touch locationInView:self.view];
    CGFloat dx = pt.x - self.startPoint.x;
    CGRect f = self.view.frame;
    f.origin.x += dx;
    self.view.frame = f;
    
    if (CGRectGetMinX(self.view.frame) > 0)
    {
        CGRect f = self.view.frame;
        f.origin.x = 0;
        self.view.frame = f;
    }
    
    pt = [touch locationInView:self.view.superview];
    CGFloat dis = PointDistance(pt, self.oldPoint);
    
    if (dis > 5.0)
    {
        self.oldPoint = self.lastPoint;
        self.lastPoint = pt;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = self.lastPoint;
    CGFloat a = atan2(pt.x - self.oldPoint.x, pt.y - self.oldPoint.y);
    
    ////////////////////////////////
    //              M_PI
    //               |
    //    -M_PI_2 ---|--- M_PI_2
    //               |
    //               0
    ////////////////////////////////
    
    if (a < 0)
    {
        [self dismiss:nil];
    }
    else
    {
        [self slideUp:nil];
    }
}

#pragma mark - RESTKit
- (void)configureRestKitForUser
{
    // initialize AFNetworking HTTPClient
    NSURL *baseURL = [NSURL URLWithString:kBASEURL];  // [NSURL URLWithString:@"https://api.github.com"];
    AFRKHTTPClient *client = [[AFRKHTTPClient alloc] initWithBaseURL:baseURL];
    
    // initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
    // setup object mappings
    RKObjectMapping *userMapping = [RKObjectMapping mappingForClass:[User class]];
    [userMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:nil toKeyPath:@"user"]];
    
    RKObjectMapping *profileMapping = [RKObjectMapping mappingForClass:[Profile class]];
    [profileMapping addAttributeMappingsFromDictionary:@{@"login" : @"login_",  // "JakeWharton",
                                                         @"id" : @"ID_",  // 66577,
                                                         @"avatar_url" : @"avatarUrl_",  // "https://avatars3.githubusercontent.com/u/66577?v=3",
                                                         @"gravatar_id" : @"gravatarID_",  // "",
                                                         @"url" : @"url_",  // "https://api.github.com/users/JakeWharton",
                                                         @"html_url" : @"htmlUrl_",  // "https://github.com/JakeWharton",
                                                         @"followers_url" : @"followersUrl_",  // "https://api.github.com/users/JakeWharton/followers",
                                                         @"following_url" : @"followingUrl_",  // "https://api.github.com/users/JakeWharton/following{/other_user}",
                                                         @"gists_url" : @"gistsUrl_",  // "https://api.github.com/users/JakeWharton/gists{/gist_id}",
                                                         @"starred_url" : @"starredUrl_",  // "https://api.github.com/users/JakeWharton/starred{/owner}{/repo}",
                                                         @"subscriptions_url" : @"subscriptionsUrl_",  // "https://api.github.com/users/JakeWharton/subscriptions",
                                                         @"organizations_url" : @"organizationsUrl_",  // "https://api.github.com/users/JakeWharton/orgs",
                                                         @"repos_url" : @"reposUrl_",  // "https://api.github.com/users/JakeWharton/repos",
                                                         @"events_url" : @"eventsUrl_",  // "https://api.github.com/users/JakeWharton/events{/privacy}",
                                                         @"received_events_url" : @"receivedEventsUrl_",  // "https://api.github.com/users/JakeWharton/received_events",
                                                         @"type" : @"type_",  // "User",
                                                         @"site_admin" : @"siteAdmin_",  // false,
                                                         @"name" : @"name_",  // "Jake Wharton",
                                                         @"company" : @"company_",  // "Square, Inc.",
                                                         @"blog" : @"blog_",  // "http://jakewharton.com",
                                                         @"location" : @"location_",  // "Pittsburgh, PA, USA",
                                                         @"email" : @"email_",  // "jakewharton@gmail.com",
                                                         @"hireable" : @"hireable_",  // null,
                                                         @"bio" : @"bio_",  // null,
                                                         @"public_repos" : @"publicRepos_",  // 93,
                                                         @"public_gists" : @"publicGists_",  // 54,
                                                         @"followers" : @"followers_",  // 34096,
                                                         @"following" : @"following_",  // 12,
                                                         @"created_at" : @"createdDate_",  // "2009-03-24T16:09:53Z",
                                                         @"updated_at" : @"updatedDate_"}];  // "2017-04-25T13:42:32Z"
    
    NSString *userName = [NSString stringWithUTF8String:kUSERNAME];
    NSString *pathPattern = [NSString stringWithFormat:@"/users/%@", userName];
    
    // define relationship mapping
    [userMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:nil toKeyPath:@"profile" withMapping:profileMapping]];
    
    // register mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:userMapping method:RKRequestMethodGET pathPattern:pathPattern keyPath:nil statusCodes:[NSIndexSet indexSetWithIndex:200]];  //:(RKStatusCodeClassSuccessful)
    
    [objectManager addResponseDescriptor:responseDescriptor];
    
    // 주석추가
}

- (void)loadUsers
{
    //    NSString *latLon = @"37.33,-122.03"; // approximate latLon of The Mothership
    //    NSString *clientID = [NSString stringWithUTF8String:kCLIENTID];
    //    NSString *clientSecret = [NSString stringWithUTF8String:kCLIENTSECRET];
    //
    //    NSDictionary *queryParams;
    //
    //    queryParams = [NSDictionary dictionaryWithObjectsAndKeys:
    //                   latLon, @"ll",
    //                   clientID, @"client_id",
    //                   clientSecret, @"client_secret",
    //                   @"4bf58dd8d48988d1e0931735", @"categoryId",
    //                   @"20140118", @"v", nil];
    
    NSString *userName = [NSString stringWithUTF8String:kUSERNAME];
    NSString *pathPattern = [NSString stringWithFormat:@"/users/%@", userName];
    
    [[RKObjectManager sharedManager] getObjectsAtPath:pathPattern parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult)
     {
         _profiles = mappingResult.array;
         
         //self.slideMenu.profiles = _profiles;
         //[self.slideMenu reloadData];
     } failure:^(RKObjectRequestOperation *operation, NSError *error)
     {
         NSLog(@"What do you mean by 'there is no coffee?': %@", error);
     }];
}


@end
