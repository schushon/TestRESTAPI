//
//  EZPDFSlideMenu.m
//  ezPDF Player
//
//  Created by puttana on 2016. 2. 23..
//  Copyright © 2016년 Unidocs. All rights reserved.
//

#import "EZPDFSlideMenu.h"
#import "CustomPDFView.h"
#import "EZPDFFileTableViewController.h"
#import "EZPDFFileItem.h"

CGFloat PointDistance(CGPoint a, CGPoint b)
{
    CGFloat deltaX = a.x - b.x;
    CGFloat deltaY = a.y - b.y;
    
    return sqrt( (deltaX * deltaX) + (deltaY * deltaY) );
}

//#define FULL_MENU

@interface EZPDFSlideMenu ()

@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGPoint startPoint;
@property(nonatomic, assign) CGPoint oldPoint;
@property(nonatomic, assign) CGPoint lastPoint;
@property(nonatomic, assign) BOOL    bReload;
@end


@implementation EZPDFSlideMenu

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.width = self.view.frame.size.width;
    
    self.frontSwitch.on = [self.reader isFrontPage];
    self.bwSwitch.on = [self.reader isBWEffect];
    self.bwSlider.value = [self.reader getDarkness];
    self.effectSwitch.on = [self.reader isFlipEffect];
    
    [self updateScrollLabel];
    [self updateSidePageLabel];
    [self updatePageReadDirection];
    self.bReload = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateSidePageLabel
{
    NSString *title = [self.reader isDoubleSidePage] ? NSLocalizedString(@" SinglePage View", "") : NSLocalizedString(@" DoublePage View", "");
    self.frontSwitch.enabled = [self.reader isDoubleSidePage];
    
    UIImage *img = [self.reader isDoubleSidePage] ? [UIImage imageNamed:@"btn_singlepage_nor"] : [UIImage imageNamed:@"btn_doublepage_nor"];
    UIImage *himg = [self.reader isDoubleSidePage] ? [UIImage imageNamed:@"btn_singlepage_nor"] : [UIImage imageNamed:@"btn_doublepage_nor"];
    
    [self.doubleSideButton setTitle:title forState:UIControlStateNormal];
    [self.doubleSideButton setImage:img forState:UIControlStateNormal];
    [self.doubleSideButton setImage:himg forState:UIControlStateHighlighted];
}

- (void)updateScrollLabel
{
    NSString *title = [self.reader isScroll] ? NSLocalizedString(@" Horizental Scrolling", "") : NSLocalizedString(@" Vertical Scrolling", "");

    UIImage *img = [self.reader isScroll] ? [UIImage imageNamed:@"btn_horizontal_nor"] : [UIImage imageNamed:@"btn_vertical_nor"];
    UIImage *himg = [self.reader isScroll] ? [UIImage imageNamed:@"btn_horizontal_nor"] : [UIImage imageNamed:@"btn_vertical_nor"];
    
    self.effectSwitch.enabled = ![self.reader isScroll];
    
    [self.scrollingButton setTitle:title forState:UIControlStateNormal];
    [self.scrollingButton setImage:img forState:UIControlStateNormal];
    [self.scrollingButton setImage:himg forState:UIControlStateHighlighted];
}

