//
//  UIWebCoreFactory.h
//  UIWebCore
//
//  Created by Chan Ivan on 7/19/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIWebViewEx;
@interface UIWebCoreFactory : NSObject

+ (UIWebViewEx *)createWebViewWithFrame:(CGRect)frame;

@end
