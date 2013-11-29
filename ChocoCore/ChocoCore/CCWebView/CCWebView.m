//
//  CCWebView.m
//  ChocoCore
//
//  Created by Chan Ivan on 11/29/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "CCWebView.h"
#import <objc/message.h>
#import "CCWebDocumentView.h"
#import "CCWebScrollView.h"

@interface CCWebView ()
{
    CCWebDocumentView   *_webDocumentView;
    CCWebScrollView     *_webScrollView;
}

@end

@implementation CCWebView

#pragma mark - Init & Dealloc
- (id)init
{
    self = [super init];
    if (self)
    {
        [self setup];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (BOOL)setup
{
    self.backgroundColor = [UIColor whiteColor];
    
    _webScrollView = [[CCWebScrollView alloc] initWithFrame:self.bounds];
    _webScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:_webScrollView];
    
    Class cls = NSClassFromString(@"UIWebDocumentView");
    _webDocumentView = [[cls alloc] initWithFrame:_webScrollView.bounds];
    _webDocumentView.autoresizingMask = UIViewAutoresizingNone;
    _webDocumentView.delegate = self;
    [_webScrollView addSubview:_webDocumentView];
    
    //FIXME: dont bind scrollView & documentView directly
    [_webDocumentView addObserver:_webScrollView
                       forKeyPath:@"frame" options:NSKeyValueObservingOptionNew
                          context:nil];
    
    return (_webScrollView && _webDocumentView);
}

- (void)dealloc
{
    [_webDocumentView removeObserver:_webScrollView forKeyPath:@"frame"];
    _webDocumentView.delegate = nil;
    [_webDocumentView release];
    _webDocumentView = nil;
    
    [_webScrollView release];
    _webScrollView = nil;
    
    [super dealloc];
}

#pragma mark - Getters
-(UIView *)documentView
{
    return _webDocumentView;
}

- (UIScrollView *)scrollView
{
    return _webScrollView;
}

- (NSURLRequest *)request
{
    return [[[[_webDocumentView webView] mainFrame] dataSource] request];
}

- (BOOL)scalesPageToFit
{
    return NO;
}

- (UIDataDetectorTypes)dataDetectorTypes
{
    return [_webDocumentView dataDetectorTypes];
}

- (BOOL)allowsInlineMediaPlayback
{
    return [_webDocumentView allowsInlineMediaPlayback];
}

- (BOOL)mediaPlaybackRequiresUserAction
{
    return [_webDocumentView mediaPlaybackRequiresUserAction];
}

- (BOOL)mediaPlaybackAllowsAirPlay
{
    return [_webDocumentView mediaPlaybackAllowsAirPlay];
}

- (BOOL)suppressesIncrementalRendering
{
    return [_webDocumentView suppressesIncrementalRendering];
}

- (BOOL)keyboardDisplayRequiresUserAction
{
    return YES;
}

- (UIWebPaginationMode)paginationMode
{
    return UIWebPaginationModeUnpaginated;
}

- (UIWebPaginationBreakingMode)paginationBreakingMode
{
    return UIWebPaginationBreakingModePage;
}

- (CGFloat)pageLength
{
    return 0;
}

- (CGFloat)gapBetweenPages
{
    return 0;
}

- (NSUInteger)pageCount
{
    return 0;
}

#pragma mark - Setters
- (void)setScalesPageToFit:(BOOL)scalesPageToFit
{}

- (void)setDataDetectorTypes:(UIDataDetectorTypes)dataDetectorTypes
{
    [_webDocumentView setDataDetectorTypes:dataDetectorTypes];
}

- (void)setAllowsInlineMediaPlayback:(BOOL)allowsInlineMediaPlayback
{
    [_webDocumentView setAllowsInlineMediaPlayback:allowsInlineMediaPlayback];
}

- (void)setMediaPlaybackRequiresUserAction:(BOOL)mediaPlaybackRequiresUserAction
{
    [_webDocumentView setMediaPlaybackRequiresUserAction:mediaPlaybackRequiresUserAction];
}

- (void)setMediaPlaybackAllowsAirPlay:(BOOL)mediaPlaybackAllowsAirPlay
{
    [_webDocumentView setMediaPlaybackAllowsAirPlay:mediaPlaybackAllowsAirPlay];
}

- (void)setSuppressesIncrementalRendering:(BOOL)suppressesIncrementalRendering
{
    [_webDocumentView setSuppressesIncrementalRendering:suppressesIncrementalRendering];
}

- (void)setKeyboardDisplayRequiresUserAction:(BOOL)keyboardDisplayRequiresUserAction
{

}

- (void)setPaginationMode:(UIWebPaginationMode)paginationMode
{}

- (void)setPaginationBreakingMode:(UIWebPaginationBreakingMode)paginationBreakingMode
{}

- (void)setPageLength:(CGFloat)pageLength
{}

- (void)setGapBetweenPages:(CGFloat)gapBetweenPages
{}

#pragma mark - Load Methods
- (void)loadRequest:(NSURLRequest *)request
{
    [_webDocumentView loadRequest:request];
}

- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL
{
    [_webDocumentView loadHTMLString:string baseURL:baseURL];
}

- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName baseURL:(NSURL *)baseURL
{
    [_webDocumentView loadData:data MIMEType:MIMEType textEncodingName:textEncodingName baseURL:baseURL];
}

#pragma mark - State
- (void)reload
{
    [[[_webDocumentView webView] mainFrame] reload];
}

- (void)stopLoading
{
    [[[_webDocumentView webView] mainFrame] stopLoading];
}

- (BOOL)canGoBack
{
    return [[_webDocumentView webView] canGoBack];
}

- (void)goBack
{
    [[_webDocumentView webView] goBack];
}

-(BOOL)canGoForward
{
    return [[_webDocumentView webView] canGoForward];
}

- (void)goForward
{
    [[_webDocumentView webView] goForward];
}

#pragma mark - Javascript
- (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script
{
    return [[_webDocumentView webView] stringByEvaluatingJavaScriptFromString:script];
}

@end
