//
//  CCWebViewWebViewDelegate.m
//  ChocoCore
//
//  Created by Chan Ivan on 12/3/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "CCWebViewWebViewDelegate.h"
#import "WebViewDefine.h"
#import "CCWebView.h"

@class WebFrameView;
@implementation CCWebViewWebViewDelegate

#pragma mark - Init & Dealloc
- (id)initWithCCWebView:(id)ccWebView
{
    if (self = [super init])
    {
        _ccWebView = ccWebView;
    }
    
    return self;
}

- (void)dealloc
{
    [self _clearCCWebView];
    
    [super dealloc];
}

- (void)_clearCCWebView
{
    _ccWebView = nil;
}

#pragma mark - WebView Delegate
/*!
 @method webView:runJavaScriptAlertPanelWithMessage:initiatedByFrame:
 @abstract Display a JavaScript alert panel.
 @param sender The WebView sending the delegate method.
 @param message The message to display.
 @param frame The WebFrame whose JavaScript initiated this call.
 @discussion Clients should visually indicate that this panel comes
 from JavaScript initiated by the specified frame. The panel should have
 a single OK button.
 */
- (void)webView:(WebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WebFrame *)frame
{}

/*!
 @method webView:runJavaScriptConfirmPanelWithMessage:initiatedByFrame:
 @abstract Display a JavaScript confirm panel.
 @param sender The WebView sending the delegate method.
 @param message The message to display.
 @param frame The WebFrame whose JavaScript initiated this call.
 @result YES if the user hit OK, NO if the user chose Cancel.
 @discussion Clients should visually indicate that this panel comes
 from JavaScript initiated by the specified frame. The panel should have
 two buttons, e.g. "OK" and "Cancel".
 */
- (BOOL)webView:(WebView *)sender runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WebFrame *)frame
{
    return YES;
}
/*!
 @method webView:runJavaScriptTextInputPanelWithPrompt:defaultText:initiatedByFrame:
 @abstract Display a JavaScript text input panel.
 @param sender The WebView sending the delegate method.
 @param message The message to display.
 @param defaultText The initial text for the text entry area.
 @param frame The WebFrame whose JavaScript initiated this call.
 @result The typed text if the user hit OK, otherwise nil.
 @discussion Clients should visually indicate that this panel comes
 from JavaScript initiated by the specified frame. The panel should have
 two buttons, e.g. "OK" and "Cancel", and an area to type text.
 */
- (NSString *)webView:(WebView *)sender runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WebFrame *)frame
{
    return defaultText;
}

/*!
 @method webView:printFrameView:
 @abstract Informs that a WebFrameView needs to be printed
 @param webView The WebView sending the delegate method
 @param frameView The WebFrameView needing to be printed
 @discussion This method is called when a script or user requests the page to be printed.
 In this method the delegate can prepare the WebFrameView to be printed. Some content that WebKit
 displays can be printed directly by the WebFrameView, other content will need to be handled by
 the delegate. To determine if the WebFrameView can handle printing the delegate should check
 WebFrameView's documentViewShouldHandlePrint, if YES then the delegate can call printDocumentView
 on the WebFrameView. Otherwise the delegate will need to request a NSPrintOperation from
 the WebFrameView's printOperationWithPrintInfo to handle the printing.
 */
- (void)webView:(WebView *)sender printFrameView:(WebFrameView *)frameView
{}

/*!
 @method webView:frame:exceededDatabaseQuotaForSecurityOrigin:database:
 @param sender The WebView sending the delegate method.
 @param frame The WebFrame whose JavaScript initiated this call.
 @param origin The security origin that needs a larger quota.
 @param databaseIdentifier The identifier of the database involved.
 */
- (void)webView:(WebView *)webView frame:(WebFrame *)frame exceededDatabaseQuotaForSecurityOrigin:(id)origin database:(NSString *)databaseIdentifier
{}

/*!
 @method webView:exceededApplicationCacheOriginQuotaForSecurityOrigin:totalSpaceNeeded:
 @param sender The WebView sending the delegate method.
 @param origin The security origin that needs a larger quota.
 @param totalSpaceNeeded The amount of space needed to store the new manifest and keep all other
 previously stored caches for this origin.
 @discussion This method is called when a page attempts to store more in the Application Cache
 for an origin than was allowed by the quota (or default) set for the origin. This allows the
 quota to be increased for the security origin.
 */
- (void)webView:(WebView *)webView exceededApplicationCacheOriginQuotaForSecurityOrigin:(id)origin totalSpaceNeeded:(NSUInteger)totalSpaceNeeded
{}

/*!
 @method webView:didStartProvisionalLoadForFrame:
 @abstract Notifies the delegate that the provisional load of a frame has started
 @param webView The WebView sending the message
 @param frame The frame for which the provisional load has started
 @discussion This method is called after the provisional data source of a frame
 has started to load.
 */
- (void)webView:(WebView *)webView didStartProvisionalLoadForFrame:(WebFrame *)frame
{}

