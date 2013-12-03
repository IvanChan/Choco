//
//  DefaultFrameLoadDelegate.m
//  ChocoCore
//
//  Created by Chan Ivan on 12/2/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "DefaultFrameLoadDelegate.h"
#import "WebViewDefine.h"

@implementation DefaultFrameLoadDelegate
#pragma mark - FrameLoad Delegate
/**
 *  first layout in frame
 *
 *  @param webView WebView obj
 *  @param frame   WebFrame obj
 */
- (void)webView:(WebView *)webView didFirstLayoutInFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didFirstLayoutInFrame:)])
    {
        [documentView webView:webView didFirstLayoutInFrame:frame];
    }
}

- (void)webView:(WebView *)webView didFirstVisuallyNonEmptyLayoutInFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didFirstVisuallyNonEmptyLayoutInFrame:)])
    {
        [documentView webView:webView didFirstVisuallyNonEmptyLayoutInFrame:frame];
    }
}

/*!
 @method webView:didStartProvisionalLoadForFrame:
 @abstract Notifies the delegate that the provisional load of a frame has started
 @param webView The WebView sending the message
 @param frame The frame for which the provisional load has started
 @discussion This method is called after the provisional data source of a frame
 has started to load.
 */
- (void)webView:(WebView *)webView didStartProvisionalLoadForFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didStartProvisionalLoadForFrame:)])
    {
        [documentView webView:webView didStartProvisionalLoadForFrame:frame];
    }
}

/*!
 @method webView:didReceiveServerRedirectForProvisionalLoadForFrame:
 @abstract Notifies the delegate that a server redirect occurred during the provisional load
 @param webView The WebView sending the message
 @param frame The frame for which the redirect occurred
 */
- (void)webView:(WebView *)webView didReceiveServerRedirectForProvisionalLoadForFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didReceiveServerRedirectForProvisionalLoadForFrame:)])
    {
        [documentView webView:webView didReceiveServerRedirectForProvisionalLoadForFrame:frame];
    }
}

/*!
 @method webView:didFailProvisionalLoadWithError:forFrame:
 @abstract Notifies the delegate that the provisional load has failed
 @param webView The WebView sending the message
 @param error The error that occurred
 @param frame The frame for which the error occurred
 @discussion This method is called after the provisional data source has failed to load.
 The frame will continue to display the contents of the committed data source if there is one.
 */
- (void)webView:(WebView *)webView didFailProvisionalLoadWithError:(NSError *)error forFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didFailProvisionalLoadWithError:forFrame:)])
    {
        [documentView webView:webView didFailProvisionalLoadWithError:error forFrame:frame];
    }
}

/*!
 @method webView:didCommitLoadForFrame:
 @abstract Notifies the delegate that the load has changed from provisional to committed
 @param webView The WebView sending the message
 @param frame The frame for which the load has committed
 @discussion This method is called after the provisional data source has become the
 committed data source.
 
 In some cases, a single load may be committed more than once. This happens
 in the case of multipart/x-mixed-replace, also known as "server push". In this case,
 a single location change leads to multiple documents that are loaded in sequence. When
 this happens, a new commit will be sent for each document.
 */
- (void)webView:(WebView *)webView didCommitLoadForFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didCommitLoadForFrame:)])
    {
        [documentView webView:webView didCommitLoadForFrame:frame];
    }
}

/*!
 @method webView:didReceiveTitle:forFrame:
 @abstract Notifies the delegate that the page title for a frame has been received
 @param webView The WebView sending the message
 @param title The new page title
 @param frame The frame for which the title has been received
 @discussion The title may update during loading; clients should be prepared for this.
 */
- (void)webView:(WebView *)webView didReceiveTitle:(NSString *)title forFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didReceiveTitle:forFrame:)])
    {
        [documentView webView:webView didReceiveTitle:title forFrame:frame];
    }
}

/*!
 @method webView:didReceiveIcon:forFrame:
 @abstract Notifies the delegate that a page icon image for a frame has been received
 @param webView The WebView sending the message
 @param image The icon image. Also known as a "favicon".
 @param frame The frame for which a page icon has been received
 */
- (void)webView:(WebView *)webView didReceiveIcon:(UIImage *)image forFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didReceiveIcon:forFrame:)])
    {
        [documentView webView:webView didReceiveIcon:image forFrame:frame];
    }
}

