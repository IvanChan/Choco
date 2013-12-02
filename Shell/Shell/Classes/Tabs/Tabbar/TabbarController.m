//
//  TabbarController.m
//  testUIWebCore
//
//  Created by Chan Ivan on 7/31/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "TabbarController.h"
#import "TabbarView.h"
#import "GlobalDef.h"
#import "PageManager.h"
#import "WebViewController.h"
#import "TabItem.h"

@interface TabbarController () <TabbarViewDelegate>

@property (nonatomic, retain) TabbarView *mainView;

@end

@implementation TabbarController
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
                                                 selector:@selector(didReceiveUserAddNewTabNotification:)
                                                     name:UserAddNewTabNotification
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
    
    self.mainView = [[TabbarView alloc] initWithFrame:frame];
    self.mainView.delegate = self;
}

#pragma mark - Notifications
- (void)didReceivePageDidLoadNotification:(NSNotification *)notification
{
    WebViewController *activePage = [[PageManager sharedManger] activePage];
    NSString *title = activePage.title;
    NSString *URLStr = activePage.URL;
//    BOOL isLoading = [[info objectForKey:KEY_LOADING_FLAG] boolValue];
//    BOOL canGoBack = [[info objectForKey:KEY_BACKWARD_FLAG] boolValue];
//    BOOL canGoForward = [[info objectForKey:KEY_FORWARD_FLAG] boolValue];
    
    NSString *tabTitle = title? title : URLStr;
    [self.mainView updateActiveTabTitle:tabTitle withPageID:activePage.pageID];
}

- (void)didReceivePageDidActivateNotification:(NSNotification *)notification
{
    WebViewController *activePage = [[PageManager sharedManger] activePage];
    NSString *title = activePage.title;
    NSString *URLStr = activePage.URL;
    //    BOOL isLoading = [[info objectForKey:KEY_LOADING_FLAG] boolValue];
    //    BOOL canGoBack = [[info objectForKey:KEY_BACKWARD_FLAG] boolValue];
    //    BOOL canGoForward = [[info objectForKey:KEY_FORWARD_FLAG] boolValue];
    
    NSString *tabTitle = title? title : URLStr;
    [self.mainView updateActiveTabTitle:tabTitle withPageID:activePage.pageID];
}

- (void)didReceiveUserAddNewTabNotification:(NSNotification *)notification
{
    WebViewController *page = [[notification userInfo] objectForKey:KEY_CONTROLLER];
    TabItem *item = [[TabItem alloc] initWithTitle:page.title URL:page.URL id:page.pageID];
    
    [self.mainView addNewTab:item animated:YES];
    
    [item release];
}

#pragma mark - Tabbar Delegate
- (void)tabbarView:(TabbarView *)tabbarView didChangeTabWithTabID:(NSInteger)tabID
{
    [[PageManager sharedManger] activatePageByID:tabID];
}

- (void)tabbarView:(TabbarView *)tabbarView didCloseTabWithTabID:(NSInteger)tabID
{
    [[PageManager sharedManger] removePageByID:tabID];
}

@end