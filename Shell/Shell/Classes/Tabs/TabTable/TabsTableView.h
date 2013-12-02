//
//  TabsTableView.h
//  testUIWebCore
//
//  Created by Chan Ivan on 7/30/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabsTableViewDelegate;
@interface TabsTableView : UIView

@property (nonatomic, assign) NSObject<TabsTableViewDelegate> *delegate;

- (id)initWithFrame:(CGRect)frame tabList:(NSArray *)tabList;

@end

@protocol TabsTableViewDelegate <NSObject>

- (void)tabsTableView:(TabsTableView *)tabsTableView didSelectTabWithID:(NSInteger)pageID;
- (void)tabsTableView:(TabsTableView *)tabsTableView didRemoveTabWithID:(NSInteger)pageID;
- (void)tabsTableViewDidAddNewTab:(TabsTableView *)tabsTableView;
- (void)tabsTableViewDidExit:(TabsTableView *)tabsTableView;

@end