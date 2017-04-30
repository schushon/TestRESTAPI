//
//  ViewController.h
//  Rest
//
//  Created by SHON on 23/04/2017.
//  Copyright © 2017 SHON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DragDelegateView.h"
#import "SlideMenu.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UIButton *dismissMenuButton;
@property (nonatomic, weak) IBOutlet DragDelegateView *dragDelegateView;
@property (nonatomic, weak) IBOutlet UITableView *repoTableView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *slideMenuBarButtonItem;
@property (nonatomic, weak) SlideMenu *slideMenu;

@end