/*!
 @method webView:didFinishLoadForFrame:
 @abstract Notifies the delegate that the committed load of a frame has completed
 @param webView The WebView sending the message
 @param frame The frame that finished loading
 @discussion This method is called after the committed data source of a frame has successfully loaded
 and will only be called when all subresources such as images and stylesheets are done loading.
 Plug-In content and JavaScript-requested loads may occur after this method is called.
 */
- (void)webView:(WebView *)webView didFinishLoadForFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didFinishLoadForFrame:)])
    {
        [documentView webView:webView didFinishLoadForFrame:frame];
    }
}

/*!
 @method webView:didFailLoadWithError:forFrame:
 @abstract Notifies the delegate that the committed load of a frame has failed
 @param webView The WebView sending the message
 @param error The error that occurred
 @param frame The frame that failed to load
 @discussion This method is called after a data source has committed but failed to completely load.
 */
- (void)webView:(WebView *)webView didFailLoadWithError:(NSError *)error forFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didFailLoadWithError:forFrame:)])
    {
        [documentView webView:webView didFailLoadWithError:error forFrame:frame];
    }
}

/*!
 @method webView:didChangeLocationWithinPageForFrame:
 @abstract Notifies the delegate that the scroll position in a frame has changed
 @param webView The WebView sending the message
 @param frame The frame that scrolled
 @discussion This method is called when anchors within a page have been clicked.
 */
- (void)webView:(WebView *)webView didChangeLocationWithinPageForFrame:(WebFrame *)frame;
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didChangeLocationWithinPageForFrame:)])
    {
        [documentView webView:webView didChangeLocationWithinPageForFrame:frame];
    }
}

/*!
 @method webView:willPerformClientRedirectToURL:delay:fireDate:forFrame:
 @abstract Notifies the delegate that a frame will perform a client-side redirect
 @param webView The WebView sending the message
 @param URL The URL to be redirected to
 @param seconds Seconds in which the redirect will happen
 @param date The fire date
 @param frame The frame on which the redirect will occur
 @discussion This method can be used to continue progress feedback while a client-side
 redirect is pending.
 */
- (void)webView:(WebView *)webView willPerformClientRedirectToURL:(NSURL *)URL delay:(NSTimeInterval)seconds fireDate:(NSDate *)date forFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:willPerformClientRedirectToURL:delay:fireDate:forFrame:)])
    {
        [documentView webView:webView willPerformClientRedirectToURL:URL delay:seconds fireDate:date forFrame:frame];
    }
}

/*!
 @method webView:didCancelClientRedirectForFrame:
 @abstract Notifies the delegate that a pending client-side redirect has been cancelled
 @param webView The WebView sending the message
 @param frame The frame for which the pending redirect was cancelled
 @discussion A client-side redirect can be cancelled if a frame changes location before the timeout.
 */
- (void)webView:(WebView *)webView didCancelClientRedirectForFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didCancelClientRedirectForFrame:)])
    {
        [documentView webView:webView didCancelClientRedirectForFrame:frame];
    }
}

/*!
 @method webView:willCloseFrame:
 @abstract Notifies the delegate that a frame will be closed
 @param webView The WebView sending the message
 @param frame The frame that will be closed
 @discussion This method is called right before WebKit is done with the frame
 and the objects that it contains.
 */
- (void)webView:(WebView *)webView willCloseFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:willCloseFrame:)])
    {
        [documentView webView:webView willCloseFrame:frame];
    }
}

/*!
 @method webView:didClearWindowObject:forFrame:
 @abstract Notifies the delegate that the JavaScript window object in a frame has
 been cleared in preparation for a new load. This is the preferred place to set custom
 properties on the window object using the WebScriptObject and JavaScriptCore APIs.
 @param webView The webView sending the message.
 @param windowObject The WebScriptObject representing the frame's JavaScript window object.
 @param frame The WebFrame to which windowObject belongs.
 @discussion If a delegate implements both webView:didClearWindowObject:forFrame:
 and webView:windowScriptObjectAvailable:, only webView:didClearWindowObject:forFrame:
 will be invoked. This enables a delegate to implement both methods for backwards
 compatibility with older versions of WebKit.
 */
