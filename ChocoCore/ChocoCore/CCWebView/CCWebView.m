//
//  CCWebView.m
//  ChocoCore
//
//  Created by Chan Ivan on 11/29/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "CCWebView.h"
#import <objc/message.h>
#import "CCWebBrowserView.h"
#import "CCWebScrollView.h"
#import "DefaultDelegateDefine.h"
#import "CCWebViewWebViewDelegate.h"

#define UIWEBVIEW_LIKE

@class WebFrameView;
@interface CCWebView ()
{
    CCWebBrowserView    *_webBrowserView;
    CCWebScrollView     *_webScrollView;
}

@property (nonatomic, retain) DefaultPolicyDelegate         *policyDelegateHandler;
@property (nonatomic, retain) DefaultFrameLoadDelegate      *frameLoadDelegateHandler;
@property (nonatomic, retain) DefaultResourceLoadDelegate   *resourceLoadDelegateHandler;
@property (nonatomic, retain) DefaultUIDelegate             *UIDelegateHandler;

@property (nonatomic, retain) CCWebViewWebViewDelegate      *webViewDelegate;

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
    self.backgroundColor = [UIColor orangeColor];
    
    _webScrollView = [[CCWebScrollView alloc] initWithFrame:self.bounds];
    _webScrollView.backgroundColor = [UIColor purpleColor];
    _webScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:_webScrollView];
    
    Class cls = NSClassFromString(@"UIWebBrowserView");
    _webBrowserView = [[cls alloc] initWithFrame:_webScrollView.bounds];
    _webBrowserView.autoresizingMask = UIViewAutoresizingNone;
    _webBrowserView.delegate = self;
    //FIXME: according to UIWebView, should set this
    //_webDocumentView._editingDelegate = self;
    [_webScrollView addSubview:_webBrowserView];

#ifdef UIWEBVIEW_LIKE
    _webViewDelegate = [[CCWebViewWebViewDelegate alloc] initWithCCWebView:self];
    [[self webView] setUIDelegate:_webViewDelegate];
    [[self webView] setFrameLoadDelegate:_webViewDelegate];
    [[self webView] setResourceLoadDelegate:_webViewDelegate];
    [[self webView] setPolicyDelegate:_webViewDelegate];
    
#else
    _UIDelegateHandler = [[DefaultUIDelegate alloc] initWithCCWebView:self];
    [[self webView] setUIDelegate:self.UIDelegateHandler];
    
    _frameLoadDelegateHandler = [[DefaultFrameLoadDelegate alloc] initWithCCWebView:self];
    [[self webView] setFrameLoadDelegate:self.frameLoadDelegateHandler];
    
    _resourceLoadDelegateHandler = [[DefaultResourceLoadDelegate alloc] initWithCCWebView:self];
    [[self webView] setResourceLoadDelegate:self.resourceLoadDelegateHandler];
    
     _policyDelegateHandler = [[DefaultPolicyDelegate alloc] initWithCCWebView:self];
    [[self webView] setPolicyDelegate:self.policyDelegateHandler];
#endif
    //TODO:
    //[[self webView] setDownloadDelegate:self];
    //[[self webView] setHistoryDelegate:self];
    
    [self enableProgressChangeNotification:YES];
    
    return (_webScrollView && _webBrowserView);
}

- (void)dealloc
{
    [[self webView] _clearDelegates];
    
    [_policyDelegateHandler release];
    _policyDelegateHandler = nil;
    
    [_frameLoadDelegateHandler release];
    _frameLoadDelegateHandler = nil;
    
    [_resourceLoadDelegateHandler release];
    _resourceLoadDelegateHandler = nil;
    
    [_UIDelegateHandler release];
    _UIDelegateHandler = nil;
    
    _webBrowserView.delegate = nil;
    [_webBrowserView release];
    _webBrowserView = nil;
    
    [_webScrollView release];
    _webScrollView = nil;
    
    [super dealloc];
}

#pragma mark - Getters
- (CCWebBrowserView *)browserView
{
    return _webBrowserView;
}

- (CCWebBrowserView *)documentView
{
    return _webBrowserView;
}

- (UIScrollView *)scrollView
{
    return _webScrollView;
}

- (WebView *)webView
{
    return [self.browserView webView];
}

- (NSURLRequest *)request
{
    return [[[[self webView] mainFrame] dataSource] request];
}

- (BOOL)scalesPageToFit
{
    return NO;
}

- (UIDataDetectorTypes)dataDetectorTypes
{
    return [self.browserView dataDetectorTypes];
}

- (BOOL)allowsInlineMediaPlayback
{
    return [self.browserView  allowsInlineMediaPlayback];
}

- (BOOL)mediaPlaybackRequiresUserAction
{
    return [self.browserView  mediaPlaybackRequiresUserAction];
}

- (BOOL)mediaPlaybackAllowsAirPlay
{
    return [self.browserView  mediaPlaybackAllowsAirPlay];
}

