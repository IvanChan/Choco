//
//  DefaultUIDelegate.m
//  ChocoCore
//
//  Created by Chan Ivan on 12/2/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "DefaultUIDelegate.h"
#import "WebViewDefine.h"
#import "CCWebView.h"

@implementation DefaultUIDelegate



#pragma mark - UI Delegate
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
 @method webViewShow:
 @param sender The WebView sending the delegate method.
 @abstract Show the window that contains the top level view of the WebView,
 ordering it frontmost.
 @discussion This will only be called just after createWindowWithRequest:
 is used to create a new window.
 */
- (void)webViewShow:(WebView *)sender
{}

/*!
 @method webView:createWebViewModalDialogWithRequest:
 @abstract Create a new window and begin to load the specified request.
 @discussion The newly created window is hidden, and the window operations delegate on the
 new WebViews will get a webViewShow: call.
 @param sender The WebView sending the delegate method.
 @param request The request to load.
 @result The WebView for the new window.
 */
- (WebView *)webView:(WebView *)sender createWebViewModalDialogWithRequest:(NSURLRequest *)request
{
    return sender;
}

/*!
 @method webViewRunModal:
 @param sender The WebView sending the delegate method.
 @abstract Show the window that contains the top level view of the WebView,
 ordering it frontmost. The window should be run modal in the application.
 @discussion This will only be called just after createWebViewModalDialogWithRequest:
 is used to create a new window.
 */
- (void)webViewRunModal:(WebView *)sender
{}

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

#if 0
/*!
 @method webViewFocus:
 @abstract Focus the current window (i.e. makeKeyAndOrderFront:).
 @param The WebView sending the delegate method.
 @discussion Clients showing multiple views in one window may want to
 also do something to focus the one corresponding to this WebView.
 */
- (void)webViewFocus:(WebView *)sender;

/*!
 @method webViewUnfocus:
 @abstract Unfocus the current window.
 @param sender The WebView sending the delegate method.
 @discussion Clients showing multiple views in one window may want to
 also do something to unfocus the one corresponding to this WebView.
 */
- (void)webViewUnfocus:(WebView *)sender;

/*!
 @method webViewFirstResponder:
 @abstract Get the first responder for this window.
 @param sender The WebView sending the delegate method.
 @discussion This method should return the focused control in the
 WebView's view, if any. If the view is out of the window
 hierarchy, this might return something than calling firstResponder
 on the real NSWindow would. It's OK to return either nil or the
 real first responder if some control not in the window has focus.
 */
- (NSResponder *)webViewFirstResponder:(WebView *)sender;

/*!
 @method webView:makeFirstResponder:
 @abstract Set the first responder for this window.
 @param sender The WebView sending the delegate method.
 @param responder The responder to make first (will always be a view)
 @discussion responder will always be a view that is in the view
 subhierarchy of the top-level web view for this WebView. If the
 WebView's top level view is currently out of the view
 hierarchy, it may be desirable to save the first responder
 elsewhere, or possibly ignore this call.
 */
- (void)webView:(WebView *)sender makeFirstResponder:(NSResponder *)responder;

/*!
 @method webView:setStatusText:
 @abstract Set the window's status display, if any, to the specified string.
 @param sender The WebView sending the delegate method.
 @param text The status text to set
 */
- (void)webView:(WebView *)sender setStatusText:(NSString *)text;

/*!
 @method webViewStatusText:
 @abstract Get the currently displayed status text.
 @param sender The WebView sending the delegate method.
 @result The status text
 */
- (NSString *)webViewStatusText:(WebView *)sender;

/*!
 @method webViewAreToolbarsVisible:
 @abstract Determine whether the window's toolbars are currently visible
 @param sender The WebView sending the delegate method.
 @discussion This method should return YES if the window has any
 toolbars that are currently on, besides the status bar. If the app
 has more than one toolbar per window, for example a regular
 command toolbar and a favorites bar, it should return YES from
 this method if at least one is on.
 @result YES if at least one toolbar is visible, otherwise NO.
 */
- (BOOL)webViewAreToolbarsVisible:(WebView *)sender;

