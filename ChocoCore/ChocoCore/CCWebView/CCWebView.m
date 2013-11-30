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

@interface CCWebView ()
{
    CCWebBrowserView    *_webBrowserView;
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
    
    //FIXME: dont bind scrollView & documentView directly
    [_webBrowserView addObserver:_webScrollView
                       forKeyPath:@"frame" options:NSKeyValueObservingOptionNew
                          context:nil];
    
    [[self webView] setUIDelegate:self];
    [[self webView] setFrameLoadDelegate:self];
    [[self webView] setResourceLoadDelegate:self];
    [[self webView] setPolicyDelegate:self];
    
    //TODO:
    //[[self webView] setDownloadDelegate:self];
    //[[self webView] setHistoryDelegate:self];
    
    return (_webScrollView && _webBrowserView);
}

- (void)dealloc
{
    
    [[self webView] setUIDelegate:nil];
    [[self webView] setFrameLoadDelegate:nil];
    [[self webView] setResourceLoadDelegate:nil];
    [[self webView] setPolicyDelegate:nil];
    
    [_webBrowserView removeObserver:_webScrollView forKeyPath:@"frame"];
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

#pragma mark - Delegate
- (void)webView:(id)arg0 decidePolicyForGeolocationRequestFromOrigin:(id)arg1 frame:(id)arg2 listener:(id)arg3
{}

- (void)webView:(id)arg0 didFailLoadWithError:(id)arg1 forFrame:(id)arg2
{}

- (void)webView:(id)arg0 didChangeLocationWithinPageForFrame:(id)arg1
{}

- (void)webView:(id)arg0 unableToImplementPolicyWithError:(id)arg1 frame:(id)arg2
{}

- (void)webView:(id)arg0 resource:(id)arg1 didReceiveAuthenticationChallenge:(id)arg2 fromDataSource:(id)arg3
{}

- (void)webView:(id)arg0 resource:(id)arg1 didCancelAuthenticationChallenge:(id)arg2 fromDataSource:(id)arg3
{}

- (BOOL)webView:(id)arg0 resource:(id)arg1 canAuthenticateAgainstProtectionSpace:(id)arg2 forDataSource:(id)arg3
{
    return YES;
}

- (id)webView:(id)arg0 createWebViewWithRequest:(id)arg1
{
    return nil;
}

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
            //[webDocumentView redrawScaledDocument];
        }
    }
}

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
//    UIWebURLAction:
//
//    + (char)performDefaultActionForURL:(id)arg0 andDOMNode:(id)arg1 withAllowedTypes:(unsigned int)arg2 forFrame:(id)arg3 inView:(id)arg4 ;
//    + (void)performDataDetectorsDefaultActionForDOMNode:(id)arg0 forFrame:(id)arg1 inView:(id)arg2 ;
    
    //"performDefaultActionForURL:andDOMNode:withAllowedTypes:forFrame:inView:"
    //"_canHandleRequest:"
    
//    Class uiwebURLActionCls = NSClassFromString(@"UIWebURLAction");
//    [uiwebURLActionCls performDefaultActionForURL:[request URL] andDOMNode:nil withAllowedTypes:-3 forFrame:frame inView:self];
    
    [listener use];
}

/**
 *  decied policy for newWindow
 *
 *  @param webView
 *  @param action
 *  @param request
 *  @param newFrameName
 *  @param listener
 */
- (void)webView:(WebView *)webView decidePolicyForNewWindowAction:(NSDictionary *)action request:(NSMutableURLRequest *)request newFrameName:(NSString *)newFrameName decisionListener:(WebFramePolicyListener *)listener
{
    [self webView:webView decidePolicyForNavigationAction:action request:request frame:[[self webView] mainFrame] decisionListener:listener];
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
 *  Called after identifierForInitialRequest
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
 *  Called after willsentRequest, maybe just mainFrame
 *
 *  @param webView
 *  @param resource
 *  @param dataSource
 *
 *  @return TODO:need check return typ
 */
- (NSURLRequest *)webView:(WebView *)webView connectionPropertiesForResource:(NSMutableURLRequest *)resource dataSource:(WebDataSource *)dataSource
{//FIXME: return resource will lead to some kindof error, the load process stop
    return nil;
}

/**
 *  Will lead to decidePolicyForNavigationAction again
 *
 *  @param webView
 *  @param frame
 */
- (void)webView:(WebView *)webView didReceiveServerRedirectForProvisionalLoadForFrame:(WebFrame *)frame
{}

/**
 *  after provisonal load, this method called after decidePolicyForNavigationAction
 *
 *  @param webView
 *  @param MIMEType
 *  @param request
 *  @param frame
 *  @param listener
 */
- (void)webView:(WebView *)webView decidePolicyForMIMEType:(NSString *)MIMEType request:(NSMutableURLRequest *)request frame:(WebFrame *)frame decisionListener:(WebFramePolicyListener *)listener
{
    [listener use];
}

/**
 *  Called after each resource request sent & finished load
 *
 *  @param webView
 *  @param resource
 *  @param dataSource
 */
- (void)webView:(WebView *)webView resource:(NSMutableURLRequest *)resource didFinishLoadingFromDataSource:(WebDataSource *)dataSource
{}

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
 *  after provisionalLoadWithError
 *
 *  @param webView
 *  @param resource
 *  @param error
 *  @param dataSource
 */
- (void)webView:(WebView *)webView resource:(NSMutableURLRequest *)resource didFailLoadingWithError:(NSError *)error fromDataSource:(WebDataSource *)dataSource
{}

/**
 *  Called after decidePolicyWithMIMEType & listener used
 *
 *  @param webView
 */
- (void)webViewMainFrameDidCommitLoad:(CCWebDocumentView *)webDocumentView
{
    //[webDocumentView _updateSize];
}

/**
 *  Called when commit to load a frame
 *
 *  @param webView
 *  @param frame
 */
- (void)webView:(WebView *)webView didCommitLoadForFrame:(WebFrame *)frame
{}

/**
 *  Called after mainFrame is commited to load & did receive title
 *
 *  @param webView
 *  @param title
 *  @param frame
 */
- (void)webView:(WebView *)webView didReceiveTitle:(NSString *)title forFrame:(WebFrame *)frame
{}

/**
 *  MainFrame did load finish
 *
 *  @param webView
 */
- (void)webViewMainFrameDidFinishLoad:(CCWebDocumentView *)webDocumentView
{
    //[webDocumentView _updateSize];
}

/**
 *  did finish load for a frame
 *
 *  @param webView
 *  @param frame
 */
- (void)webView:(WebView *)webView didFinishLoadForFrame:(WebFrame *)frame
{}

/**
 *  mainFrame fail
 *
 *  @param webDocumentView //TODO: need check type
 *  @param error           
 */
- (void)webViewMainFrameDidFailLoad:(CCWebDocumentView *)webDocumentView withError:(NSError *)error
{}

/**
 *  Called after title received & finish load a frme
 *
 *  @param webView
 *  @param object  type DOMAbstractView
 *  @param frame
 */
- (void)webView:(WebView *)webView didClearWindowObject:(id)object forFrame:(WebFrame *)frame
{}
@end
