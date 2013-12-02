//
//  UIWebCore.h
//  UIWebCore
//
//  Created by Chan Ivan on 7/19/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "IWebViewDelegate.h"

@protocol IWebView <NSObject>

@property (nonatomic,assign) id<IWebViewDelegate> delegate;

@property (nonatomic,readonly,retain) UIScrollView *scrollView NS_AVAILABLE_IOS(5_0);

- (void)loadURL:(NSURL *)URL;
- (void)loadRequest:(NSURLRequest *)request;
- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL;
- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName baseURL:(NSURL *)baseURL;

@property (nonatomic,readonly,retain) NSURLRequest *request;

- (void)reload;
- (void)stopLoading;

- (void)goBack;
- (void)goForward;

@property (nonatomic,readonly,getter=canGoBack) BOOL canGoBack;
@property (nonatomic,readonly,getter=canGoForward) BOOL canGoForward;
@property (nonatomic,readonly,getter=isLoading) BOOL loading;

- (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script;

@property (nonatomic) BOOL scalesPageToFit;

@property (nonatomic ,retain) NSString *userAgent;
- (NSString *)URL;
- (NSString *)title;
@property (nonatomic, getter = isActive) BOOL active;

@end