/*!
 @method webView:setToolbarsVisible:
 @param sender The WebView sending the delegate method.
 @abstract Set whether the window's toolbars are currently visible.
 @param visible New value for toolbar visibility
 @discussion Setting this to YES should turn on all toolbars
 (except for a possible status bar). Setting it to NO should turn
 off all toolbars (with the same exception).
 */
- (void)webView:(WebView *)sender setToolbarsVisible:(BOOL)visible;

/*!
 @method webViewIsStatusBarVisible:
 @abstract Determine whether the status bar is visible.
 @param sender The WebView sending the delegate method.
 @result YES if the status bar is visible, otherwise NO.
 */
- (BOOL)webViewIsStatusBarVisible:(WebView *)sender;

/*!
 @method webView:setStatusBarVisible:
 @abstract Set whether the status bar is currently visible.
 @param visible The new visibility value
 @discussion Setting this to YES should show the status bar,
 setting it to NO should hide it.
 */
- (void)webView:(WebView *)sender setStatusBarVisible:(BOOL)visible;

/*!
 @method webViewIsResizable:
 @abstract Determine whether the window is resizable or not.
 @param sender The WebView sending the delegate method.
 @result YES if resizable, NO if not.
 @discussion If there are multiple views in the same window, they
 have have their own separate resize controls and this may need to
 be handled specially.
 */
- (BOOL)webViewIsResizable:(WebView *)sender;

/*!
 @method webView:setResizable:
 @abstract Set the window to resizable or not
 @param sender The WebView sending the delegate method.
 @param resizable YES if the window should be made resizable, NO if not.
 @discussion If there are multiple views in the same window, they
 have have their own separate resize controls and this may need to
 be handled specially.
 */
- (void)webView:(WebView *)sender setResizable:(BOOL)resizable;

/*!
 @method webView:setFrame:
 @abstract Set the window's frame rect
 @param sender The WebView sending the delegate method.
 @param frame The new window frame size
 @discussion Even though a caller could set the frame directly using the NSWindow,
 this method is provided so implementors of this protocol can do special
 things on programmatic move/resize, like avoiding autosaving of the size.
 */
- (void)webView:(WebView *)sender setFrame:(NSRect)frame;

/*!
 @method webViewFrame:
 @param sender The WebView sending the delegate method.
 @abstract REturn the window's frame rect
 @discussion
 */
- (NSRect)webViewFrame:(WebView *)sender
{}
#endif

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

#if 0
/*!
 @method webView:runBeforeUnloadConfirmPanelWithMessage:initiatedByFrame:
 @abstract Display a confirm panel by an "before unload" event handler.
 @param sender The WebView sending the delegate method.
 @param message The message to display.
 @param frame The WebFrame whose JavaScript initiated this call.
 @result YES if the user hit OK, NO if the user chose Cancel.
 @discussion Clients should include a message in addition to the one
 supplied by the web page that indicates. The panel should have
 two buttons, e.g. "OK" and "Cancel".
 */
- (BOOL)webView:(WebView *)sender runBeforeUnloadConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WebFrame *)frame
{
    
}
#endif

/*!
 @method webView:runOpenPanelForFileButtonWithResultListener:
 @abstract Display a file open panel for a file input control.
 @param sender The WebView sending the delegate method.
 @param resultListener The object to call back with the results.
 @discussion This method is passed a callback object instead of giving a return
 value so that it can be handled with a sheet.
 */
- (void)webView:(WebView *)webView runOpenPanelForFileButtonWithResultListener:(id/*<WebOpenPanelResultListener>*/)resultListener
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:runOpenPanelForFileButtonWithResultListener:)])
    {
        [documentView webView:webView runOpenPanelForFileButtonWithResultListener:resultListener];
    }
}

/*!
 @method webView:runOpenPanelForFileButtonWithResultListener:allowMultipleFiles
 @abstract Display a file open panel for a file input control that may allow multiple files to be selected.
 @param sender The WebView sending the delegate method.
 @param resultListener The object to call back with the results.
 @param allowMultipleFiles YES if the open panel should allow myltiple files to be selected, NO if not.
 @discussion This method is passed a callback object instead of giving a return
 value so that it can be handled with a sheet.
 */
