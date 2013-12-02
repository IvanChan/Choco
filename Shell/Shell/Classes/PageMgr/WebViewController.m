//
//  WebViewController.m
//  testUIWebCore
//
//  Created by Chan Ivan on 7/29/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "WebViewController.h"
#import "UIWebViewEx.h"
#import "UIWebCoreFactory.h"
#import "GlobalDef.h"

@interface WebViewController () <IWebViewDelegate>

@property (nonatomic, retain) UIWebViewEx *webView;

@end

@implementation WebViewController
@synthesize webView = _webView;
@synthesize active = _active;
@synthesize pageID = _pageID;

static NSInteger global_pageID = 0;

#pragma mark - Init & Dealloc
- (id)initWebViewWithFrame:(CGRect)frame
{
    if (self = [super init])
    {
        _pageID = global_pageID++;
        
        _webView = [UIWebCoreFactory createWebViewWithFrame:frame];
        _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _webView.delegate = self;
        
        if (DEVICE_PAD)
        {
            [_webView setUserAgent:IPAD_UA];
        }
        else
        {
            [_webView setUserAgent:IPHONE_UA];
        }
    }
    
    return self;
}

- (void)dealloc
{
    [_webView release];
    _webView = nil;
    
    [super dealloc];
}

#pragma mark - WebView
- (UIView *)view
{
    return self.webView;
}

- (NSString *)title
{
    return [self.webView title];
}

- (NSString *)URL
{
    return [self.webView URL];
}

- (void)setActive:(BOOL)active
{
    _active = active;
    
    [self.webView setActive:active];
}

#pragma mark - Load
- (void)loadURL:(NSURL *)URL
{
    [self.webView loadURL:URL];
}

#pragma mark - User Interaction
- (void)reload
{
    [self.webView reload];
}

- (BOOL)isLoading
{
    return [self.webView isLoading];
}

- (void)stopLoading
{
    [self.webView stopLoading];
}

- (BOOL)canGoBack
{
    return [self.webView canGoBack];
}

- (void)goBack
{
    [self.webView goBack];
}

- (BOOL)canGoForward
{
    return [self.webView canGoForward];
}

- (void)goForward
{
    [self.webView goForward];
}

@end