- (BOOL)suppressesIncrementalRendering
{
    return [self.browserView  suppressesIncrementalRendering];
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

-(NSString *)customUserAgent
{
    return [[self webView] customUserAgent];
}

#pragma mark - Setters
- (void)setScalesPageToFit:(BOOL)scalesPageToFit
{}

- (void)setDataDetectorTypes:(UIDataDetectorTypes)dataDetectorTypes
{
    [self.browserView  setDataDetectorTypes:dataDetectorTypes];
}

- (void)setAllowsInlineMediaPlayback:(BOOL)allowsInlineMediaPlayback
{
    [self.browserView  setAllowsInlineMediaPlayback:allowsInlineMediaPlayback];
}

- (void)setMediaPlaybackRequiresUserAction:(BOOL)mediaPlaybackRequiresUserAction
{
    [self.browserView  setMediaPlaybackRequiresUserAction:mediaPlaybackRequiresUserAction];
}

- (void)setMediaPlaybackAllowsAirPlay:(BOOL)mediaPlaybackAllowsAirPlay
{
    [self.browserView  setMediaPlaybackAllowsAirPlay:mediaPlaybackAllowsAirPlay];
}

- (void)setSuppressesIncrementalRendering:(BOOL)suppressesIncrementalRendering
{
    [self.browserView  setSuppressesIncrementalRendering:suppressesIncrementalRendering];
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

-(void)setCustomUserAgent:(NSString *)customUserAgent
{
    [[self webView] setCustomUserAgent:customUserAgent];
}

- (void)enableProgressChangeNotification:(BOOL)enable
{
    id coreWebView = [self webView];
	if(enable)
	{
		//监视进度
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(webViewProgressStepChange:)
													 name:@"WebProgressEstimateChangedNotification"
                                                   object:coreWebView];
	}
	else
	{
		[[NSNotificationCenter defaultCenter] removeObserver:self name:@"WebProgressEstimateChangedNotification" object:coreWebView];
	}
}

#pragma mark - Load Methods
- (void)loadRequest:(NSURLRequest *)request
{
    [self.browserView  loadRequest:request];
}

- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL
{
    [self.browserView  loadHTMLString:string baseURL:baseURL];
}

- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName baseURL:(NSURL *)baseURL
{
    [self.browserView  loadData:data MIMEType:MIMEType textEncodingName:textEncodingName baseURL:baseURL];
}

#pragma mark - State
- (void)reload
{
    [[[self webView] mainFrame] reload];
}

- (void)stopLoading
{
    [[[self webView] mainFrame] stopLoading];
}

- (BOOL)canGoBack
{
    return [[self webView] canGoBack];
}

- (void)goBack
{
    [[self webView] goBack];
}

-(BOOL)canGoForward
{
    return [[self webView] canGoForward];
}

- (void)goForward
{
    [[self webView] goForward];
}

#pragma mark - Javascript
- (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script
{
    return [[self webView] stringByEvaluatingJavaScriptFromString:script];
}

#pragma mark - BrowserView Delegate

/**
 *
 *
 *  @param webView
 */
- (void)webViewMainFrameDidFirstVisuallyNonEmptyLayoutInFrame:(CCWebBrowserView *)browserView
{}

/**
 *  Called after decidePolicyWithMIMEType & listener used
 *
 *  @param webView
 */
- (void)webViewMainFrameDidCommitLoad:(CCWebBrowserView *)browserView
{
    //[webDocumentView _updateSize];
    
    if ([self.delegate respondsToSelector:@selector(webViewDidStartLoad:)])
    {
        [self.delegate webViewDidStartLoad:self];
    }
}

/**
 *  MainFrame did load finish
 *
 *  @param webView
 */
- (void)webViewMainFrameDidFinishLoad:(CCWebBrowserView *)browserView
{
    [browserView _updateSize];
    
    if ([self.delegate respondsToSelector:@selector(webViewDidFinishLoad:)])
    {
        [self.delegate webViewDidFinishLoad:self];
    }
}

/**
 *  mainFrame fail
 *
 *  @param webDocumentView //TODO: need check type
 *  @param error           
 */
- (void)webViewMainFrameDidFailLoad:(CCWebBrowserView *)browserView withError:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(webView:didFailLoadWithError:)])
    {
        [self.delegate webView:self didFailLoadWithError:error];
    }
}

/**
 *  DocumentView notify the delegate when _updateSize was called
 *
 *  @param webView  the documentView
 *  @param frame    may changing to new frame
 *  @param oldFrame
 */
- (void)view:(CCWebBrowserView *)browserView didSetFrame:(CGRect)frame oldFrame:(CGRect)oldFrame
{
    if (!CGRectEqualToRect(frame, oldFrame))
    {
        _webScrollView.contentSize = frame.size;
        
        if (frame.size.width > 0 && frame.size.height > 0)
        {
            //[webDocumentView redrawScaledDocument];
        }
    }
}

- (void)webViewProgressStepChange:(NSNotification *)notification
{
    id value = [[notification object] valueForKey:@"estimatedProgress"];
    float step = [value floatValue];
    
    if ([self.delegate respondsToSelector:@selector(webView:loadingPercentageDidChange:)])
    {
		[self.delegate webView:self loadingPercentageDidChange:step];
    }
}

#pragma mark - Runtime Get UIWebView methods
- (void)saveStateToHistoryItem:(id)arg0 forWebView:(id)arg1
{}
- (void)restoreStateFromHistoryItem:(id)arg0 forWebView:(id)arg1
{}

- (void)_webViewCommonInitWithWebView:(id)arg0 scalesPageToFit:(char)arg1 shouldEnableReachability:(char)arg2
{}

- (void)_rescaleDocument
{}

- (void)_frameOrBoundsChanged
{}




@end
