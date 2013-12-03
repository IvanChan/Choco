//
//  DefaultUIKitDelegate.m
//  ChocoCore
//
//  Created by Chan Ivan on 12/3/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "DefaultUIKitDelegate.h"
#import "CCWebView.h"
#import "WebViewDefine.h"
#import <objc/message.h>
#define CC_DOCUMENT_VIEW ((id)[self.ccWebView documentView])

@class WebHistoryItem, WebPluginPackage, DOMNode, DOMDocumentFragment;
@protocol WebOpenPanelResultListener;
@implementation DefaultUIKitDelegate

- (CGPoint)contentsPointForWebView:(WebView *)webView
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(contentsPointForWebView:)])
    {
        return [CC_DOCUMENT_VIEW contentsPointForWebView:webView];
    }
    
    return CGPointZero;
}

- (CGRect)documentVisibleRectForWebView:(WebView *)webView
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(documentVisibleRectForWebView:)])
    {
        return [CC_DOCUMENT_VIEW documentVisibleRectForWebView:webView];
    }
    
    return CGRectZero;
}

- (void)webView:(WebView *)webView didStartProvisionalLoadForFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didStartProvisionalLoadForFrame:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didStartProvisionalLoadForFrame:frame];
    }
}

- (void)webView:(WebView *)webView didCommitLoadForFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didCommitLoadForFrame:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didCommitLoadForFrame:frame];
    }
}

- (void)webView:(WebView *)webView didFinishLoadForFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didFinishLoadForFrame:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didFinishLoadForFrame:frame];
    }
}

- (void)webView:(WebView *)webView saveStateToHistoryItem:(WebHistoryItem *)item forFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:saveStateToHistoryItem:forFrame:)])
    {
        [CC_DOCUMENT_VIEW webView:webView saveStateToHistoryItem:item forFrame:frame];
    }
}

- (void)webView:(WebView *)webView restoreStateFromHistoryItem:(WebHistoryItem *)item forFrame:(WebFrame *)frame force:(BOOL)force
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:restoreStateFromHistoryItem:forFrame:force:)])
    {
        [CC_DOCUMENT_VIEW webView:webView restoreStateFromHistoryItem:item forFrame:frame force:force];
    }
}

- (void)webView:(WebView *)webView didReceiveViewportArguments:(NSDictionary *)arguments
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didReceiveViewportArguments:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didReceiveViewportArguments:arguments];
    }
}

- (void)webView:(WebView *)webView needsScrollNotifications:(NSNumber *)aNumber forFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:needsScrollNotifications:forFrame:)])
    {
        [CC_DOCUMENT_VIEW webView:webView needsScrollNotifications:aNumber forFrame:frame];
    }
}

- (void)webView:(WebView *)webView didObserveDeferredContentChange:(id)aChange forFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didObserveDeferredContentChange:forFrame:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didObserveDeferredContentChange:aChange forFrame:frame];
    }
}

- (void)webViewDidPreventDefaultForEvent:(WebView *)webView
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webViewDidPreventDefaultForEvent:)])
    {
        [CC_DOCUMENT_VIEW webViewDidPreventDefaultForEvent:webView];
    }
}

- (BOOL)webView:(WebView *)webView shouldScrollToPoint:(CGPoint)point forFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:shouldScrollToPoint:forFrame:)])
    {
        return [CC_DOCUMENT_VIEW webView:webView shouldScrollToPoint:point forFrame:frame];
    }
    
    return YES;
}

- (void)webView:(WebView *)webView willCloseFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:willCloseFrame:)])
    {
        [CC_DOCUMENT_VIEW webView:webView willCloseFrame:frame];
    }
}

- (void)webView:(WebView *)webView didFinishDocumentLoadForFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didFinishDocumentLoadForFrame:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didFinishDocumentLoadForFrame:frame];
    }
}

- (void)webView:(WebView *)webView didFailLoadWithError:(NSError *)error forFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didFailLoadWithError:forFrame:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didFailLoadWithError:error forFrame:frame];
    }
}

- (void)webView:(WebView *)webView didChangeLocationWithinPageForFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didChangeLocationWithinPageForFrame:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didChangeLocationWithinPageForFrame:frame];
    }
}

- (void)webView:(WebView *)webView didFirstLayoutInFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didFirstLayoutInFrame:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didFirstLayoutInFrame:frame];
    }
}

- (void)webView:(WebView *)webView didFirstVisuallyNonEmptyLayoutInFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didFirstVisuallyNonEmptyLayoutInFrame:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didFirstVisuallyNonEmptyLayoutInFrame:frame];
    }
}