- (void)webView:(WebView *)sender runOpenPanelForFileButtonWithResultListener:(id/*<WebOpenPanelResultListener>*/)resultListener allowMultipleFiles:(BOOL)allowMultipleFiles
{}

/*!
 @method webView:mouseDidMoveOverElement:modifierFlags:
 @abstract Update the window's feedback for mousing over links to reflect a new item the mouse is over
 or new modifier flags.
 @param sender The WebView sending the delegate method.
 @param elementInformation Dictionary that describes the element that the mouse is over, or nil.
 @param modifierFlags The modifier flags as in NSEvent.
 */
- (void)webView:(WebView *)sender mouseDidMoveOverElement:(NSDictionary *)elementInformation modifierFlags:(NSUInteger)modifierFlags
{}

/*!
 @method webView:contextMenuItemsForElement:defaultMenuItems:
 @abstract Returns the menu items to display in an element's contextual menu.
 @param sender The WebView sending the delegate method.
 @param element A dictionary representation of the clicked element.
 @param defaultMenuItems An array of default NSMenuItems to include in all contextual menus.
 @result An array of NSMenuItems to include in the contextual menu.
 */
- (NSArray *)webView:(WebView *)sender contextMenuItemsForElement:(NSDictionary *)element defaultMenuItems:(NSArray *)defaultMenuItems
{
    return defaultMenuItems;
}

#if 0
/*!
 @method webView:validateUserInterfaceItem:defaultValidation:
 @abstract Controls UI validation
 @param webView The WebView sending the delegate method
 @param item The user interface item being validated
 @pararm defaultValidation Whether or not the WebView thinks the item is valid
 @discussion This method allows the UI delegate to control WebView's validation of user interface items.
 See WebView.h to see the methods to that WebView can currently validate. See NSUserInterfaceValidations and
 NSValidatedUserInterfaceItem for information about UI validation.
 */
- (BOOL)webView:(WebView *)webView validateUserInterfaceItem:(id <NSValidatedUserInterfaceItem>)item defaultValidation:(BOOL)defaultValidation
{}
#endif

/*!
 @method webView:shouldPerformAction:fromSender:
 @abstract Controls actions
 @param webView The WebView sending the delegate method
 @param action The action being sent
 @param sender The sender of the action
 @discussion This method allows the UI delegate to control WebView's behavior when an action is being sent.
 For example, if the action is copy:, the delegate can return YES to allow WebView to perform its default
 copy behavior or return NO and perform copy: in some other way. See WebView.h to see the actions that
 WebView can perform.
 */
- (BOOL)webView:(WebView *)webView shouldPerformAction:(SEL)action fromSender:(id)sender
{
    return YES;
}

#if 0
/*!
 @method webView:dragDestinationActionMaskForDraggingInfo:
 @abstract Controls behavior when dragging to a WebView
 @param webView The WebView sending the delegate method
 @param draggingInfo The dragging info of the drag
 @discussion This method is called periodically as something is dragged over a WebView. The UI delegate can return a mask
 indicating which drag destination actions can occur, WebDragDestinationActionAny to allow any kind of action or
 WebDragDestinationActionNone to not accept the drag.
 */
- (NSUInteger)webView:(WebView *)webView dragDestinationActionMaskForDraggingInfo:(id <NSDraggingInfo>)draggingInfo
{}

/*!
 @method webView:willPerformDragDestinationAction:forDraggingInfo:
 @abstract Informs that WebView will perform a drag destination action
 @param webView The WebView sending the delegate method
 @param action The drag destination action
 @param draggingInfo The dragging info of the drag
 @discussion This method is called after the last call to webView:dragDestinationActionMaskForDraggingInfo: after something is dropped on a WebView.
 This method informs the UI delegate of the drag destination action that WebView will perform.
 */
- (void)webView:(WebView *)webView willPerformDragDestinationAction:(WebDragDestinationAction)action forDraggingInfo:(id <NSDraggingInfo>)draggingInfo
{}

