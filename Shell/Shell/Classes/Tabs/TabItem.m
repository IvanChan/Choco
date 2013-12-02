//
//  TabItem.m
//  testUIWebCore
//
//  Created by Chan Ivan on 7/30/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "TabItem.h"

@interface TabItem ()

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *URL;
@property (nonatomic, assign) NSInteger tabID;

@end

@implementation TabItem
@synthesize title = _title;
@synthesize URL = _URL;
@synthesize tabID = _tabID;

#pragma mark - Init & Dealloc
- (id)initWithTitle:(NSString *)title URL:(NSString *)URL id:(NSInteger)tabID
{
    if (self = [super init])
    {
        self.tabID = tabID;
        self.title = (title && [title length] > 0) ? title : @"about:blank";
        self.URL = URL ? URL : @"about:blank";
    }
    
    return self;
}

- (void)dealloc
{
    [_title release];
    _title = nil;
    
    [_URL release];
    _URL = nil;
    
    [super dealloc];
}

@end
