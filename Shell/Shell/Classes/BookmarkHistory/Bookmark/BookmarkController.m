//
//  BookmarkController.m
//  Shell
//
//  Created by Chan Ivan on 8/3/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "BookmarkController.h"
#import "BookmarkView.h"

@interface BookmarkController () <BookmarkViewDelegate>

@property (nonatomic, retain) BookmarkView *mainView;

@end

@implementation BookmarkController
@synthesize mainView = _mainView;

#pragma mark - Init & Dealloc
- (id)init
{
    if (self = [super init])
    {
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    _mainView.delegate = nil;
    [_mainView release];
    _mainView = nil;
    
    [super dealloc];
}

#pragma mark - View
- (UIView *)view
{
    return self.mainView;
}

- (void)createViewWithFrameIfNeeded:(CGRect)frame
{
    if (self.mainView)
    {
        return;
    }
    
    self.mainView = [[BookmarkView alloc] initWithFrame:frame];
    self.mainView.delegate = self;
}

@end
