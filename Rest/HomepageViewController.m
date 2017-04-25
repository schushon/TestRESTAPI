//
//  HomepageViewController.m
//  Rest
//
//  Created by SHON on 25/04/2017.
//  Copyright © 2017 SHON. All rights reserved.
//

#import "HomepageViewController.h"

@interface HomepageViewController ()

@property (nonatomic, assign) BOOL pageLoaded;

@end


@implementation HomepageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"self.homepageURLString : %@", self.homepageURLString);
    
    [self.homepageWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.homepageURLString]]];
    self.homepageWebView.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad:");
    
    [self.activityIndicatorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad:");
    
    // after all your stuff
    self.pageLoaded = YES;
    
    [self.activityIndicatorView stopAnimating];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"webViewFailLoadWithError:");
}

@end