- (void)updatePageReadDirection
{
    switch ([self.reader isReadDirection]) {
        case EDPageReadDirectionAuto:
            break;
        case EDPageReadDirectionRight:
            [self.readDirectButton setTitle:NSLocalizedString(@"  Read Direction Right", "") forState:UIControlStateNormal];
            [self.readDirectButton setImage:[UIImage imageNamed:@"pageleft"] forState:UIControlStateNormal];
            [self.readDirectButton setImage:[UIImage imageNamed:@"pageleft"] forState:UIControlStateHighlighted];

            break;
        case EDPageReadDirectionLeft:
            [self.readDirectButton setTitle:NSLocalizedString(@"  Read Direction Left", "") forState:UIControlStateNormal];
            [self.readDirectButton setImage:[UIImage imageNamed:@"pageright"] forState:UIControlStateNormal];
            [self.readDirectButton setImage:[UIImage imageNamed:@"pageright"] forState:UIControlStateHighlighted];
            break;
        default:
            break;
    }
   
}
- (void)updateStoryBookLabel
{
//    self.storyBookPlayButton.selected = [self.reader isAutoPlaying];
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
    if ([self.reader.path length] == 0)
    {
        return 1;
    }
    
#ifdef FULL_MENU
    return 8;
#else
    if (self.bwSwitch.on) {
        return 11;
    }
    return 10;
#endif
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
 
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - IBAction
//    if (self.fileController == nil) {
//        EZPDFFileTableViewController *ctrl = [[EZPDFFileTableViewController alloc] initWithNibName:@"EZPDFFileTableViewController" bundle:nil];
//        [self.view addSubview:ctrl.view];
//        [self addChildViewController:ctrl];
//        self.fileController = ctrl;
//        [self.fileController resetPosition];
//    }
- (IBAction)fileList:(id)sender
{
    EZPDFFileTableViewController *ctrl = [[EZPDFFileTableViewController alloc] initWithNibName:@"EZPDFFileTableViewController" bundle:nil];
    //ctrl.modalPresentationStyle = UIModalPresentationFormSheet;
    ctrl.openedItem = [EZPDFFileItem fileItem:[self.reader localPath]];
    //ctrl.recentlyList = [self.reader recentlyList];
    [self presentViewController:ctrl animated:YES completion:nil];
    [self dismiss:nil];

}

- (IBAction)markGradeCurrentPage:(id)sender
{
    [self.reader markGradeCurrentPage:sender];
    [self dismiss:nil];
}

- (IBAction)markGradeAllPage:(id)sender
{
    [self.reader markGradeAllPage:sender];
    [self dismiss:nil];
}

- (IBAction)clearMarkGradeCurrentPage:(id)sender
{
    [self.reader clearMarkGradeCurrentPage:sender];
    [self dismiss:nil];
}

- (IBAction)clearMarkGradeAllPage:(id)sender
{
    [self.reader clearMarkGradeAllPage:sender];
    [self dismiss:nil];
}

// Double / Single pageView
- (IBAction)doubleSideList:(id)sender
{
    [self.reader toggleSidePage];
    [self updateSidePageLabel];
    [self dismiss:nil];
}

// Horizontal / Vertical Scrolling
- (IBAction)scolling:(id)sender
{
    [self.reader toggleSideScroll];
    
    [self updateScrollLabel];
    
    [self dismiss:nil];
}

- (IBAction)changeFrontpageOnOff:(id)sender
{
    UISwitch *Switch = sender;
    [self.reader toggleSideFront:Switch.on];
    [self dismiss:nil];
}

- (IBAction)clearKnowledgeTapCurrentPage:(id)sender
{
    [self.reader clearKnowleadgeTapCurrentPage:sender];
    [self dismiss:nil];
}

- (IBAction)clearCurrentPage:(id)sender
{
    [self.reader clearCurrentPage:sender];
    [self dismiss:nil];
}

- (IBAction)storyBookPlay:(id)sender
{
    [self.reader autoPlayToggle:sender];
    [self dismiss:nil];
}

- (IBAction)bookEffect:(id)sender{
    [self.reader bookEffect:self.effectSwitch.on];
    [self dismiss:nil];
}
- (IBAction)blackandwhite:(id)sender{
    [self.reader blackandwhite:self.bwSwitch.on];
    [self.tableView reloadData];
}

- (IBAction)bwslider:(id)sender{
    if (self.bReload) {
        self.bReload = NO;
        [self performSelector:@selector(callBWSlider) withObject:nil afterDelay:0.4];
    }

}

- (void)callBWSlider{
     [self.reader darkness:self.bwSlider.value];
    self.bReload = YES;
}

- (IBAction)print:(id)sender {
    [self.reader print];
}

- (IBAction)readDirection:(id)sender {
    if ([self.reader isReadDirection] == EDPageReadDirectionRight) {
         [self.reader readDirection:EDPageReadDirectionLeft];
    }
    else if([self.reader isReadDirection] == EDPageReadDirectionLeft){
         [self.reader readDirection:EDPageReadDirectionRight];
    }
    else{
        
    }
    
    [self updatePageReadDirection];

    [self dismiss:nil];
}

- (IBAction)addContents:(id)sender{
    [self.reader addContents:self.addContentsButton.selected];
    self.addContentsButton.selected = !self.addContentsButton.isSelected;
    [self dismiss:nil];
}

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

- (void)reloadData
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        self.frontSwitch.on = [self.reader isFrontPage];
        self.bwSwitch.on = [self.reader isBWEffect];
        self.bwSlider.value = [self.reader getDarkness];
        self.effectSwitch.on = [self.reader isFlipEffect];
        
        [self.tableView reloadData];
        [self updateSidePageLabel];
        [self updateScrollLabel];
        [self updateStoryBookLabel];
        [self updatePageReadDirection];
    });
}

@end
