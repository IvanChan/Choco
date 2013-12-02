//
//  IWebViewDelegate.h
//  Shell
//
//  Created by Chan Ivan on 12/2/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIWebViewEx;
@protocol IWebViewDelegate <NSObject>

- (BOOL)webView:(UIWebViewEx *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;

- (void)webViewDidStartLoad:(UIWebViewEx *)webView;

- (void)webViewDidFinishLoad:(UIWebViewEx *)webView;

- (void)webView:(UIWebViewEx *)webView didFailLoadWithError:(NSError *)error;

- (void)webView:(UIWebViewEx *)webView loadingPercentageDidChange:(CGFloat)percentage;

@end
