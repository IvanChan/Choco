//
//  SegmentViewController.m
//  Shell
//
//  Created by Chan Ivan on 8/3/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "SegmentViewController.h"
#import "BookmarkController.h"
#import "HistoryController.h"

@interface SegmentViewController ()

@property (nonatomic, retain) UIView *titleBar;
@property (nonatomic, retain) UIView *segmentControl;
@property (nonatomic, retain) UIButton *leftButton;
@property (nonatomic, retain) UIButton *rightButton;
@property (nonatomic, retain) UIButton *doneButton;
@property (nonatomic, retain) UIView *contentView;

@property (nonatomic, retain) BookmarkController *bookmarkController;
@property (nonatomic, retain) HistoryController *historyController;

@end

@implementation SegmentViewController
@synthesize titleBar = _titleBar;
@synthesize segmentControl = _segmentControl;
@synthesize leftButton = _leftButton;
@synthesize rightButton = _rightButton;
@synthesize doneButton = _doneButton;
@synthesize contentView = _contentView;
@synthesize bookmarkController = _bookmarkController;
@synthesize historyController = _historyController;

#pragma mark - Init & Dealloc
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _titleBar = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                         0,
                                                         CGRectGetWidth(self.view.bounds),
                                                         40 + STATUS_BAR_HEIGHT)];
    _titleBar.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    _titleBar.backgroundColor = WHITE_COLOR;
    _titleBar.alpha = TOPBAR_BACKGROUND_VIEW_ALPHA;
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_titleBar.bounds) - 1, CGRectGetWidth(_titleBar.bounds), 1)];
    bottomLine.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    bottomLine.backgroundColor = GRAY_COLOR;
    [_titleBar addSubview:bottomLine];
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                         CGRectGetHeight(_titleBar.bounds),
                                                         CGRectGetWidth(self.view.bounds),
                                                         CGRectGetHeight(self.view.bounds) - CGRectGetHeight(_titleBar.bounds))];
    _contentView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_contentView];
    [self.view addSubview:_titleBar];
    
    _segmentControl = [[UIView alloc] initWithFrame:CGRectMake((int)(CGRectGetWidth(_titleBar.bounds) - 160)/2,
                                                               5 + STATUS_BAR_HEIGHT,
                                                               160,
                                                               30)];
    _segmentControl.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [_titleBar addSubview:_segmentControl];
    
    _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, CGRectGetHeight(_segmentControl.bounds))];
    [_leftButton setBackgroundImage:[[UIImage imageNamed:@"Segment_Left_Selected.png"] stretchableImageWithLeftCapWidth:30 topCapHeight:0]
                           forState:UIControlStateNormal];
    [_leftButton setTitle:@"Bookmark" forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_leftButton addTarget:self action:@selector(segmentCallback:) forControlEvents:UIControlEventTouchUpInside];
    [_segmentControl addSubview:_leftButton];
    
    _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_leftButton.frame), 0, 80, CGRectGetHeight(_segmentControl.bounds))];
    [_rightButton setBackgroundImage:[[UIImage imageNamed:@"Segment_Right_Normal.png"] stretchableImageWithLeftCapWidth:30 topCapHeight:0]
                            forState:UIControlStateNormal];
    [_rightButton setTitle:@"History" forState:UIControlStateNormal];
    [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_rightButton addTarget:self action:@selector(segmentCallback:) forControlEvents:UIControlEventTouchUpInside];
    [_segmentControl addSubview:_rightButton];
    
    _doneButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(_titleBar.bounds) - 60, STATUS_BAR_HEIGHT, 60, CGRectGetHeight(_titleBar.bounds) - STATUS_BAR_HEIGHT)];
    _doneButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
    [_doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [_doneButton setTitleColor:BLUE_COLOR forState:UIControlStateNormal];
    [_doneButton setTitleColor:GRAY_COLOR forState:UIControlStateHighlighted];
    [_doneButton addTarget:self action:@selector(doneButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_titleBar addSubview:_doneButton];
    [_doneButton release];
    
}

- (void)dealloc
{
    [_titleBar release];
    _titleBar = nil;
    
    [_segmentControl release];
    _segmentControl = nil;

    [_leftButton release];
    _leftButton = nil;
    
    [_rightButton release];
    _rightButton = nil;
    
    [_doneButton release];
    _doneButton = nil;
    
    [_contentView release];
    _contentView = nil;
    
    [_bookmarkController release];
    _bookmarkController = nil;
    
    [_historyController release];
    _historyController = nil;
    
    [super dealloc];
}

#pragma mark - Getters
- (BookmarkController *)bookmarkController
{
    if (_bookmarkController == nil)
    {
        _bookmarkController = [[BookmarkController alloc] init];
    }
    
    return _bookmarkController;
}

- (HistoryController *)historyController
{
    if (_historyController == nil)
    {
        _historyController = [[HistoryController alloc] init];
    }
    
    return _historyController;
}

#pragma mark - Segment
- (void)setSegmentIndex:(NSInteger)index
{
    if (index == 0)
    {
        [self.leftButton setBackgroundImage:[[UIImage imageNamed:@"Segment_Left_Selected.png"] stretchableImageWithLeftCapWidth:30 topCapHeight:0]
                                   forState:UIControlStateNormal];
        [self.rightButton setBackgroundImage:[[UIImage imageNamed:@"Segment_Right_Normal.png"] stretchableImageWithLeftCapWidth:30 topCapHeight:0]
                                    forState:UIControlStateNormal];
        
        [self.bookmarkController createViewWithFrameIfNeeded:self.contentView.bounds];
        [self.contentView addSubview:self.bookmarkController.view];
    }
    else
    {
        [self.leftButton setBackgroundImage:[[UIImage imageNamed:@"Segment_Left_Normal.png"] stretchableImageWithLeftCapWidth:30 topCapHeight:0]
                                   forState:UIControlStateNormal];
        [self.rightButton setBackgroundImage:[[UIImage imageNamed:@"Segment_Right_Selected.png"] stretchableImageWithLeftCapWidth:30 topCapHeight:0]
                                    forState:UIControlStateNormal];
        
        [self.historyController createViewWithFrameIfNeeded:self.contentView.bounds];
        [self.contentView addSubview:self.historyController.view];
    }
}

#pragma mark - Callbacks
- (void)segmentCallback:(UIButton *)sender
{
    NSInteger index = (sender == self.leftButton)? 0 : 1;
    
    [self setSegmentIndex:index];
}

- (void)doneButtonClicked:(id)sender
{
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         self.view.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         
                         [self.view removeFromSuperview];
                         
                         [self.historyController.view removeFromSuperview];
                         self.historyController = nil;
                         
                         [self.bookmarkController.view removeFromSuperview];
                         self.bookmarkController = nil;
                         
                     }];
}

@end
