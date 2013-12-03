//
//  CCWebViewWebViewDelegate.h
//  ChocoCore
//
//  Created by Chan Ivan on 12/3/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCWebView;
@interface CCWebViewWebViewDelegate : NSObject
{
    @private
    CCWebView *_ccWebView;
}

- (id)initWithCCWebView:(id)ccWebView;

@end
