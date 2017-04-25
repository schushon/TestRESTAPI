//
//  HomepageViewController.h
//  Rest
//
//  Created by SHON on 25/04/2017.
//  Copyright © 2017 SHON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface HomepageViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, weak) IBOutlet UIWebView *homepageWebView;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong) NSString *homepageURLString;

@end
