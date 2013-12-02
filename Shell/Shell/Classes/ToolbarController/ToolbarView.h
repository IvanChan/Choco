//
//  TopbarView.h
//  testUIWebCore
//
//  Created by Chan Ivan on 7/22/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ToolbarView;
@protocol ToolbarViewDelegate <NSObject>

- (void)toolbarView:(ToolbarView *)toolbarView didClickBackward:(id)sender;
- (void)toolbarView:(ToolbarView *)toolbarView didClickForward:(id)sender;
- (void)toolbarView:(ToolbarView *)toolbarView didClickBookmark:(id)sender;
- (void)toolbarView:(ToolbarView *)toolbarView didClickDownload:(id)sender;
- (void)toolbarView:(ToolbarView *)toolbarView didClickTabs:(id)sender;

@end

@interface ToolbarView : UIView

@property (nonatomic, assign) NSObject<ToolbarViewDelegate> *delegate;

- (void)setToolbarHidden:(BOOL)isHidden animated:(BOOL)animated;
- (BOOL)isToolbarHidden;

- (void)updateBackwardState:(BOOL)canBackward forwardState:(BOOL)canForward;

@end
