//
//  TabbarView.m
//  testUIWebCore
//
//  Created by Chan Ivan on 7/31/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "TabbarView.h"
#import "TabItem.h"
#import "GlobalDef.h"

@interface TabbarView () <TabItemViewDelegate>

@property (nonatomic, retain) NSMutableArray *tabViewList;

@end

@implementation TabbarView
@synthesize delegate = _delegate;
@synthesize tabViewList = _tabViewList;

#pragma mark - Init & Dealloc
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
        _tabViewList = [[NSMutableArray alloc] init];
        
        [self setTabbarHidden:YES animated:NO];
    }
    
    return self;
}

- (void)dealloc
{
    _delegate = nil;
 
    [_tabViewList release];
    _tabViewList = nil;
    
    [super dealloc];
}

#pragma mark - Tab ops
- (NSInteger)currentActiveIndex
{
    NSInteger i = 0;
    for (; i < [self.tabViewList count]; i++)
    {
        TabItemView *tabItem = [self.tabViewList objectAtIndex:i];
        if ([tabItem isActive])
        {
            break;
        }
    }
    
    return i < [self.tabViewList count] ? i : [self.tabViewList count] - 1;
}

- (void)tabAnimationDidStop
{
    BOOL shouldHideTabbar = ([self.tabViewList count] <= 1);
    [self setTabbarHidden:shouldHideTabbar animated:YES];
}

- (void)addNewTab:(TabItem *)tabItem animated:(BOOL)animated
{
    if ([self.tabViewList count] > 15)
    {
        return;
    }
    
    TabItemView *tabView = [[TabItemView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds), 0, 1, CGRectGetHeight(self.bounds))];
    tabView.title = tabItem.title ? tabItem.title : tabItem.URL;
    tabView.tabID = tabItem.tabID;
    tabView.delegate = self;
    [tabView addTarget:self action:@selector(didClickOnTab:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabViewList addObject:tabView];
    [self addSubview:tabView];
    
    if (animated)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(tabAnimationDidStop)];
    }
    
    CGFloat tabWidth = CGRectGetWidth(self.bounds)/(CGFloat)[self.tabViewList count];
    for (int i = 0; i < [self.tabViewList count]; i++)
    {
        TabItemView *tabItem = [self.tabViewList objectAtIndex:i];
        CGRect rect = tabItem.frame;
        rect.origin.x = i*tabWidth;
        rect.size.width = tabWidth;
        tabItem.frame = rect;
    }
    
    TabItemView *lastActiveTabItem = [self.tabViewList objectAtIndex:[self currentActiveIndex]];
    [lastActiveTabItem setActive:NO];
    
    TabItemView *nextTabItem = [self.tabViewList lastObject];
    [nextTabItem setActive:YES];
    
    if (animated)
    {
        [UIView commitAnimations];
    }
    
}

- (void)removeTabViewAtIndex:(NSInteger)index animated:(BOOL)animated
{
    if (animated)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(tabAnimationDidStop)];
    }
    
    TabbarView *targetTab = [self.tabViewList objectAtIndex:index];
    [targetTab removeFromSuperview];
    
    [self.tabViewList removeObjectAtIndex:index];
    
    BOOL hasActiveTab = NO;
    CGFloat tabWidth = CGRectGetWidth(self.bounds)/(CGFloat)[self.tabViewList count];
    for (int i = 0; i < [self.tabViewList count]; i++)
    {
        TabItemView *tabItem = [self.tabViewList objectAtIndex:i];
        CGRect rect = tabItem.frame;
        rect.origin.x = i*tabWidth;
        rect.size.width = tabWidth;
        tabItem.frame = rect;
        
        if ([tabItem isActive])
        {
            hasActiveTab = YES;
        }
        
        if (!hasActiveTab && i == [self.tabViewList count] - 1)
        {
            [tabItem setActive:YES];
        }
    }

    if (animated)
    {
        [UIView commitAnimations];
    }
}


- (void)updateActiveTabTitle:(NSString *)title withPageID:(NSInteger)pageID
{
    if (title == nil || [title length] <= 0)
    {
        title = @"about:blank";
    }
    
    for (int i = 0; i < [self.tabViewList count]; i++)
    {
        TabItemView *tabItem = [self.tabViewList objectAtIndex:i];
        
        if ([tabItem isActive] && tabItem.tabID == pageID)
        {
            tabItem.title = title;
            break;
        }
    }
}

- (void)setTabbarHidden:(BOOL)isHidden animated:(BOOL)animated
{
    if (animated)
    {
        [UIView beginAnimations:nil context:nil];
    }
    
    CGFloat topbarHeight = TOPBAR_NORMAL_HEIGHT;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 6.99)
    {
        topbarHeight -= STATUS_BAR_HEIGHT;
    }
    
    CGRect rect = self.frame;
    rect.origin.y = isHidden ? (rect.origin.x - CGRectGetHeight(rect)) : topbarHeight;
    self.frame = rect;
    
    self.alpha = isHidden ? 0 : 1;
    
    if (animated)
    {
        [UIView commitAnimations];
    }
}

#pragma mark - TabItemView Delegate
- (void)tabItemView:(TabItemView *)tabItemView didCloseTabWithID:(NSInteger)pageID
{
    if ([self.delegate respondsToSelector:@selector(tabbarView:didCloseTabWithTabID:)])
    {
        [self.delegate tabbarView:self didCloseTabWithTabID:pageID];
    }
    
    [self removeTabViewAtIndex:[self.tabViewList indexOfObject:tabItemView] animated:YES];
}

#pragma mark - Callbacks
- (void)didClickOnTab:(TabItemView *)tabView
{
    for (int i = 0; i < [self.tabViewList count]; i++)
    {
        TabItemView *tabItem = [self.tabViewList objectAtIndex:i];
       
        tabItem.active = (tabItem.tabID == tabView.tabID) ? YES : NO;
    }
    
    if ([self.delegate respondsToSelector:@selector(tabbarView:didChangeTabWithTabID:)])
    {
        [self.delegate tabbarView:self didChangeTabWithTabID:tabView.tabID];
    }
}

@end
