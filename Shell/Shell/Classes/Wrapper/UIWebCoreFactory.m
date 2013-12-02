//
//  UIWebCoreFactory.m
//  UIWebCore
//
//  Created by Chan Ivan on 7/19/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "UIWebCoreFactory.h"
#import "UIWebViewEx.h"

@implementation UIWebCoreFactory

+ (UIWebViewEx *)createWebViewWithFrame:(CGRect)frame
{
    return [[UIWebViewEx alloc] initWithFrame:frame];
}

@end
