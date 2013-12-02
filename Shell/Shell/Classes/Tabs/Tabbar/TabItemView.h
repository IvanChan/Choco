//
//  TabItemView.h
//  testUIWebCore
//
//  Created by Chan Ivan on 7/31/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabItemViewDelegate;
@interface TabItemView : UIControl

@property (nonatomic, assign) NSObject<TabItemViewDelegate> *delegate;
@property (nonatomic, assign, getter = isActive) BOOL active;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, assign) NSInteger tabID;

@end

@protocol TabItemViewDelegate <NSObject>

- (void)tabItemView:(TabItemView *)tabItemView didCloseTabWithID:(NSInteger)pageID;

@end