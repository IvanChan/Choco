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
    //FIXME: according to UIWebView, should set this
    //_webDocumentView._editingDelegate = self;
    [_webScrollView addSubview:_webDocumentView];
    
    //FIXME: dont bind scrollView & documentView directly
    [_webDocumentView addObserver:_webScrollView
                       forKeyPath:@"frame" options:NSKeyValueObservingOptionNew
                          context:nil];
    
    [[_webDocumentView webView] setUIDelegate:self];
    [[_webDocumentView webView] setFrameLoadDelegate:self];
    [[_webDocumentView webView] setResourceLoadDelegate:self];
    [[_webDocumentView webView] setPolicyDelegate:self];
    
    //TODO:
    //[[_webDocumentView webView] setDownloadDelegate:self];
    //[[_webDocumentView webView] setHistoryDelegate:self];
    
    return (_webScrollView && _webDocumentView);
}

- (void)dealloc
{
    
    [[_webDocumentView webView] setUIDelegate:nil];
    [[_webDocumentView webView] setFrameLoadDelegate:nil];
    [[_webDocumentView webView] setResourceLoadDelegate:nil];
    [[_webDocumentView webView] setPolicyDelegate:nil];
    
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

#pragma mark - Delegate
- (void)webView:(id)arg0 decidePolicyForGeolocationRequestFromOrigin:(id)arg1 frame:(id)arg2 listener:(id)arg3
{}


- (void)webView:(id)arg0 didReceiveServerRedirectForProvisionalLoadForFrame:(id)arg1
{}

- (void)webView:(id)arg0 didCommitLoadForFrame:(id)arg1
{}

- (void)webView:(id)arg0 didReceiveTitle:(id)arg1 forFrame:(id)arg2
{}

- (void)webView:(id)arg0 didFinishLoadForFrame:(id)arg1
{}

- (void)webView:(id)arg0 didFailLoadWithError:(id)arg1 forFrame:(id)arg2
{}

- (void)webView:(id)arg0 didChangeLocationWithinPageForFrame:(id)arg1
{}

- (void)webView:(id)arg0 didClearWindowObject:(id)arg1 forFrame:(id)arg2
{}


- (void)webView:(id)arg0 unableToImplementPolicyWithError:(id)arg1 frame:(id)arg2
{}

- (void)webView:(id)arg0 decidePolicyForMIMEType:(id)arg1 request:(id)arg2 frame:(id)arg3 decisionListener:(id)arg4
{}

- (void)webView:(id)arg0 decidePolicyForNewWindowAction:(id)arg1 request:(id)arg2 newFrameName:(id)arg3 decisionListener:(id)arg4
{}

- (void)webView:(id)arg0 resource:(id)arg1 didReceiveAuthenticationChallenge:(id)arg2 fromDataSource:(id)arg3
{}

- (void)webView:(id)arg0 resource:(id)arg1 didCancelAuthenticationChallenge:(id)arg2 fromDataSource:(id)arg3
{}

- (char)webView:(id)arg0 resource:(id)arg1 canAuthenticateAgainstProtectionSpace:(id)arg2 forDataSource:(id)arg3
{
    return YES;
}

- (id)webView:(id)arg0 connectionPropertiesForResource:(id)arg1 dataSource:(id)arg2
{
    return nil;
}

- (void)webView:(id)arg0 resource:(id)arg1 didFinishLoadingFromDataSource:(id)arg2
{}

- (void)webView:(id)arg0 resource:(id)arg1 didFailLoadingWithError:(id)arg2 fromDataSource:(id)arg3
{}

- (void)webViewClose:(id)arg0
{}

- (void)webView:(id)arg0 runJavaScriptAlertPanelWithMessage:(id)arg1 initiatedByFrame:(id)arg2
{}

- (char)webView:(id)arg0 runJavaScriptConfirmPanelWithMessage:(id)arg1 initiatedByFrame:(id)arg2
{
    return NO;
}

- (id)webView:(id)arg0 runJavaScriptTextInputPanelWithPrompt:(id)arg1 defaultText:(id)arg2 initiatedByFrame:(id)arg3
{
    return nil;
}

- (void)webView:(id)arg0 printFrameView:(id)arg1
{}

- (void)webView:(id)arg0 frame:(id)arg1 exceededDatabaseQuotaForSecurityOrigin:(id)arg2 database:(id)arg3
{}

- (void)webView:(id)arg0 exceededApplicationCacheOriginQuotaForSecurityOrigin:(id)arg1 totalSpaceNeeded:(unsigned int)arg2
{}

- (void)webViewSupportedOrientationsUpdated:(id)arg0
{}

- (void)_webViewCommonInitWithWebView:(id)arg0 scalesPageToFit:(char)arg1 shouldEnableReachability:(char)arg2
{}

/**
 *  DocumentView notify the delegate when _updateSize was called
 *
 *  @param webView  the documentView
 *  @param frame    may changing to new frame
 *  @param oldFrame
 */
- (void)view:(CCWebDocumentView *)webDocumentView didSetFrame:(CGRect)frame oldFrame:(CGRect)oldFrame
{
    if (!CGRectEqualToRect(frame, oldFrame))
    {
        _webScrollView.contentSize = frame.size;
        
        if (frame.size.width > 0 && frame.size.height > 0)
        {
            [webDocumentView redrawScaledDocument];
        }
    }
}


- (void)webViewMainFrameDidFailLoad:(id)arg0 withError:(id)arg1
{}

#pragma mark - Delegate
/**
 *  first layout in frame
 *
 *  @param webView WebView obj
 *  @param frame   WebFrame obj
 */
- (void)webView:(WebView *)webView didFirstLayoutInFrame:(WebFrame *)frame
{}

/**
 *  decide policy for navigation
 *
 *  @param webView
 *  @param action
 *  @param request
 *  @param frame
 *  @param listener must call use/ignore/download
 */
- (void)webView:(WebView *)webView decidePolicyForNavigationAction:(NSDictionary *)action request:(NSMutableURLRequest *)request frame:(WebFrame *)frame decisionListener:(WebFramePolicyListener *)listener
{
    [listener use];
}

/**
 *  start provisional load
 *
 *  @param webView
 *  @param frame
 */
- (void)webView:(WebView *)webView didStartProvisionalLoadForFrame:(WebFrame *)frame
{}

/**
 *  identifier request
 *
 *  @param webView
 *  @param request
 *  @param dataSource
 *
 *  @return TODO: check if return NSURLRequest
 */
- (NSURLRequest *)webView:(WebView *)webView identifierForInitialRequest:(NSMutableURLRequest *)request fromDataSource:(WebDataSource *)dataSource
{
    return request;
}

/**
 *  Will send request
 *
 *  @param webView
 *  @param arg1       TODO:check type
 *  @param request
 *  @param arg3       TODO:check type
 *  @param dataSource
 *
 *  @return TODO: check if return NSURLRequest
 */
- (NSURLRequest *)webView:(WebView *)webView resource:(id)arg1 willSendRequest:(NSMutableURLRequest *)request redirectResponse:(id)arg3 fromDataSource:(WebDataSource *)dataSource
{
    return request;
}

/**
 *  Provisional Fail
 *
 *  @param webView
 *  @param error
 *  @param frame   
 */
- (void)webView:(WebView *)webView didFailProvisionalLoadWithError:(NSError *)error forFrame:(WebFrame *)frame
{}


/**
 *  The request is committed & start to load
 *
 *  @param webView
 */
- (void)webViewMainFrameDidCommitLoad:(CCWebDocumentView *)webDocumentView
{
    //[webDocumentView _updateSize];
}

/**
 *  MainFrame did load finish
 *
 *  @param webView
 */
- (void)webViewMainFrameDidFinishLoad:(CCWebDocumentView *)webDocumentView
{
    [webDocumentView _updateSize];
}

@end