/*!
 @method webView:dragSourceActionMaskForPoint:
 @abstract Controls behavior when dragging from a WebView
 @param webView The WebView sending the delegate method
 @param point The point where the drag started in the coordinates of the WebView
 @discussion This method is called after the user has begun a drag from a WebView. The UI delegate can return a mask indicating
 which drag source actions can occur, WebDragSourceActionAny to allow any kind of action or WebDragSourceActionNone to not begin a drag.
 */
- (NSUInteger)webView:(WebView *)webView dragSourceActionMaskForPoint:(NSPoint)point
{}

/*!
 @method webView:willPerformDragSourceAction:fromPoint:withPasteboard:
 @abstract Informs that a drag a has begun from a WebView
 @param webView The WebView sending the delegate method
 @param action The drag source action
 @param point The point where the drag started in the coordinates of the WebView
 @param pasteboard The drag pasteboard
 @discussion This method is called after webView:dragSourceActionMaskForPoint: is called after the user has begun a drag from a WebView.
 This method informs the UI delegate of the drag source action that will be performed and gives the delegate an opportunity to modify
 the contents of the dragging pasteboard.
 */
- (void)webView:(WebView *)webView willPerformDragSourceAction:(WebDragSourceAction)action fromPoint:(NSPoint)point withPasteboard:(NSPasteboard *)pasteboard
{}

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
 @method webViewHeaderHeight:
 @param webView The WebView sending the delegate method
 @abstract Reserve a height for the printed page header.
 @result The height to reserve for the printed page header, return 0.0 to not reserve any space for a header.
 @discussion The height returned will be used to calculate the rect passed to webView:drawHeaderInRect:.
 */
- (float)webViewHeaderHeight:(WebView *)sender
{}

/*!
 @method webViewFooterHeight:
 @param webView The WebView sending the delegate method
 @abstract Reserve a height for the printed page footer.
 @result The height to reserve for the printed page footer, return 0.0 to not reserve any space for a footer.
 @discussion The height returned will be used to calculate the rect passed to webView:drawFooterInRect:.
 */
- (float)webViewFooterHeight:(WebView *)sender
{}

/*!
 @method webView:drawHeaderInRect:
 @param webView The WebView sending the delegate method
 @param rect The NSRect reserved for the header of the page
 @abstract The delegate should draw a header for the sender in the supplied rect.
 */
- (void)webView:(WebView *)sender drawHeaderInRect:(NSRect)rect
{}

/*!
 @method webView:drawFooterInRect:
 @param webView The WebView sending the delegate method
 @param rect The NSRect reserved for the footer of the page
 @abstract The delegate should draw a footer for the sender in the supplied rect.
 */
- (void)webView:(WebView *)sender drawFooterInRect:(NSRect)rect
{}
#endif

// The following delegate methods are deprecated in favor of the ones above that specify
// the WebFrame whose JavaScript initiated this call.
- (void)webView:(WebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message
{
    
}

- (BOOL)webView:(WebView *)sender runJavaScriptConfirmPanelWithMessage:(NSString *)message
{
    return YES;
}

- (NSString *)webView:(WebView *)sender runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText
{
    return defaultText;
}

#pragma mark - UIDelegate Private

- (void)webView:(WebView *)webView addMessageToConsole:(NSDictionary *)message
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:addMessageToConsole:)])
    {
        [documentView webView:webView addMessageToConsole:message];
    }
}

/*!
 @method webView:addMessageToConsole:withSource:
 @param webView The WebView sending the delegate method.
 @param message A dictionary representation of the console message.
 @param source Where the message came from. See WebConsoleMessageXMLMessageSource and other source types.
 @discussion The dictionary contains the following keys:
 
 <dl>
 <dt>message</dt>
 <dd>The message itself.</dd>
 <dt>lineNumber</dt>
 <dd>If this came from a file, this is the line number in the file this message originates from.</dd>
 <dt>sourceURL</dt>
 <dd>If this came from a file, this is the URL to the file this message originates from.</dd>
 <dt>MessageSource</dt>
 <dd>
 Where the message came from. XML, JavaScript, CSS, etc.
 See WebConsoleMessageXMLMessageSource and similar constants.
 </dd>
 <dt>MessageLevel</dt>
 <dd>
 Severity level of the message. Debug, Log, Warning, etc.
 See WebConsoleMessageDebugMessageLevel and similar constants.
 </dd>
 </dl>
 */
