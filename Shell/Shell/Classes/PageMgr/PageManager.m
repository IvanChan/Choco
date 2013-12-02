//
//  PageManager.m
//  testUIWebCore
//
//  Created by Chan Ivan on 7/29/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "PageManager.h"
#import "WebViewController.h"
#import "GlobalDef.h"

@interface PageManager ()

@property (nonatomic, retain) NSMutableArray *pageList;
@property (nonatomic, assign) NSInteger activePageID;
@property (nonatomic, retain) NSMutableDictionary *pageHash;

@end

@implementation PageManager
@synthesize pageList = _pageList;
@synthesize pageHash = _pageHash;
@synthesize activePageID = _activePageID;
@synthesize pageSuperView = _pageSuperView;

#pragma mark - Init & Dealloc
+ (PageManager *)sharedManger
{
    static PageManager *s_manager = nil;
    if (s_manager == nil)
    {
        s_manager = [[PageManager alloc] init];
    }
    
    return s_manager;
}

- (id)init
{
    if (self = [super init])
    {
        self.activePageID = -1;
    }
    
    return self;
}

- (void)dealloc
{
    [_pageList release];
    _pageList = nil;
    
    [_pageHash release];
    _pageHash = nil;
    
    [super dealloc];
}

#pragma mark - Getter
- (NSMutableArray *)pageList
{
    if (_pageList == nil)
    {
        _pageList = [[NSMutableArray alloc] init];
    }
    
    return _pageList;
}

- (NSMutableDictionary *)pageHash
{
    if (_pageHash == nil)
    {
        _pageHash = [[NSMutableDictionary alloc] init];
    }
    
    return _pageHash;
}

- (NSArray *)allPages
{
    return [self.pageList copy];
}

#pragma mark - Data Ops
- (NSInteger)pagesCount
{
    return [self.pageList count];
}

- (NSInteger)activeIndex
{
    return [self.pageList indexOfObject:[self activePage]];
}

- (WebViewController *)activePage
{
    return [self pageByID:self.activePageID];
}

- (WebViewController *)pageAtIndex:(NSInteger)index
{
    if ([self pagesCount] <= 0)
    {
        return nil;
    }
    
    NSInteger realIndex = index;
    
    if (realIndex < 0)
    {
        realIndex = 0;
    }
    else if (realIndex >= [self pagesCount])
    {
        realIndex = [self pagesCount] - 1;
    }
    
    return [self.pageList objectAtIndex:realIndex];
}

- (WebViewController *)pageByID:(NSInteger)pageID
{
    return [self.pageHash objectForKey:[self keyForPageID:pageID]];
}

- (void)addNewPage:(WebViewController *)page
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UserAddNewTabNotification object:nil userInfo:[NSDictionary dictionaryWithObject:page forKey:KEY_CONTROLLER]];
    
    [self.pageList addObject:page];
    [self.pageHash setObject:page forKey:[NSString stringWithFormat:@"%d",page.pageID]];
    
    [self activatePage:page];
}

- (void)addNewPageWithURL:(NSURL *)URL
{
    WebViewController *newPage = [[[WebViewController alloc] initWebViewWithFrame:self.pageSuperView.bounds] autorelease];
    [self addNewPage:newPage];
    
    if (URL)
    {
        [newPage loadURL:URL];
    }
}

- (void)removePageAtIndex:(NSInteger)index
{
    if ([self pagesCount] <= 1 || index >= [self pagesCount])
    {
        return ;
    }
        
    WebViewController *targetPage = [self.pageList objectAtIndex:index];
    
    if (targetPage.pageID == self.activePageID)
    {
        WebViewController *nextPage = nil;
        if (index < [self pagesCount] - 1)
        {
            nextPage = [self pageAtIndex:index + 1];
        }
        else
        {
            nextPage = [self pageAtIndex:index - 1];
        }
        
        [self activatePage:nextPage];
    }
    
    [self.pageHash removeObjectForKey:[self keyForPageID:targetPage.pageID]];
    [self.pageList removeObjectAtIndex:index];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UserDidCloseTabNotification object:nil userInfo:nil];
}

- (void)removePageByID:(NSInteger)pageID
{
    if ([self pagesCount] <= 1)
    {
        return ;
    }
    
    WebViewController *targetPage = [self pageByID:pageID];
    if (targetPage)
    {
        NSInteger index = [self.pageList indexOfObject:targetPage];
        
        if (pageID == self.activePageID)
        {
            WebViewController *nextPage = nil;
            if (index < [self pagesCount] - 1)
            {
                nextPage = [self pageAtIndex:index + 1];
            }
            else
            {
                nextPage = [self pageAtIndex:index - 1];
            }
            
            [self activatePage:nextPage];
        }
    
        [self.pageHash removeObjectForKey:[self pageByID:pageID]];
        [self.pageList removeObject:targetPage];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:UserDidCloseTabNotification object:nil userInfo:nil];
    }
}

#pragma mark - active
- (NSString *)keyForPageID:(NSInteger)pageID
{
    return [NSString stringWithFormat:@"%d",pageID];
}

- (void)activatePage:(WebViewController *)page
{
    if (page.pageID == self.activePageID || page == nil)
    {
        return;
    }
    
    WebViewController *currentPage = [self pageByID:self.activePageID];
    UIView *webSuperView = self.pageSuperView;//currentPage.view.superview;

    [currentPage setActive:NO];
    [currentPage.view removeFromSuperview];
    
    [page setActive:YES];
    self.activePageID = page.pageID;
    [webSuperView addSubview:page.view];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:PageDidActivateNotification object:nil userInfo:[self activePageProperties]];
    
}

- (void)activatePageByID:(NSInteger)pageID
{
    WebViewController *targetPage = [self.pageHash objectForKey:[self keyForPageID:pageID]];
    [self activatePage:targetPage];
}

- (NSDictionary *)activePageProperties
{
    WebViewController *activePage = [self activePage];
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    NSString *URL = [activePage URL];
    if (URL)
    {
        [info setObject:URL forKey:KEY_URL];
    }
    NSString *title = [activePage title];
    if (title)
    {
        [info setObject:title forKey:KEY_TITLE];
    }
    
    [info setObject:[NSNumber numberWithBool:[activePage isLoading]] forKey:KEY_LOADING_FLAG];
    [info setObject:[NSNumber numberWithBool:[activePage canGoBack]] forKey:KEY_BACKWARD_FLAG];
    [info setObject:[NSNumber numberWithBool:[activePage canGoForward]] forKey:KEY_FORWARD_FLAG];
    
    return info;
}

@end
