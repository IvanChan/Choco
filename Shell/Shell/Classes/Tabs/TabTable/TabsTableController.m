//
//  TabsTableController.m
//  testUIWebCore
//
//  Created by Chan Ivan on 7/31/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "TabsTableController.h"
#import "TabsTableView.h"
#import "TabItem.h"
#import "GlobalDef.h"
#import "PageManager.h"
#import "WebViewController.h"

@interface TabsTableController () <TabsTableViewDelegate>

@property (nonatomic, retain) TabsTableView *mainView;

@end

@implementation TabsTableController
@synthesize mainView = _mainView;

#pragma mark - Init & Dealloc
- (id)init
{
    if (self = [super init])
    {

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
    
    NSMutableArray *tabList = [NSMutableArray array];
    NSArray *allPage = [[PageManager sharedManger] allPages];
    for (WebViewController *page in allPage)
    {
        TabItem *item = [[TabItem alloc] initWithTitle:page.title URL:page.URL id:page.pageID];
        [tabList addObject:item];
        [item release];
    }

    self.mainView = [[TabsTableView alloc] initWithFrame:frame tabList:tabList];
    self.mainView.delegate = self;
}

#pragma mark - Notifications
#pragma mark - Page
- (void)updateTopbarDisplay
{
    WebViewController *nextPage = [[PageManager sharedManger] activePage];
    
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    NSString *URL = [nextPage URL];
    if (URL)
    {
        [info setObject:URL forKey:KEY_URL];
    }
    NSString *title = [nextPage title];
    if (title)
    {
        [info setObject:title forKey:KEY_TITLE];
    }
    
    [info setObject:[NSNumber numberWithBool:[nextPage isLoading]] forKey:KEY_LOADING_FLAG];
    [info setObject:[NSNumber numberWithBool:[nextPage canGoBack]] forKey:KEY_BACKWARD_FLAG];
    [info setObject:[NSNumber numberWithBool:[nextPage canGoForward]] forKey:KEY_FORWARD_FLAG];
    [[NSNotificationCenter defaultCenter] postNotificationName:PageDidLoadNotification object:nil userInfo:info];
}

#pragma mark - TabsTableView Delegate
- (void)tabsTableView:(TabsTableView *)tabsTableView didSelectTabWithID:(NSInteger)pageID
{
    [[PageManager sharedManger] activatePageByID:pageID];
    
    [self updateTopbarDisplay];
    
}

- (void)tabsTableView:(TabsTableView *)tabsTableView didRemoveTabWithID:(NSInteger)pageID
{
    [[PageManager sharedManger] removePageByID:pageID];
    
    [self updateTopbarDisplay];
}

- (void)tabsTableViewDidAddNewTab:(TabsTableView *)tabsTableView
{
    [[PageManager sharedManger] addNewPageWithURL:nil];
    [self updateTopbarDisplay];
}

- (void)tabsTableViewDidExit:(TabsTableView *)tabsTableView
{
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         self.view.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         
                         [self.view removeFromSuperview];
                         [_mainView release];
                         _mainView = nil;
                     }];
}
@end