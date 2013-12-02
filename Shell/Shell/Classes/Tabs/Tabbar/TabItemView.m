//
//  TabItemView.m
//  testUIWebCore
//
//  Created by Chan Ivan on 7/31/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "TabItemView.h"
#import "GlobalDef.h"

@interface TabItemView ()

@property (nonatomic, retain) UIView    *backgroundView;
@property (nonatomic, retain) UIView    *rightBorder;
@property (nonatomic, retain) UIView    *topBorder;
@property (nonatomic, retain) UILabel   *titleLabel;
@property (nonatomic, retain) UIButton  *closeButton;

@end

@implementation TabItemView
@synthesize delegate = _delegate;
@synthesize active = _active;
@synthesize title = _title;
@synthesize tabID = _tabID;
@synthesize backgroundView = _backgroundView;
@synthesize rightBorder = _rightBorder;
@synthesize topBorder = _topBorder;
@synthesize titleLabel = _titleLabel;
@synthesize closeButton = _closeButton;

#pragma mark - Init & Dealloc
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
        
        _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        _backgroundView.userInteractionEnabled = NO;
        _backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _backgroundView.backgroundColor = WHITE_COLOR;
        _backgroundView.alpha = TOPBAR_BACKGROUND_VIEW_ALPHA;
        [self addSubview:_backgroundView];

        _rightBorder = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds) - 1, 0, 1, CGRectGetHeight(self.bounds))];
        _rightBorder.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        _rightBorder.backgroundColor = GRAY_COLOR;
        _rightBorder.alpha = 0.95;
        [self addSubview:_rightBorder];

        _topBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 1)];
        _topBorder.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        _topBorder.backgroundColor = GRAY_COLOR;
        _topBorder.alpha = 0.95;
        [self addSubview:_topBorder];
        
        UIView *bottomBorder = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.bounds) - 1, CGRectGetWidth(self.bounds), 1)];
        bottomBorder.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
        bottomBorder.backgroundColor = GRAY_COLOR;
        bottomBorder.alpha = 0.95;
        [self addSubview:bottomBorder];

        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.userInteractionEnabled = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _titleLabel.text = @"about:blank";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];

        _closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, CGRectGetHeight(self.bounds), CGRectGetHeight(self.bounds))];
        _closeButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
        [_closeButton setImage:[UIImage imageNamed:@"Close.png"] forState:UIControlStateNormal];
        [_closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(didClickOnCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_closeButton];
        
        self.active = NO;
    }
    return self;
}

- (void)dealloc
{
    _delegate = nil;
    
    [_backgroundView release];
    _backgroundView = nil;
    
    [_rightBorder release];
    _rightBorder = nil;
    
    [_topBorder release];
    _topBorder = nil;

    [_titleLabel release];
    _titleLabel = nil;

    [_closeButton release];
    _closeButton = nil;
    
    [super dealloc];
}

#pragma mark - Public Methods
- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

- (NSString *)title
{
    return self.titleLabel.text;
}

- (void)setActive:(BOOL)active
{
    _active = active;
    
    self.titleLabel.textColor = _active ? [UIColor blackColor]: [UIColor lightGrayColor];
    self.topBorder.hidden = _active;
    self.backgroundView.backgroundColor = _active ? WHITE_COLOR : GRAY_COLOR;
    self.closeButton.hidden = !_active;
}

#pragma mark - Callbacks
- (void)didClickOnCloseButton:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(tabItemView:didCloseTabWithID:)])
    {
        [self.delegate tabItemView:self didCloseTabWithID:self.tabID];
    }
}

@end
