//
//  WebViewController.m
//  Code Challenge 1
//
//  Created by Taylor Wright-Sanson on 10/2/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *webViewActivityIndicator;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://www.mobilemakers.co"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];

    self.navigationItem.title = self.resultString;
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.leftBarButtonItem.title = @"Back";
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    self.webViewActivityIndicator.hidden = NO;
    [self.webViewActivityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.webViewActivityIndicator stopAnimating];
    self.webViewActivityIndicator.hidden = YES;

}


- (void)didReceiveMemoryWarning {
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

@end
