//
//  DefaultDelegate.m
//  ChocoCore
//
//  Created by Chan Ivan on 12/2/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "DefaultDelegate.h"

@implementation DefaultDelegate

- (id)initWithCCWebView:(id)ccWebView
{
    if (self = [super init])
    {
        _ccWebView = ccWebView;
    }
    
    return self;
}

-(void)dealloc
{
    _ccWebView = nil;
    [super dealloc];
}

@end
