//
//  Progressbar.m
//  testUIWebCore
//
//  Created by Chan Ivan on 7/30/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "Progressbar.h"
#import "GlobalDef.h"

@interface Progressbar ()

@property (nonatomic, retain) UIView *progressView;
@property (nonatomic, assign, getter = isAnimating) BOOL animating;

@end

@implementation Progressbar
@synthesize percentage = _percentage;
@synthesize progressView = _progressView;
@synthesize animating = _animating;

#pragma mark - Init & Dealloc
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor clearColor];
        
        _progressView = [[UIView alloc] initWithFrame:self.bounds];
        _progressView.backgroundColor = BLUE_COLOR;
        [self addSubview:_progressView];
        
        self.percentage = 0;
    }
    return self;
}

- (void)dealloc
{
    [_progressView release];
    _progressView = nil;
    [super dealloc];
}

#pragma mark - Percent
- (void)progressAnimationDidStop
{
    self.animating = NO;
    if (self.percentage >= 1)
    {
        self.percentage = 0;
        [self updateProgressWithAnimated:NO];
    }
}

#define kAnimatinDuration 0.2
- (void)updateProgressWithAnimated:(BOOL)animated
{
    if (animated)
    {
        self.animating = YES;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(progressAnimationDidStop)];
        [UIView setAnimationDuration:kAnimatinDuration];
    }
    
    CGRect rect = self.progressView.frame;
    rect.size.width = self.percentage * CGRectGetWidth(self.bounds);
    self.progressView.frame = rect;
    
    if (animated)
    {
        [UIView commitAnimations];
    }
}

- (void)setPercentage:(CGFloat)percentage
{
    if (percentage >= 1 && _percentage <= 0)
    {
        return;
    }
    
    _percentage = percentage < 0? 0 : percentage;
    _percentage = percentage >= 1 ? 1: percentage;

    CGFloat delay = kAnimatinDuration;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
                   {
                       [self updateProgressWithAnimated:YES];
                   });
}

@end
