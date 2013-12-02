//
//  DefaultPolicyDelegate.m
//  ChocoCore
//
//  Created by Chan Ivan on 12/2/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "DefaultPolicyDelegate.h"
#import "WebViewDefine.h"

@implementation DefaultPolicyDelegate
#pragma mark - Policy Delegate
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
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:decidePolicyForNavigationAction:request:frame:decisionListener:)])
    {
        [documentView webView:webView decidePolicyForNavigationAction:actionInformation request:request frame:frame decisionListener:listener];
    }
    else
    {
        [listener use];
    }
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
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:decidePolicyForNewWindowAction:request:newFrameName:decisionListener:)])
    {
        [documentView webView:webView decidePolicyForNewWindowAction:actionInformation request:request newFrameName:frameName decisionListener:listener];
    }
    else
    {
        [listener use];
    }
}

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
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:decidePolicyForMIMEType:request:frame:decisionListener:)])
    {
        [documentView webView:webView decidePolicyForMIMEType:type request:request frame:frame decisionListener:listener];
    }
    else
    {
        [listener use];
    }
}

/*!
 @method webView:unableToImplementPolicy:error:forURL:inFrame:
 @discussion Called when a WebPolicy could not be implemented. It is up to the client to display appropriate feedback.
 @param policy The policy that could not be implemented.
 @param error The error that caused the policy to not be implemented.
 @param URL The URL of the resource for which a particular action was requested but failed.
 @param frame The frame in which the policy could not be implemented.
 */
- (void)webView:(WebView *)webView unableToImplementPolicyWithError:(NSError *)error frame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:unableToImplementPolicyWithError:frame:)])
    {
        [documentView webView:webView unableToImplementPolicyWithError:error frame:frame];
    }

}

#pragma WebPolicyDelegate Private
// Needed for <rdar://problem/3951283> can view pages from the back/forward cache that should be disallowed by Parental Controls
- (BOOL)webView:(WebView *)webView shouldGoToHistoryItem:(id)item//WebHistoryItem
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:shouldGoToHistoryItem:)])
    {
        [documentView webView:webView shouldGoToHistoryItem:item];
    }
    
    return YES;
}

@end
