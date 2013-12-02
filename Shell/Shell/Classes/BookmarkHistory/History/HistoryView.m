//
//  HistoryView.m
//  Shell
//
//  Created by Chan Ivan on 8/3/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "HistoryView.h"

@implementation HistoryView
@synthesize delegate = _delegate;

#pragma mark - Init & Dealloc
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return self;
}

- (void)dealloc
{
    _delegate = nil;
    
    [super dealloc];
}

@end