/*!
 @method webView:didReceiveServerRedirectForProvisionalLoadForFrame:
 @abstract Notifies the delegate that a server redirect occurred during the provisional load
 @param webView The WebView sending the message
 @param frame The frame for which the redirect occurred
 */
- (void)webView:(WebView *)webView didReceiveServerRedirectForProvisionalLoadForFrame:(WebFrame *)frame
{}

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
{}

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
{}

/*!
 @method webView:didReceiveTitle:forFrame:
 @abstract Notifies the delegate that the page title for a frame has been received
 @param webView The WebView sending the message
 @param title The new page title
 @param frame The frame for which the title has been received
 @discussion The title may update during loading; clients should be prepared for this.
 */
- (void)webView:(WebView *)webView didReceiveTitle:(NSString *)title forFrame:(WebFrame *)frame
{}

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
{}

/*!
 @method webView:didFailLoadWithError:forFrame:
 @abstract Notifies the delegate that the committed load of a frame has failed
 @param webView The WebView sending the message
 @param error The error that occurred
 @param frame The frame that failed to load
 @discussion This method is called after a data source has committed but failed to completely load.
 */
- (void)webView:(WebView *)webView didFailLoadWithError:(NSError *)error forFrame:(WebFrame *)frame
{}

/*!
 @method webView:didChangeLocationWithinPageForFrame:
 @abstract Notifies the delegate that the scroll position in a frame has changed
 @param webView The WebView sending the message
 @param frame The frame that scrolled
 @discussion This method is called when anchors within a page have been clicked.
 */
- (void)webView:(WebView *)webView didChangeLocationWithinPageForFrame:(WebFrame *)frame;
{}

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
{}

/**
 *  first layout in frame
 *
 *  @param webView WebView obj
 *  @param frame   WebFrame obj
 */
- (void)webView:(WebView *)webView didFirstLayoutInFrame:(WebFrame *)frame
{}

/*!
 @method webView:unableToImplementPolicy:error:forURL:inFrame:
 @discussion Called when a WebPolicy could not be implemented. It is up to the client to display appropriate feedback.
 @param policy The policy that could not be implemented.
 @param error The error that caused the policy to not be implemented.
 @param URL The URL of the resource for which a particular action was requested but failed.
 @param frame The frame in which the policy could not be implemented.
 */
- (void)webView:(WebView *)webView unableToImplementPolicyWithError:(NSError *)error frame:(WebFrame *)frame
{}

/*!
 @method webView:decidePolicyForMIMEType:request:frame:
 @discussion Returns the policy for content which has been partially loaded.
 Sent after webView:didStartProvisionalLoadForFrame: is sent on the WebFrameLoadDelegate.
 @param type MIME type for the resource.
 @param request A NSURLRequest for the partially loaded content.
 @param frame The frame which is loading the URL.
 @param listener The object to call when the decision is made
 */
- (void)webView:(WebView *)webView decidePolicyForMIMEType:(NSString *)type
        request:(NSURLRequest *)request
          frame:(WebFrame *)frame
decisionListener:(WebFramePolicyListener *)listener
{
    [listener use];
}

/*!
 @method webView:decidePolicyForNavigationAction:request:frame:decisionListener:
 @abstract This method is called to decide what to do with a proposed navigation.
 @param actionInformation Dictionary that describes the action that triggered this navigation.
 @param request The request for the proposed navigation
 @param frame The WebFrame in which the navigation is happening
 @param listener The object to call when the decision is made
 @discussion This method will be called before loading starts, and
 on every redirect.
 */
- (void)webView:(WebView *)webView decidePolicyForNavigationAction:(NSDictionary *)actionInformation
        request:(NSURLRequest *)request
          frame:(WebFrame *)frame
decisionListener:(WebFramePolicyListener *)listener
{
    [listener use];
}

/*!
 @method webView:decidePolicyForNewWindowAction:request:newFrameName:decisionListener:
 @discussion This method is called to decide what to do with an targetted nagivation that would open a new window.
 @param actionInformation Dictionary that describes the action that triggered this navigation.
 @param request The request for the proposed navigation
 @param frame The frame in which the navigation is taking place
 @param listener The object to call when the decision is made
 @discussion This method is provided so that modified clicks on a targetted link which
 opens a new frame can prevent the new window from being opened if they decide to
 do something else, like download or present the new frame in a specialized way.
 
 <p>If this method picks a policy of Use, the new window will be
 opened, and decidePolicyForNavigationAction:request:frame:decisionListner:
 will be called with a WebNavigationType of WebNavigationTypeOther
 in its action. This is to avoid possible confusion about the modifiers.
 */
- (void)webView:(WebView *)webView decidePolicyForNewWindowAction:(NSDictionary *)actionInformation
        request:(NSURLRequest *)request
   newFrameName:(NSString *)frameName
decisionListener:(WebFramePolicyListener *)listener
{
    [listener use];
}

