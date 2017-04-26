//
//  EZPDFSlideMenu.h
//  ezPDF Player
//
//  Created by puttana on 2016. 2. 23..
//  Copyright © 2016년 Unidocs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomReader;
@class CustomPDFView;

@interface EZPDFSlideMenu : UITableViewController

@property(nonatomic, weak) CustomPDFView *reader;
@property(nonatomic, weak) IBOutlet UIButton *fileListButton;
@property(nonatomic, weak) IBOutlet UIButton *markGradeCurrentPageButton;
@property(nonatomic, weak) IBOutlet UIButton *markGradeAllPageButton;
@property(nonatomic, weak) IBOutlet UIButton *clearMarkGradeCurrentPageButton;
@property(nonatomic, weak) IBOutlet UIButton *clearMarkGradeAllPageButton;
@property(nonatomic, weak) IBOutlet UIButton *clearKnowleadgeTapCurrentPageButton;
@property(nonatomic, weak) IBOutlet UIButton *storyBookPlayButton;
@property(nonatomic, weak) IBOutlet UIButton *doubleSideButton;
@property(nonatomic, weak) IBOutlet UIButton *scrollingButton;
@property(nonatomic, weak) IBOutlet UIButton *frontpageButton;
@property(nonatomic, weak) IBOutlet UIButton *bookEffectButton;
@property(nonatomic, weak) IBOutlet UIButton *blackandwhiteButton;
@property(nonatomic, weak) IBOutlet UIButton *printButton;
@property(nonatomic, weak) IBOutlet UIButton *readDirectButton;
@property(nonatomic, weak) IBOutlet UIButton *addContentsButton;

@property(nonatomic, weak) IBOutlet UIButton *dismissMenuButton;
@property(nonatomic, weak) IBOutlet UIView *dragDelegateView;
@property(nonatomic, weak) IBOutlet UISwitch *frontSwitch;
@property(nonatomic, weak) IBOutlet UISwitch *effectSwitch;
@property(nonatomic, weak) IBOutlet UISwitch *bwSwitch;
@property(nonatomic, weak) IBOutlet UISlider *bwSlider;

- (IBAction)fileList:(id)sender;
- (IBAction)markGradeCurrentPage:(id)sender;
- (IBAction)markGradeAllPage:(id)sender;
- (IBAction)clearMarkGradeCurrentPage:(id)sender;
- (IBAction)clearMarkGradeAllPage:(id)sender;
- (IBAction)doubleSideList:(id)sender;
- (void)resetPosition;

- (void)dismissFromView:(UIView *)aView;
- (IBAction)dismiss:(id)sender;
- (IBAction)slideUp:(id)sender;
- (IBAction)scolling:(id)sender;
- (IBAction)changeFrontpageOnOff:(id)sender;
- (IBAction)bookEffect:(id)sender;
- (IBAction)blackandwhite:(id)sender;
- (IBAction)bwslider:(id)sender;
- (void)updateSidePageLabel;
- (IBAction)print:(id)sender;
- (IBAction)readDirection:(id)sender;
- (IBAction)addContents:(id)sender;
- (void)reloadData;

@end
