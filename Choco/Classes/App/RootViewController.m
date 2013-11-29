//
//  RootViewController.m
//  Choco
//
//  Created by Chan Ivan on 11/29/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "RootViewController.h"
#import "CCWebView.h"

@interface RootViewController ()

@end

@implementation RootViewController

#pragma mark - LifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
   //UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    CCWebView *webView = [[CCWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.163.com"]]];
    [self.view addSubview:webView];
}

- (void)dealloc
{
    [super dealloc];
}

@end
