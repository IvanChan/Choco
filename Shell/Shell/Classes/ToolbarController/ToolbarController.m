//
//  TopbarController.m
//  testUIWebCore
//
//  Created by Chan Ivan on 7/22/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "ToolbarController.h"
#import "ToolbarView.h"
#import "GlobalDef.h"
#import "PageManager.h"
#import "WebViewController.h"

@interface ToolbarController () <ToolbarViewDelegate>

@property (nonatomic, retain) ToolbarView *mainView;

@end

@implementation ToolbarController
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
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
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
    
    self.mainView = [[ToolbarView alloc] initWithFrame:frame];
    self.mainView.delegate = self;
}

#pragma mark - Toolbar Action
- (void)setToolbarHidden:(BOOL)isHidden animated:(BOOL)animated
{
    [self.mainView setToolbarHidden:isHidden animated:animated];
}

#pragma mark - Notifications
- (void)didReceivePageDidLoadNotification:(NSNotification *)notification
{
    WebViewController *activePage = [[PageManager sharedManger] activePage];

    BOOL canGoBack = [activePage canGoBack];
    BOOL canGoForward = [activePage canGoForward];
    
    [self.mainView updateBackwardState:canGoBack forwardState:canGoForward];
}

#pragma mark - Toolbar delegate
- (void)toolbarView:(ToolbarView *)toolbarView didClickBackward:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UserGoBacwardkNotification object:nil userInfo:nil];
}

- (void)toolbarView:(ToolbarView *)toolbarView didClickForward:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UserGoForwardNotification object:nil userInfo:nil];
}
- (void)toolbarView:(ToolbarView *)toolbarView didClickBookmark:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UserGoBookmarkNotification object:nil userInfo:nil];
}

- (void)toolbarView:(ToolbarView *)toolbarView didClickDownload:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UserGoDownloadNotification object:nil userInfo:nil];
}

- (void)toolbarView:(ToolbarView *)toolbarView didClickTabs:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UserGoTabsNotification object:nil userInfo:nil];
}

@end
