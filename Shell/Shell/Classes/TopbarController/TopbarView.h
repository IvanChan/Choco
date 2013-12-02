//
//  TopbarView.h
//  testUIWebCore
//
//  Created by Chan Ivan on 7/22/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalDef.h"

@class TopbarView;
@protocol TopbarViewDelegate <NSObject>

- (void)topbarView:(TopbarView *)topbarView didClickGoToWithText:(NSString *)text;
- (void)topbarView:(TopbarView *)topbarView didClickRefreshStop:(id)sender;
- (void)topbarView:(TopbarView *)topbarView didClickAdd:(id)sender;
- (void)topbarView:(TopbarView *)topbarView didClickBackward:(id)sender;
- (void)topbarView:(TopbarView *)topbarView didClickForward:(id)sender;

@end

@interface TopbarView : UIView

@property (nonatomic, assign) NSObject<TopbarViewDelegate> *delegate;

- (TopbarState)state;
- (void)changeToState:(TopbarState)state animated:(BOOL)animated;

- (void)setTopbarTitle:(NSString *)title URL:(NSString *)URL;

- (void)setLoadingState:(BOOL)isLoading;

- (void)setProgressPercentage:(CGFloat)percentage;

- (void)updateBackwardState:(BOOL)canBackward forwardState:(BOOL)canForward;

@end