- (void)webView:(WebView *)webView elementDidFocusNode:(DOMNode *)node
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:elementDidFocusNode:)])
    {
        [CC_DOCUMENT_VIEW webView:webView elementDidFocusNode:node];
    }
}

- (void)webView:(WebView *)webView elementDidBlurNode:(DOMNode *)node
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:elementDidBlurNode:)])
    {
        [CC_DOCUMENT_VIEW webView:webView elementDidBlurNode:node];
    }
}

- (void)webViewDidRestoreFromPageCache:(WebView *)webView
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webViewDidRestoreFromPageCache:)])
    {
        [CC_DOCUMENT_VIEW webViewDidRestoreFromPageCache:webView];
    }
}

- (void)webView:(WebView *)webView didReceiveDocTypeForFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didReceiveDocTypeForFrame:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didReceiveDocTypeForFrame:frame];
    }
}

- (UIView *)webView:(WebView *)webView plugInViewWithArguments:(NSDictionary *)arguments fromPlugInPackage:(WebPluginPackage *)package
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:plugInViewWithArguments:fromPlugInPackage:)])
    {
        return [CC_DOCUMENT_VIEW webView:webView plugInViewWithArguments:arguments fromPlugInPackage:package];
    }
    
    return nil;
}

- (void)webView:(WebView *)webView willShowFullScreenForPlugInView:(id)plugInView
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:willShowFullScreenForPlugInView:)])
    {
        [CC_DOCUMENT_VIEW webView:webView willShowFullScreenForPlugInView:plugInView];
    }
}

- (void)webView:(WebView *)webView didHideFullScreenForPlugInView:(id)plugInView
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didHideFullScreenForPlugInView:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didHideFullScreenForPlugInView:plugInView];
    }
}

- (void)webView:(WebView *)webView didReceiveMessage:(NSDictionary *)aMessage
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didReceiveMessage:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didReceiveMessage:aMessage];
    }
}

// FIXME: to be removed when UIKit implements the new one below.
- (void)addInputString:(NSString *)str fromVariantKey:(BOOL)isPopupVariant
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(addInputString:fromVariantKey:)])
    {
        [CC_DOCUMENT_VIEW addInputString:str fromVariantKey:isPopupVariant];
    }
}

- (void)addInputString:(NSString *)str withFlags:(NSUInteger)flags
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(addInputString:withFlags:)])
    {
        [CC_DOCUMENT_VIEW addInputString:str withFlags:flags];
    }
}

- (void)deleteFromInput
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(deleteFromInput)])
    {
        [CC_DOCUMENT_VIEW deleteFromInput];
    }
}

- (void)_webthread_webView:(WebView *)sender attachRootLayer:(id)layer
{
}

- (void)webViewDidCommitCompositingLayerChanges:(WebView *)webView
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webViewDidCommitCompositingLayerChanges:)])
    {
        [CC_DOCUMENT_VIEW webViewDidCommitCompositingLayerChanges:webView];
    }
}

- (void)webView:(WebView *)webView didCreateOrUpdateScrollingLayer:(id)layer withContentsLayer:(id)contentsLayer scrollSize:(NSValue*)sizeValue forNode:(DOMNode *)node
allowHorizontalScrollbar:(BOOL)allowHorizontalScrollbar allowVerticalScrollbar:(BOOL)allowVerticalScrollbar
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didCreateOrUpdateScrollingLayer:withContentsLayer:scrollSize:forNode:allowHorizontalScrollbar:allowVerticalScrollbar:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didCreateOrUpdateScrollingLayer:layer withContentsLayer:contentsLayer scrollSize:sizeValue forNode:node allowHorizontalScrollbar:allowHorizontalScrollbar allowVerticalScrollbar:allowVerticalScrollbar];
    }
}

- (void)webView:(WebView *)webView willRemoveScrollingLayer:(id)layer withContentsLayer:(id)contentsLayer forNode:(DOMNode *)node
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:willRemoveScrollingLayer:withContentsLayer:forNode:)])
    {
        [CC_DOCUMENT_VIEW webView:webView willRemoveScrollingLayer:layer withContentsLayer:contentsLayer forNode:node];
    }
}

- (void)revealedSelectionByScrollingWebFrame:(WebFrame *)webFrame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(revealedSelectionByScrollingWebFrame:)])
    {
        [CC_DOCUMENT_VIEW revealedSelectionByScrollingWebFrame:webFrame];
    }
}