/*!
 @method webView:identifierForInitialRequest:fromDataSource:
 @param webView The WebView sending the message.
 @param request The request about to be sent.
 @param dataSource The datasource that initiated the load.
 @discussion An implementor of WebResourceLoadDelegate should provide an identifier
 that can be used to track the load of a single resource.  This identifier will be
 passed as the first argument for all of the other WebResourceLoadDelegate methods.  The
 identifier is useful to track changes to a resources request, which will be
 provided by one or more calls to resource:willSendRequest:redirectResponse:fromDataSource:.
 @result An identifier that will be passed back to the implementor for each callback.
 The identifier will be retained.
 */
- (id)webView:(WebView *)webView identifierForInitialRequest:(NSURLRequest *)request fromDataSource:(WebDataSource *)dataSource
{
    return request;
}

- (id)webView:(id)arg0 resource:(id)arg1 willSendRequest:(id)arg2 redirectResponse:(id)arg3 fromDataSource:(id)arg4
{
    return arg2;
}

/*!
 @method webView:resource:didReceiveAuthenticationChallenge:fromDataSource:
 @abstract Start authentication for the resource, providing a challenge
 @discussion Call useCredential::, continueWithoutCredential or
 cancel on the challenge when done.
 @param challenge The NSURLAuthenticationChallenge to start authentication for
 @discussion If you do not implement this delegate method, WebKit will handle authentication
 automatically by prompting with a sheet on the window that the WebView is associated with.
 */
- (void)webView:(WebView *)webView resource:(id)identifier didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge fromDataSource:(WebDataSource *)dataSource
{}

/*!
 @method webView:resource:didCancelAuthenticationChallenge:fromDataSource:
 @abstract Cancel authentication for a given request
 @param challenge The NSURLAuthenticationChallenge for which to cancel authentication
 */
- (void)webView:(WebView *)webView resource:(id)identifier didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge fromDataSource:(WebDataSource *)dataSource
{}

/*!
 @method webView:resource:canAuthenticateAgainstProtectionSpace:forDataSource:
 @abstract Inspect an NSURLProtectionSpace before an authentication attempt is made. Only used on Snow Leopard or newer.
 @param protectionSpace an NSURLProtectionSpace that will be used to generate an authentication challenge
 @result Return YES if the resource load delegate is prepared to respond to an authentication challenge generated with protectionSpace, NO otherwise
 */
- (BOOL)webView:(WebView *)webView resource:(id)identifier canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace forDataSource:(WebDataSource *)dataSource
{
    return YES;
}

- (id)webView:(WebView *)webView connectionPropertiesForResource:(NSMutableURLRequest *)resource dataSource:(WebDataSource *)dataSource
{
    return nil;
}

/*!
 @method webView:resource:didFinishLoadingFromDataSource:
 @discussion This message is sent after a load has successfully completed.
 @param webView The WebView sending the message.
 @param identifier An identifier that can be used to track the progress of a resource load across
 multiple call backs.
 @param dataSource The dataSource that initiated the load.
 */
- (void)webView:(WebView *)webView resource:(id)identifier didFinishLoadingFromDataSource:(WebDataSource *)dataSource
{}

/*!
 @method webView:resource:didFailLoadingWithError:fromDataSource:
 @discussion This message is sent after a load has failed to load due to an error.
 @param webView The WebView sending the message.
 @param identifier An identifier that can be used to track the progress of a resource load across
 multiple call backs.
 @param error The error associated with this load.
 @param dataSource The dataSource that initiated the load.
 */
- (void)webView:(WebView *)webView resource:(id)identifier didFailLoadingWithError:(NSError *)error fromDataSource:(WebDataSource *)dataSource
{}

/*!
 @method webView:createWebViewWithRequest:
 @abstract Create a new window and begin to load the specified request.
 @discussion The newly created window is hidden, and the window operations delegate on the
 new WebViews will get a webViewShow: call.
 @param sender The WebView sending the delegate method.
 @param request The request to load.
 @result The WebView for the new window.
 */
- (WebView *)webView:(WebView *)sender createWebViewWithRequest:(NSURLRequest *)request
{
    return sender;
}

/*!
 @method webViewClose:
 @abstract Close the current window.
 @param sender The WebView sending the delegate method.
 @discussion Clients showing multiple views in one window may
 choose to close only the one corresponding to this
 WebView. Other clients may choose to ignore this method
 entirely.
 */
- (void)webViewClose:(WebView *)sender
{}

/*!
 @method webView:decidePolicyForGeolocationRequestFromOrigin:frame:listener:
 @abstract
 @param webView The WebView sending the delegate method.
 @param origin The security origin that would like to use Geolocation.
 @param frame The WebFrame whose JavaScript initiated this call.
 @param listener The object to call when the decision is made
 */
- (void)webView:(WebView *)webView decidePolicyForGeolocationRequestFromOrigin:(id)origin
          frame:(WebFrame *)frame
       listener:(id/*<WebAllowDenyPolicyListener>*/)listener
{
    [listener use];
}

- (void)webViewSupportedOrientationsUpdated:(id)arg0
{}

@end
