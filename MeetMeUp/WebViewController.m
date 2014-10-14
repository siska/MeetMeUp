//
//  WebViewController.m
//  MeetMeUp
//
//  Created by S on 10/13/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *url = [self.webEventSegue objectForKey:@"event_url"];
    [self loadHomepage:url];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void) loadHomepage:(NSString *)urlString
{
    //call this from viewDidLoad and load the homepage
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}



@end