- (void)webView:(WebView *)webView addMessageToConsole:(NSDictionary *)message withSource:(NSString *)source
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:addMessageToConsole:withSource:)])
    {
        [documentView webView:webView addMessageToConsole:message withSource:source];
    }
}


- (UIView *)webView:(WebView *)webView plugInViewWithArguments:(NSDictionary *)arguments
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:plugInViewWithArguments:)])
    {
        return [documentView webView:webView plugInViewWithArguments:arguments];
    }
    
    return nil;
}


// regions is an dictionary whose keys are regions label and values are arrays of WebDashboardRegions.
- (void)webView:(WebView *)webView dashboardRegionsChanged:(NSDictionary *)regions
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:dashboardRegionsChanged:)])
    {
        [documentView webView:webView dashboardRegionsChanged:regions];
    }
}

- (void)webView:(WebView *)webView dragImage:(UIImage *)anImage at:(CGPoint)viewLocation offset:(CGSize)initialOffset event:(UIEvent *)event pasteboard:(id)pboard source:(id)sourceObj slideBack:(BOOL)slideFlag forView:(id)view
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:dragImage:at:offset:event:pasteboard:source:slideBack:forView:)])
    {
        [documentView webView:webView dragImage:anImage at:viewLocation offset:initialOffset event:event pasteboard:pboard source:sourceObj slideBack:slideFlag forView:view];
    }
}

- (void)webView:(WebView *)webView didDrawRect:(CGRect)rect
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didDrawRect:)])
    {
        [documentView webView:webView didDrawRect:rect];
    }
}

- (void)webView:(WebView *)webView didScrollDocumentInFrameView:(id)frameView
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didScrollDocumentInFrameView:)])
    {
        [documentView webView:webView didScrollDocumentInFrameView:frameView];
    }
}

// FIXME: If we ever make this method public, it should include a WebFrame parameter.
- (BOOL)webViewShouldInterruptJavaScript:(WebView *)webView
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webViewShouldInterruptJavaScript:)])
    {
        return [documentView webViewShouldInterruptJavaScript:webView];
    }
    
    return YES;
}

- (void)webView:(WebView *)webView willPopupMenu:(id)menu
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:willPopupMenu:)])
    {
        [documentView webView:webView willPopupMenu:menu];
    }
}

- (void)webView:(WebView *)webView contextMenuItemSelected:(id)item forElement:(NSDictionary *)element
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:contextMenuItemSelected:forElement:)])
    {
        [documentView webView:webView contextMenuItemSelected:item forElement:element];
    }
}

- (void)webView:(WebView *)webView saveFrameView:(id)frameView showingPanel:(BOOL)showingPanel
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:saveFrameView:showingPanel:)])
    {
        [documentView webView:webView saveFrameView:frameView showingPanel:showingPanel];
    }
}

- (BOOL)webView:(WebView *)webView didPressMissingPluginButton:(id)element
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didPressMissingPluginButton:)])
    {
        return [documentView webView:webView didPressMissingPluginButton:element];
    }
    
    return YES;
}

/*!
 @method webView:frame:exceededDatabaseQuotaForSecurityOrigin:database:
 @param sender The WebView sending the delegate method.
 @param frame The WebFrame whose JavaScript initiated this call.
 @param origin The security origin that needs a larger quota.
 @param databaseIdentifier The identifier of the database involved.
 */
