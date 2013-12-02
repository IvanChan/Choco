//
//  PageManager.h
//  testUIWebCore
//
//  Created by Chan Ivan on 7/29/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WebViewController;
@interface PageManager : NSObject

@property (nonatomic, retain) UIView *pageSuperView;

+ (PageManager *)sharedManger;

- (NSArray *)allPages;
- (NSInteger)pagesCount;
- (NSInteger)activePageID;
- (NSInteger)activeIndex;
- (WebViewController *)activePage;

- (WebViewController *)pageAtIndex:(NSInteger)index;
- (void)addNewPage:(WebViewController *)page;
- (void)addNewPageWithURL:(NSURL *)URL;
- (void)removePageAtIndex:(NSInteger)index;

- (void)removePageByID:(NSInteger)pageID;
- (WebViewController *)pageByID:(NSInteger)pageID;

- (void)activatePage:(WebViewController *)page;
- (void)activatePageByID:(NSInteger)pageID;

- (NSDictionary *)activePageProperties;

@end
