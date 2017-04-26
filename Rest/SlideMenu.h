//
//  SlideMenu.h
//
//  Created by Shon on 2017. 4. 23..
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface SlideMenu : UITableViewController

@property(nonatomic, weak) ViewController *mainView;
//@property (nonatomic, strong) NSArray *profiles;

@property(nonatomic, weak) IBOutlet UIButton *dismissMenuButton;
@property(nonatomic, weak) IBOutlet UIView *dragDelegateView;

@property(nonatomic, weak) IBOutlet UIImageView *profileImageView;
@property(nonatomic, weak) IBOutlet UILabel *nameLabel;
@property(nonatomic, weak) IBOutlet UILabel *emailLabel;
@property(nonatomic, weak) IBOutlet UILabel *companyLabel;
@property(nonatomic, weak) IBOutlet UILabel *locationLabel;
@property(nonatomic, weak) IBOutlet UILabel *blogLabel;
@property(nonatomic, weak) IBOutlet UILabel *followersLabel;
@property(nonatomic, weak) IBOutlet UILabel *followingLabel;
@property(nonatomic, weak) IBOutlet UILabel *repositoriesLabel;

- (IBAction)dismiss:(id)sender;
- (IBAction)slideUp:(id)sender;

- (void)dismissFromView:(UIView *)aView;
- (void)reloadData;
- (void)resetPosition;


@end
