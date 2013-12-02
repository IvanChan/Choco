//
//  TopbarView.m
//  testUIWebCore
//
//  Created by Chan Ivan on 7/22/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "ToolbarView.h"
#import "GlobalDef.h"

@interface ToolbarView ()

@property (nonatomic, assign, getter = isAnimating) BOOL animating;
@property (nonatomic, assign, getter = isToolbarHidden) BOOL toolbarHidden;

@property (nonatomic, retain) UIButton *backwardButton;
@property (nonatomic, retain) UIButton *forwardButton;
@property (nonatomic, retain) UIButton *bookmarkButton;
@property (nonatomic, retain) UIButton *downloadButton;
@property (nonatomic, retain) UIButton *tabsButton;

@end

@implementation ToolbarView
@synthesize animating = _animating;
@synthesize toolbarHidden = _toolbarHidden;
@synthesize backwardButton = _backwardButton;
@synthesize forwardButton = _forwardButton;
@synthesize bookmarkButton = _bookmarkButton;
@synthesize downloadButton = _downloadButton;
@synthesize tabsButton = _tabsButton;

#pragma mark - Init & Dealloc
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        self.backgroundColor = [UIColor clearColor];
        
        UIView *background = [[UIView alloc] initWithFrame:self.bounds];
        background.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        background.backgroundColor = WHITE_COLOR;
        background.alpha = TOPBAR_BACKGROUND_VIEW_ALPHA;
        [self addSubview:background];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 1)];
        bottomLine.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        bottomLine.backgroundColor = GRAY_COLOR;
        [self addSubview:bottomLine];
        
        CGFloat buttonWitdh = CGRectGetWidth(self.bounds)/5;
        _backwardButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonWitdh, CGRectGetHeight(self.bounds))];
        _backwardButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [_backwardButton setImage:[UIImage imageNamed:@"Backward.png"] forState:UIControlStateNormal];
        [_backwardButton setImage:[UIImage imageNamed:@"Backward_disabled.png"] forState:UIControlStateDisabled];
        [_backwardButton addTarget:self action:@selector(toolButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_backwardButton];
        _backwardButton.enabled = NO;
        
        _forwardButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonWitdh, 0, buttonWitdh, CGRectGetHeight(self.bounds))];
        _forwardButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [_forwardButton setImage:[UIImage imageNamed:@"Forward.png"] forState:UIControlStateNormal];
        [_forwardButton setImage:[UIImage imageNamed:@"Forward_disabled.png"] forState:UIControlStateDisabled];
        [_forwardButton addTarget:self action:@selector(toolButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_forwardButton];
        _forwardButton.enabled = NO;
        
        _bookmarkButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonWitdh*2, 0, buttonWitdh, CGRectGetHeight(self.bounds))];
        _bookmarkButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [_bookmarkButton setImage:[UIImage imageNamed:@"Bookmark.png"] forState:UIControlStateNormal];
        [_bookmarkButton addTarget:self action:@selector(toolButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_bookmarkButton];
        
        _downloadButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonWitdh*3, 0, buttonWitdh, CGRectGetHeight(self.bounds))];
        _downloadButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [_downloadButton setImage:[UIImage imageNamed:@"Download.png"] forState:UIControlStateNormal];
        [_downloadButton addTarget:self action:@selector(toolButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_downloadButton];
        
        _tabsButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonWitdh*4, 0, buttonWitdh, CGRectGetHeight(self.bounds))];
        _tabsButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [_tabsButton setImage:[UIImage imageNamed:@"Tabs.png"] forState:UIControlStateNormal];
        [_tabsButton addTarget:self action:@selector(toolButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_tabsButton];
    }
    return self;
}

- (void)dealloc
{
    _delegate = nil;
    
    [_backwardButton release];
    _backwardButton = nil;
    
    [_forwardButton release];
    _forwardButton = nil;
    
    [_bookmarkButton release];
    _bookmarkButton = nil;
    
    [_downloadButton release];
    _downloadButton = nil;
    
    [_tabsButton release];
    _tabsButton = nil;
    
    [super dealloc];
}

#pragma mark - animation
- (void)toolbarAnimationDidStop
{
    self.animating = NO;
}

- (void)setToolbarHidden:(BOOL)isHidden animated:(BOOL)animated
{
    if (self.isAnimating || isHidden == self.isToolbarHidden)
    {
        return;
    }
    
    self.animating = YES;
    self.toolbarHidden = isHidden;
    
    if (animated)
    {
        [UIView beginAnimations:@"ToolbarAnimation" context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(toolbarAnimationDidStop)];
    }
    
    CGRect frame = self.frame;
    if (isHidden)
    {
        frame.origin.y += CGRectGetHeight(self.bounds);
    }
    else
    {
        frame.origin.y -= CGRectGetHeight(self.bounds);
    }
    
    self.frame = frame;
    
    if (animated)
    {
        [UIView commitAnimations];
    }
}

#pragma mark - Update State
- (void)updateBackwardState:(BOOL)canBackward forwardState:(BOOL)canForward
{
    self.backwardButton.enabled = canBackward;
    self.forwardButton.enabled = canForward;
}

#pragma mark - Callbacks
- (void)toolButtonClicked:(id)sender
{
    if (sender == self.backwardButton)
    {
        if ([self.delegate respondsToSelector:@selector(toolbarView:didClickBackward:)])
        {
            [self.delegate toolbarView:self didClickBackward:sender];
        }
    }
    else if (sender == self.forwardButton)
    {
        if ([self.delegate respondsToSelector:@selector(toolbarView:didClickForward:)])
        {
            [self.delegate toolbarView:self didClickForward:sender];
        }
    }
    else if (sender == self.bookmarkButton)
    {
        if ([self.delegate respondsToSelector:@selector(toolbarView:didClickBookmark:)])
        {
            [self.delegate toolbarView:self didClickBookmark:sender];
        }
    }
    else if (sender == self.downloadButton)
    {
        if ([self.delegate respondsToSelector:@selector(toolbarView:didClickDownload:)])
        {
            [self.delegate toolbarView:self didClickDownload:sender];
        }
    }
    else if (sender == self.tabsButton)
    {
        if ([self.delegate respondsToSelector:@selector(toolbarView:didClickTabs:)])
        {
            [self.delegate toolbarView:self didClickTabs:sender];
        }
    }
}

@end