- (void)webView:(WebView *)webView frame:(WebFrame *)frame exceededDatabaseQuotaForSecurityOrigin:(id)origin database:(NSString *)databaseIdentifier
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:frame:exceededDatabaseQuotaForSecurityOrigin:database:)])
    {
        [documentView webView:webView frame:frame exceededDatabaseQuotaForSecurityOrigin:origin database:databaseIdentifier];
    }
}

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
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:exceededApplicationCacheOriginQuotaForSecurityOrigin:totalSpaceNeeded:)])
    {
        [documentView webView:webView exceededApplicationCacheOriginQuotaForSecurityOrigin:origin totalSpaceNeeded:totalSpaceNeeded];
    }
}

- (WebView *)webView:(WebView *)webView createWebViewWithRequest:(NSURLRequest *)request windowFeatures:(NSDictionary *)features
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:createWebViewWithRequest:windowFeatures:)])
    {
        return [documentView webView:webView createWebViewWithRequest:request windowFeatures:features];
    }
    
    return webView;
}

- (BOOL)webView:(WebView *)webView shouldReplaceUploadFile:(NSString *)path usingGeneratedFilename:(NSString **)filename
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:shouldReplaceUploadFile:usingGeneratedFilename:)])
    {
        return [documentView webView:webView shouldReplaceUploadFile:path usingGeneratedFilename:filename];
    }
    
    return YES;
}

- (NSString *)webView:(WebView *)webView generateReplacementFile:(NSString *)path
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:generateReplacementFile:)])
    {
        return [documentView webView:webView generateReplacementFile:path];
    }
    else
    {
        return path;
    }
}

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
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:decidePolicyForGeolocationRequestFromOrigin:frame:listener:)])
    {
        [documentView webView:webView decidePolicyForGeolocationRequestFromOrigin:origin frame:frame listener:listener];
    }
}

- (void)webView:(WebView *)webView decidePolicyForNotificationRequestFromOrigin:(id)origin listener:(id/*<WebAllowDenyPolicyListener>*/)listener
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:decidePolicyForNotificationRequestFromOrigin:listener:)])
    {
        [documentView webView:webView decidePolicyForNotificationRequestFromOrigin:origin listener:listener];
    }
}

- (void)webView:(WebView *)webView decidePolicyForUserMediaRequestFromOrigin:(id)origin listener:(id/*<WebAllowDenyPolicyListener>*/)listener
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:decidePolicyForUserMediaRequestFromOrigin:listener:)])
    {
        [documentView webView:webView decidePolicyForUserMediaRequestFromOrigin:origin listener:listener];
    }
}

- (void)webView:(WebView *)webView elementDidFocusNode:(id)node
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:elementDidFocusNode:)])
    {
        [documentView webView:webView elementDidFocusNode:node];
    }
}

- (void)webView:(WebView *)webView elementDidBlurNode:(id)node
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:elementDidBlurNode:)])
    {
        [documentView webView:webView elementDidBlurNode:node];
    }
}

/*!
 @method webView:printFrame:
 @abstract Informs that a WebFrame needs to be printed
 @param webView The WebView sending the delegate method
 @param frameView The WebFrame needing to be printed
 @discussion This method is called when a script or user requests the page to be printed.
 */
- (void)webView:(WebView *)webView printFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:printFrame:)])
    {
        [documentView webView:webView printFrame:frame];
    }
}

- (BOOL)webView:(WebView *)webView supportsFullScreenForElement:(id)element
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:supportsFullScreenForElement:)])
    {
        return [documentView webView:webView supportsFullScreenForElement:element];
    }
    else
    {
        return YES;
    }
}

- (void)webView:(WebView *)webView enterFullScreenForElement:(id)element
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:enterFullScreenForElement:)])
    {
        [documentView webView:webView enterFullScreenForElement:element];
    }
}

- (void)webView:(WebView *)webView exitFullScreenForElement:(id)element
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:exitFullScreenForElement:)])
    {
        [documentView webView:webView exitFullScreenForElement:element];
    }
}


- (void)webView:(WebView *)webView didDrawFrame:(WebFrame *)frame
{
    id documentView = [self.ccWebView documentView];
    
    if ([documentView respondsToSelector:@selector(webView:didDrawFrame:)])
    {
        [documentView webView:webView didDrawFrame:frame];
    }
}

@end
