//
//  DefaultResourceLoadDelegate.m
//  ChocoCore
//
//  Created by Chan Ivan on 12/2/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "DefaultResourceLoadDelegate.h"
#include "WebViewDefine.h"

@implementation DefaultResourceLoadDelegate
#pragma mark - ResourceLoad Delegate
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
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:identifierForInitialRequest:fromDataSource:)])
    {
        return [documentView webView:webView identifierForInitialRequest:request fromDataSource:dataSource];
    }
    
    return request;
}

/*!
 @method webView:resource:willSendRequest:redirectResponse:fromDataSource:
 @discussion This message is sent before a load is initiated.  The request may be modified
 as necessary by the receiver.
 @param webView The WebView sending the message.
 @param identifier An identifier that can be used to track the progress of a resource load across
 multiple call backs.
 @param request The request about to be sent.
 @param redirectResponse If the request is being made in response to a redirect we received,
 the response that conveyed that redirect.
 @param dataSource The dataSource that initiated the load.
 @result Returns the request, which may be mutated by the implementor, although typically
 will be request.
 */
- (NSURLRequest *)webView:(WebView *)webView resource:(id)identifier willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse fromDataSource:(WebDataSource *)dataSource
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:resource:willSendRequest:redirectResponse:fromDataSource:)])
    {
        return [documentView webView:webView resource:identifier willSendRequest:request redirectResponse:redirectResponse fromDataSource:dataSource];
    }
    
    return request;
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
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:resource:didReceiveAuthenticationChallenge:fromDataSource:)])
    {
        [documentView webView:webView resource:identifier didReceiveAuthenticationChallenge:challenge fromDataSource:dataSource];
    }
}

/*!
 @method webView:resource:didCancelAuthenticationChallenge:fromDataSource:
 @abstract Cancel authentication for a given request
 @param challenge The NSURLAuthenticationChallenge for which to cancel authentication
 */
- (void)webView:(WebView *)webView resource:(id)identifier didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge fromDataSource:(WebDataSource *)dataSource
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:resource:didCancelAuthenticationChallenge:fromDataSource:)])
    {
        [documentView webView:webView resource:identifier didCancelAuthenticationChallenge:challenge fromDataSource:dataSource];
    }
}

/*!
 @method webView:resource:didReceiveResponse:fromDataSource:
 @abstract This message is sent after a response has been received for this load.
 @param webView The WebView sending the message.
 @param identifier An identifier that can be used to track the progress of a resource load across
 multiple call backs.
 @param response The response for the request.
 @param dataSource The dataSource that initiated the load.
 @discussion In some rare cases, multiple responses may be received for a single load.
 This occurs with multipart/x-mixed-replace, or "server push". In this case, the client
 should assume that each new response resets progress so far for the resource back to 0,
 and should check the new response for the expected content length.
 */
- (void)webView:(WebView *)webView resource:(id)identifier didReceiveResponse:(NSURLResponse *)response fromDataSource:(WebDataSource *)dataSource
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:resource:didReceiveResponse:fromDataSource:)])
    {
        [documentView webView:webView resource:identifier didReceiveResponse:response fromDataSource:dataSource];
    }
}

/*!
 @method webView:resource:didReceiveContentLength:fromDataSource:
 @discussion Multiple of these messages may be sent as data arrives.
 @param webView The WebView sending the message.
 @param identifier An identifier that can be used to track the progress of a resource load across
 multiple call backs.
 @param length The amount of new data received.  This is not the total amount, just the new amount received.
 @param dataSource The dataSource that initiated the load.
 */
- (void)webView:(WebView *)webView resource:(id)identifier didReceiveContentLength:(NSInteger)length fromDataSource:(WebDataSource *)dataSource
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:resource:didReceiveContentLength:fromDataSource:)])
    {
        [documentView webView:webView resource:identifier didReceiveContentLength:length fromDataSource:dataSource];
    }
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
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:resource:didFinishLoadingFromDataSource:)])
    {
        [documentView webView:webView resource:identifier didFinishLoadingFromDataSource:dataSource];
    }
}

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
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:resource:didFailLoadingWithError:fromDataSource:)])
    {
        [documentView webView:webView resource:identifier didFailLoadingWithError:error fromDataSource:dataSource];
    }
}

/*!
 @method webView:plugInFailedWithError:dataSource:
 @discussion Called when a plug-in is not found, fails to load or is not available for some reason.
 @param webView The WebView sending the message.
 @param error The plug-in error. In the userInfo dictionary of the error, the object for the
 NSErrorFailingURLKey key is a URL string of the SRC attribute, the object for the WebKitErrorPlugInNameKey
 key is a string of the plug-in's name, the object for the WebKitErrorPlugInPageURLStringKey key is a URL string
 of the PLUGINSPAGE attribute and the object for the WebKitErrorMIMETypeKey key is a string of the TYPE attribute.
 Some, none or all of the mentioned attributes can be present in the userInfo. The error returns nil for userInfo
 when none are present.
 @param dataSource The dataSource that contains the plug-in.
 */
- (void)webView:(WebView *)webView plugInFailedWithError:(NSError *)error dataSource:(WebDataSource *)dataSource
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:plugInFailedWithError:dataSource:)])
    {
        [documentView webView:webView plugInFailedWithError:error dataSource:dataSource];
    }
}

#pragma mark ResourceLoad Delegate
- (void)webView:(WebView *)webView didLoadResourceFromMemoryCache:(NSURLRequest *)request response:(NSURLResponse *)response length:(NSInteger)length fromDataSource:(WebDataSource *)dataSource
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didLoadResourceFromMemoryCache:response:length:fromDataSource:)])
    {
        [documentView webView:webView  didLoadResourceFromMemoryCache:request response:response length:length fromDataSource:dataSource];
    }
}

- (BOOL)webView:(WebView *)webView resource:(id)identifier shouldUseCredentialStorageForDataSource:(WebDataSource *)dataSource
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:resource:shouldUseCredentialStorageForDataSource:)])
    {
        return [documentView webView:webView resource:identifier shouldUseCredentialStorageForDataSource:dataSource];
    }
    
    return YES;
}

/*!
 @method webView:resource:canAuthenticateAgainstProtectionSpace:forDataSource:
 @abstract Inspect an NSURLProtectionSpace before an authentication attempt is made. Only used on Snow Leopard or newer.
 @param protectionSpace an NSURLProtectionSpace that will be used to generate an authentication challenge
 @result Return YES if the resource load delegate is prepared to respond to an authentication challenge generated with protectionSpace, NO otherwise
 */
- (BOOL)webView:(WebView *)webView resource:(id)identifier canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace forDataSource:(WebDataSource *)dataSource
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:resource:canAuthenticateAgainstProtectionSpace:forDataSource:)])
    {
        return [documentView webView:webView resource:identifier canAuthenticateAgainstProtectionSpace:protectionSpace forDataSource:dataSource];
    }
    
    return YES;
}

/*!
 @method webView:shouldPaintBrokenImageForURL:(NSURL*)imageURL
 @abstract This message is sent when an image cannot be decoded or displayed.
 @param imageURL The url of the broken image.
 @result return YES if WebKit should paint the default broken image.
 */
- (BOOL)webView:(WebView *)webView shouldPaintBrokenImageForURL:(NSURL *)imageURL
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:shouldPaintBrokenImageForURL:)])
    {
        return [documentView webView:webView shouldPaintBrokenImageForURL:imageURL];
    }
    
    return YES;
}

@end
