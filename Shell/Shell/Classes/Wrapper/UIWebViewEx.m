//
//  UIWebViewEx.m
//  Shell
//
//  Created by Chan Ivan on 12/2/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "UIWebViewEx.h"
#import "ChocoCore.h"

//#define USING_UIWEBVIEW

@interface UIWebViewEx () <CCWebViewDelegate, UIWebViewDelegate>
{
#ifdef USING_UIWEBVIEW
    UIWebView *_webViewInternal;
#else
    CCWebView *_webViewInternal;
#endif
}

@end

@implementation UIWebViewEx
@synthesize delegate = _delegate;
@synthesize scrollView = _scrollView;
@synthesize request = _request;
@synthesize canGoBack = _canGoBack;
@synthesize canGoForward = _canGoForward;
@synthesize loading = _loading;
@synthesize active = _active;

#pragma mark - Init & Dealloc
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
       
#ifdef USING_UIWEBVIEW
        _webViewInternal = [[UIWebView alloc] initWithFrame:self.bounds];
#else
        _webViewInternal = [[CCWebView alloc] initWithFrame:self.bounds];
        
#endif
        _webViewInternal.delegate = self;
        _webViewInternal.scalesPageToFit = YES;
        [self addSubview:_webViewInternal];
    }
    return self;
}

- (void)dealloc
{
    _webViewInternal.delegate = nil;
    [_webViewInternal release];
    _webViewInternal = nil;
    
    [super dealloc];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    if ([self isActive])
    {
        [_webViewInternal setFrame:self.bounds];
    }
}

- (void)setActive:(BOOL)active
{
    if (_active != active)
    {
        _active = active;
        
        if (_active)
        {
            if (abs(CGRectGetWidth(self.bounds) - CGRectGetWidth(_webViewInternal.frame)) > 10)
            {
                _webViewInternal.frame = self.bounds;
            }
        }
    }
}

#pragma mark -
- (void)loadURL:(NSURL *)URL
{
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [_webViewInternal loadRequest:request];
}

- (void)loadRequest:(NSURLRequest *)request
{
    [_webViewInternal loadRequest:request];
}

- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL
{
    [_webViewInternal loadHTMLString:string baseURL:baseURL];
}

- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName baseURL:(NSURL *)baseURL
{
    [_webViewInternal loadData:data MIMEType:MIMEType textEncodingName:textEncodingName baseURL:baseURL];
}

- (void)reload
{
    [_webViewInternal reload];
}

- (void)stopLoading
{
    [_webViewInternal stopLoading];
}

- (BOOL)canGoBack
{
    return [_webViewInternal canGoBack];
}

- (void)goBack
{
    [_webViewInternal goBack];
}

- (void)goForward
{
    [_webViewInternal goForward];
}

- (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script
{
    return [_webViewInternal stringByEvaluatingJavaScriptFromString:script];
}

- (void)setScalesPageToFit:(BOOL)scalesPageToFit
{
    [_webViewInternal setScalesPageToFit:scalesPageToFit];
}

- (BOOL)scalesPageToFit
{
    return [_webViewInternal scalesPageToFit];
}

- (void)setUserAgent:(NSString *)userAgent
{
#ifndef USING_UIWEBVIEW
    [_webViewInternal setCustomUserAgent:userAgent];
#endif
}

- (NSString *)userAgent
{
#ifndef USING_UIWEBVIEW
    return [_webViewInternal customUserAgent];
#else
    return nil;
#endif
}

- (NSString *)URL
{
    return [[[_webViewInternal request] URL] absoluteString];
}

- (NSString *)title
{
    return nil;
}

#pragma mark - Delegate
- (BOOL)webView:(CCWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    BOOL result = YES;
    if ([self.delegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)])
    {
        result = [self.delegate webView:self shouldStartLoadWithRequest:request navigationType:navigationType];
    }
    
    return result;
}

- (void)webViewDidStartLoad:(CCWebView *)webView
{
    if ([self.delegate respondsToSelector:@selector(webViewDidStartLoad:)])
    {
        [self.delegate webViewDidStartLoad:self];
    }
}
    
- (void)webViewDidFinishLoad:(CCWebView *)webView
{
    if ([self.delegate respondsToSelector:@selector(webViewDidFinishLoad:)])
    {
        [self.delegate webViewDidFinishLoad:self];
    }
}

- (void)webView:(CCWebView *)webView didFailLoadWithError:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(webView:didFailLoadWithError:)])
    {
        [self.delegate webView:self didFailLoadWithError:error];
    }
}

- (void)webView:(UIWebViewEx *)webView loadingPercentageDidChange:(CGFloat)percentage
{
    if ([self.delegate respondsToSelector:@selector(webView:loadingPercentageDidChange:)])
    {
        [self.delegate webView:self loadingPercentageDidChange:percentage];
    }
}

@end
