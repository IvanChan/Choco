//
//  TopbarController.m
//  testUIWebCore
//
//  Created by Chan Ivan on 7/22/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "TopbarController.h"
#import "TopbarView.h"
#import "PageManager.h"
#import "WebViewController.h"

@interface TopbarController () <TopbarViewDelegate>

@property (nonatomic, retain) TopbarView *mainView;

@end

@implementation TopbarController
@synthesize mainView = _mainView;

#pragma mark - Init & Dealloc
- (id)init
{
    if (self = [super init])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceivePageDidLoadNotification:)
                                                     name:PageDidLoadNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceivePageDidActivateNotification:)
                                                     name:PageDidActivateNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceivePageLoadingPercentageChangedNotification:)
                                                     name:PageLoadingPercentageChangedNotification
                                                   object:nil];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    _mainView.delegate = nil;
    [_mainView release];
    _mainView = nil;
    
    [super dealloc];
}

#pragma mark - View
- (UIView *)view
{
    return self.mainView;
}

- (void)createViewWithFrameIfNeeded:(CGRect)frame
{
    if (self.mainView)
    {
        return;
    }
    
    self.mainView = [[TopbarView alloc] initWithFrame:frame];
    self.mainView.delegate = self;
}

#pragma mark - Topbar Action
- (TopbarState)state
{
    return self.mainView.state;
}

- (void)changeToState:(TopbarState)state animated:(BOOL)animated
{
    [self.mainView changeToState:state animated:animated];
}

#pragma mark - Notifications
- (void)didReceivePageDidLoadNotification:(NSNotification *)notification
{
    WebViewController *activePage = [[PageManager sharedManger] activePage];
    NSString *title = activePage.title;
    NSString *URLStr = activePage.URL;
    
    BOOL isLoading = [activePage isLoading];
    BOOL canGoBack = [activePage canGoBack];
    BOOL canGoForward = [activePage canGoForward];
    
    [self.mainView updateBackwardState:canGoBack forwardState:canGoForward];
    [self.mainView setLoadingState:isLoading];
    [self.mainView setTopbarTitle:title URL:URLStr];
}

- (void)didReceivePageDidActivateNotification:(NSNotification *)notification
{
    WebViewController *activePage = [[PageManager sharedManger] activePage];
    NSString *title = activePage.title;
    NSString *URLStr = activePage.URL;

    BOOL isLoading = [activePage isLoading];
    BOOL canGoBack = [activePage canGoBack];
    BOOL canGoForward = [activePage canGoForward];
    
    [self.mainView updateBackwardState:canGoBack forwardState:canGoForward];
    [self.mainView setLoadingState:isLoading];
    [self.mainView setTopbarTitle:title URL:URLStr];
}

- (void)didReceivePageLoadingPercentageChangedNotification:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    CGFloat percentage = [[info objectForKey:KEY_LOAD_PERCENTAGE] floatValue];
    [self.mainView setProgressPercentage:percentage];
}

#pragma mark - TopbarView Delegate
- (void)topbarView:(TopbarView *)topbarView didClickGoToWithText:(NSString *)text
{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:text, KEY_URL, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:UserGoURLNotification object:nil userInfo:info];
}

- (void)topbarView:(TopbarView *)topbarView didClickRefreshStop:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UserRefreshStopNotification object:nil userInfo:nil];
}

- (void)topbarView:(TopbarView *)topbarView didClickAdd:(id)sender
{
    [[PageManager sharedManger] addNewPageWithURL:nil];
}

- (void)topbarView:(TopbarView *)topbarView didClickBackward:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UserGoBacwardkNotification object:nil userInfo:nil];
}

- (void)topbarView:(TopbarView *)topbarView didClickForward:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UserGoForwardNotification object:nil userInfo:nil];
}

@end
