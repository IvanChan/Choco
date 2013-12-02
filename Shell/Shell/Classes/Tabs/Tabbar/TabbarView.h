//
//  TabbarView.h
//  testUIWebCore
//
//  Created by Chan Ivan on 7/31/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabItemView.h"

@class TabItem;
@protocol TabbarViewDelegate;
@interface TabbarView : UIView

@property (nonatomic, assign) NSObject<TabbarViewDelegate> *delegate;

- (void)addNewTab:(TabItem *)tabItem animated:(BOOL)animated;
- (void)removeTabViewAtIndex:(NSInteger)index animated:(BOOL)animated;

- (void)updateActiveTabTitle:(NSString *)title withPageID:(NSInteger)pageID;

- (void)setTabbarHidden:(BOOL)isHidden animated:(BOOL)animated;

@end

@protocol TabbarViewDelegate <NSObject>

- (void)tabbarView:(TabbarView *)tabbarView didChangeTabWithTabID:(NSInteger)tabID;
- (void)tabbarView:(TabbarView *)tabbarView didCloseTabWithTabID:(NSInteger)tabID;

@end