- (void)webView:(WebView *)webView didClearWindowObject:(id)windowObject forFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didClearWindowObject:forFrame:)])
    {
        [documentView webView:webView didClearWindowObject:windowObject forFrame:frame];
    }
}


/*!
 @method webView:windowScriptObjectAvailable:
 @abstract Notifies the delegate that the scripting object for a page is available.  This is called
 before the page is loaded.  It may be useful to allow delegates to bind native objects to the window.
 @param webView The webView sending the message.
 @param windowScriptObject The WebScriptObject for the window in the scripting environment.
 @discussion This method is deprecated. Consider using webView:didClearWindowObject:forFrame:
 instead.
 */
- (void)webView:(WebView *)webView windowScriptObjectAvailable:(id)windowScriptObject
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:windowScriptObjectAvailable:)])
    {
        [documentView webView:webView windowScriptObjectAvailable:windowScriptObject];
    }
}

/*!
 @method webView:didCreateJavaScriptContext:contextForFrame:
 @abstract Notifies the delegate that a new JavaScript context has been created created.
 @param webView The WebView sending the message.
 @param context The JSContext representing the frame's JavaScript window object.
 @param frame The WebFrame to which the context belongs.
 @discussion If a delegate implements webView:didCreateJavaScriptContext:forFrame: along with either
 webView:didClearWindowObject:forFrame: or webView:windowScriptObjectAvailable:, only
 webView:didCreateJavaScriptContext:forFrame will be invoked. This enables a delegate to implement
 multiple versions to maintain backwards compatibility with older versions of WebKit.
 */
- (void)webView:(WebView *)webView didCreateJavaScriptContext:(id)context forFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didCreateJavaScriptContext:forFrame:)])
    {
        [documentView webView:webView didCreateJavaScriptContext:context forFrame:frame];
    }
}


#pragma mark FrameLoad Delegate Private
- (void)webViewDidDisplayInsecureContent:(WebView *)webView
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webViewDidDisplayInsecureContent:)])
    {
        [documentView webViewDidDisplayInsecureContent:webView];
    }
}

- (void)webView:(WebView *)webView didRunInsecureContent:(id)origin//WebSecurityOrigin *
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didRunInsecureContent:)])
    {
        [documentView webView:webView didRunInsecureContent:origin];
    }
}

- (void)webView:(WebView *)webView didDetectXSS:(NSURL *)insecureURL
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didDetectXSS:)])
    {
        [documentView webView:webView didDetectXSS:insecureURL];
    }
}

- (void)webView:(WebView *)webView didClearWindowObjectForFrame:(WebFrame *)frame inScriptWorld:(id)world//WebScriptWorld *
{}

- (void)webView:(WebView *)webView didPushStateWithinPageForFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didPushStateWithinPageForFrame:)])
    {
        [documentView webView:webView didPushStateWithinPageForFrame:frame];
    }
}

- (void)webView:(WebView *)webView didReplaceStateWithinPageForFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didReplaceStateWithinPageForFrame:)])
    {
        [documentView webView:webView didReplaceStateWithinPageForFrame:frame];
    }
}

- (void)webView:(WebView *)webView didPopStateWithinPageForFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didPopStateWithinPageForFrame:)])
    {
        [documentView webView:webView didPopStateWithinPageForFrame:frame];
    }
}

- (void)webView:(WebView *)webView didRemoveFrameFromHierarchy:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didRemoveFrameFromHierarchy:)])
    {
        [documentView webView:webView didRemoveFrameFromHierarchy:frame];
    }
}

#pragma mark - Runtime Found
- (void)webView:(WebView *)webView didFinishDocumentLoadForFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didFinishDocumentLoadForFrame:)])
    {
        [documentView webView:webView didFinishDocumentLoadForFrame:frame];
    }
}

- (void)webView:(WebView *)webView didHandleOnloadEventsForFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didHandleOnloadEventsForFrame:)])
    {
        [documentView webView:webView didHandleOnloadEventsForFrame:frame];
    }
}

- (void)webView:(WebView *)webView didClearInspectorWindowObject:(id)windowObj forFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didClearInspectorWindowObject:forFrame:)])
    {
        [documentView webView:webView didClearInspectorWindowObject:windowObj forFrame:frame];
    }
}

@end