- (void)webViewDidLayout:(WebView *)webView
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webViewDidLayout:)])
    {
        [CC_DOCUMENT_VIEW webViewDidLayout:webView];
    }
}

- (void)webViewDidStartOverflowScroll:(WebView *)webView
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webViewDidStartOverflowScroll:)])
    {
        [CC_DOCUMENT_VIEW webViewDidStartOverflowScroll:webView];
    }
}

- (void)webViewDidEndOverflowScroll:(WebView *)webView
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webViewDidEndOverflowScroll:)])
    {
        [CC_DOCUMENT_VIEW webViewDidEndOverflowScroll:webView];
    }
}

- (void)webView:(WebView *)webView runOpenPanelForFileButtonWithResultListener:(id<WebOpenPanelResultListener>)resultListener allowMultipleFiles:(BOOL)allowMultipleFiles acceptMIMETypes:(NSArray *)mimeTypes
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:runOpenPanelForFileButtonWithResultListener:allowMultipleFiles:acceptMIMETypes:)])
    {
        [CC_DOCUMENT_VIEW webView:webView runOpenPanelForFileButtonWithResultListener:resultListener allowMultipleFiles:allowMultipleFiles acceptMIMETypes:mimeTypes];
    }
    else
    {
        objc_msgSend(resultListener, @selector(cancel));
    }
}

- (NSArray *)checkSpellingOfString:(NSString *)stringToCheck
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(checkSpellingOfString:)])
    {
        return [CC_DOCUMENT_VIEW checkSpellingOfString:stringToCheck];
    }
    
    return nil;
}

- (void)writeDataToPasteboard:(NSDictionary *)representations
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(writeDataToPasteboard:)])
    {
        [CC_DOCUMENT_VIEW writeDataToPasteboard:representations];
    }
}

- (NSArray *)readDataFromPasteboard:(NSString *)type withIndex:(NSInteger)index
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(readDataFromPasteboard:withIndex:)])
    {
        return [CC_DOCUMENT_VIEW readDataFromPasteboard:type withIndex:index];
    }
    
    return nil;
}

- (NSInteger)getPasteboardItemsCount
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(getPasteboardItemsCount)])
    {
        return [CC_DOCUMENT_VIEW getPasteboardItemsCount];
    }
    
    return 0;
}

- (NSArray *)supportedPasteboardTypesForCurrentSelection
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(supportedPasteboardTypesForCurrentSelection)])
    {
        return [CC_DOCUMENT_VIEW supportedPasteboardTypesForCurrentSelection];
    }
    
    return nil;
}

- (BOOL)hasRichlyEditableSelection
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(hasRichlyEditableSelection)])
    {
        return [CC_DOCUMENT_VIEW hasRichlyEditableSelection];
    }
    
    return NO;
}

- (BOOL)performsTwoStepPaste:(DOMDocumentFragment *)fragment
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(performsTwoStepPaste:)])
    {
        return [CC_DOCUMENT_VIEW performsTwoStepPaste:fragment];
    }
    
    return NO;
}

- (NSInteger)getPasteboardChangeCount
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(getPasteboardChangeCount)])
    {
        return [CC_DOCUMENT_VIEW getPasteboardChangeCount];
    }
    
    return 0;
}

- (BOOL)isUnperturbedDictationResultMarker:(id)metadataForMarker
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(isUnperturbedDictationResultMarker:)])
    {
        return [CC_DOCUMENT_VIEW isUnperturbedDictationResultMarker:metadataForMarker];
    }
    
    return NO;
}

- (void)webView:(WebView *)webView willAddPlugInView:(id)plugInView
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:willAddPlugInView:)])
    {
        [CC_DOCUMENT_VIEW webView:webView willAddPlugInView:plugInView];
    }
}

- (void)webViewDidDrawTiles:(WebView *)webView
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webViewDidDrawTiles:)])
    {
        [CC_DOCUMENT_VIEW webViewDidDrawTiles:webView];
    }
}

- (void)webView:(WebView *)webView addMessageToConsole:(NSDictionary *)message withSource:(NSString *)source
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:addMessageToConsole:withSource:)])
    {
        [CC_DOCUMENT_VIEW webView:webView addMessageToConsole:message withSource:source];
    }
}

- (void)webView:(WebView *)webView didReceiveViewportArguments:(id)arg1 forFrame:(WebFrame *)frame
{
    if ([CC_DOCUMENT_VIEW respondsToSelector:@selector(webView:didReceiveViewportArguments:forFrame:)])
    {
        [CC_DOCUMENT_VIEW webView:webView didReceiveViewportArguments:arg1 forFrame:frame];
    }
}



@end
