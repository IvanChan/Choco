//
//  UIWebBrowserViewProtocol.h
//  ChocoCore
//
//  Created by Chan Ivan on 11/29/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIWebBrowserViewProtocol <NSObject>
//{
//    UIWebFormAccessory                      _accessory;
//    NSObject<UIFormPeripheral>              _input;
//    DOMNode                                 _currentAssistedNode;
//    DOMNode                                 _assistedNodeStartingFocusRedirects;
//    CGRect                                  _inputViewBounds;
//    CGRect                                  _addressViewBounds;
//    float                                   _lastAdjustmentForScroller;
//    unsigned int                            _audioSessionCategoryOverride;
//    bool                                    _accessoryEnabled;
//    bool                                    _forceInputView;
//    bool                                    _formIsAutoFilling;
//    bool                                    _inputViewObeysDOMFocus;
//    bool                                    _allowDOMFocusRedirects;
//    bool                                    _hasEditedTextField;
//    bool                                    _alwaysDispatchesScrollEvents;
//    UIWebTouchEventsGestureRecognizer       _webTouchEventsGestureRecognizer;
//    UIWebFormDelegate                       _formDelegate;
//    UIResponder                             _editingDelegateForEverythingExceptForms;
//    unsigned int                            _dispatchedTouchEvents;
//    NSMutableArray                          _deferredTouchEvents;
//    ?                                       _messages;
//    ?                                       _pdf;
//}

@optional

+ (id)getUIWebBrowserViewForWebFrame:(id)arg0;
+ (float)preferredScrollDecelerationFactor;
+ (char)isAutoFillAllowed;
+ (id)_PDFPageNumberLabel:(char)arg0;

- (id)valueForKey:(id)arg0;
- (void)_clearSelectionAndUI;
- (id)_input;
- (char)canPerformAction:(SEL)arg0 withSender:(id)arg1;
//- (void)_handleKeyEvent:(__GSEvent)arg0;
- (char)_requiresKeyboardWhenFirstResponder;
- (void)_didScroll;
- (id)inputAccessoryView;
- (void)copy:(id)arg0;
- (void)_promptForReplace:(id)arg0;
- (id)_keyboardResponder;
- (char)_requiresKeyboardResetOnReload;
- (id)inputView;
- (void)_keyboardWillShow:(id)arg0;
- (void)_keyboardWillHide:(id)arg0;
- (id)_editingDelegate; //default UIWebView
- (void)accessoryDone;
- (char)isAutoFillMode;
- (void)acceptedAutoFillWord:(id)arg0;
- (id)initWithWebView:(id)arg0 frame:(CGRect)arg1;
- (void)installGestureRecognizers;
- (void)_updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange;
- (void)_resetFormDataForFrame:(id)arg0;
- (void)_clearAllConsoleMessages;
- (void)_updateFixedPositioningObjectsLayoutAfterScroll;
- (void)_updateFixedPositionContent;
- (id)formElement;
- (void)assistFormNode:(id)arg0;
- (id)textFormElement;
- (char)playsNicelyWithGestures;
- (id)textDocument;
- (void)_beginAllowingFocusRedirects;
- (void)_endAllowingFocusRedirects;
- (char)inputViewObeysDOMFocus;
- (void)setInputViewObeysDOMFocus:(char)arg0;
- (void)set_editingDelegateForEverythingExceptForms:(id)arg0;
- (void)_startURLificationIfNeededCoalesce:(char)arg0;
- (void)setAllowsInlineMediaPlayback:(char)arg0;
- (char)allowsInlineMediaPlayback;
- (void)setMediaPlaybackRequiresUserAction:(char)arg0;
- (char)mediaPlaybackRequiresUserAction;
- (void)rotateEnclosingScrollViewToFrame:(CGRect)arg0;
- (void)_updateScrollerViewForInputView:(id)arg0;
- (id)_currentAssistedNode;
- (void)setAlwaysDispatchesScrollEvents:(char)arg0;
- (char)alwaysDispatchesScrollEvents;
- (void)setAudioSessionCategoryOverride:(unsigned int)arg0;
- (void)_keyboardDidChangeFrame:(id)arg0;
- (void)autoFillWithElementValue;
- (void)formDelegateHandleTextChangeWithAutoFillSuggestions:(char)arg0;
- (void)webViewFormEditedStatusHasChanged:(id)arg0;
- (char)isAutoFilling;
- (void)accessoryTab:(char)arg0;
- (void)accessoryAutoFill;
- (void)accessoryClear;
- (void)_startAssistingKeyboard;
- (void)_stopAssistingKeyboard;
- (void)_startAssistingNode:(id)arg0;
- (void)_stopAssistingNode:(id)arg0;
- (CGPoint)_convertWindowPointToViewport:(CGPoint)arg0;
- (void)_keyboardWillChangeFrame:(id)arg0;
- (void)set_accessory:(id)arg0;
- (void)set_input:(id)arg0;
- (void)set_currentAssistedNode:(id)arg0;
- (void)_webTouchEventsRecognized:(id)arg0;
- (char)allowDOMFocusRedirects;
- (char)_keepKeyboardVisibleDuringFocusRedirects;
- (void)_stopAssistingFormNode;
- (void)_displayFormNodeInputView;
- (id)_editingDelegateForEverythingExceptForms;
- (void)_setInputViewBoundsForAutomaticKeyboardInfo:(id)arg0 adjustScrollView:(char)arg1;
- (void)_updateFixedPositioningObjectsLayoutSoon;
- (void)_zoomToNode:(id)arg0 forceScroll:(char)arg1;
- (void)_updateAccessory;
- (char)canAutoFill;
- (void)setAllowDOMFocusRedirects:(char)arg0;
- (void)_scrollCaretToVisible:(id)arg0;
- (void)_autoFillFrame:(id)arg0;
- (char)isDispatchingTouchEvents;
- (void)_startDeferringEvents;
- (void)_dispatchWebEvent:(id)arg0;
- (void)_endDeferringEvents;
- (char)_shouldDeferEvents;
- (void)_deferWebEvent:(id)arg0;
- (void)_handleDeferredEvents;
- (CGRect)_activeRectForRectToCenter:(CGRect)arg0;
- (void)_centerRect:(CGRect)arg0 forSizeChange:(char)arg1 withVisibleHeight:(float)arg2 pinningEdge:(int)arg3 toValue:(float)arg4;
- (void)_zoomToRect:(CGRect)arg0 ensuringVisibilityOfRect:(CGRect)arg1 withScale:(float)arg2 forceScroll:(char)arg3;
- (void)_zoomToRect:(CGRect)arg0 ensuringVisibilityOfRect:(CGRect)arg1 withScale:(float)arg2 forceScroll:(char)arg3 formAssistantFrame:(CGRect)arg4 animationDuration:(double)arg5;
- (void)clearMessagesMatchingMask:(int)arg0;
- (unsigned int)_firstVisiblePDFPageNumber;
- (CGPoint)_originForPDFPageLabelInSuperview:(id)arg0;
- (CGSize)_defaultScrollViewContentSize;
//- (?)scalesForContainerSize:(CGSize)arg0;
//- (void)updateBoundariesOfScrollView:(id)arg0 withScales:(?)arg1;
- (CGRect)rectOfInterestForRotation;
- (float)minimumVerticalContentOffset;
- (float)heightToKeepVisible;
- (CGRect)activeRectForRectOfInterest:(CGRect)arg0;
- (char)considerHeightOfRectOfInterestForRotation;
- (float)scaleForProposedNewScale:(float)arg0 andOldScale:(float)arg1;
- (CGSize)contentSizeForScrollView:(id)arg0;
- (void)_centerRect:(CGRect)arg0 forSizeChange:(char)arg1 withVisibleHeight:(float)arg2 pinningEdge:(int)arg3;
- (void)_zoomToRect:(CGRect)arg0 withScale:(float)arg1;
- (void)_setAddressViewFrame:(CGRect)arg0;
- (id)messagesMatchingMask:(int)arg0;
- (void)_updatePDFPageNumberLabelWithUserScrolling:(char)arg0 animated:(char)arg1;
- (char)_dumpWebArchiveAtPath:(id)arg0;
- (void)_setSelectedDOMRangeAndUpdateUI:(id)arg0;
- (id)_absoluteUrlRelativeToDocumentURL:(id)arg0;
- (id)_accessory;
- (char)isAccessoryEnabled;
- (void)setAccessoryEnabled:(char)arg0;
- (char)hasEditedTextField;
- (void)webView:(id)arg0 addMessageToConsole:(id)arg1 withSource:(id)arg2;
- (void)webViewDidPreventDefaultForEvent:(id)arg0;//UIKit Delegate
- (void)webView:(id)arg0 elementDidFocusNode:(id)arg1;
- (void)webView:(id)arg0 elementDidBlurNode:(id)arg1;
- (void)webView:(id)arg0 didStartProvisionalLoadForFrame:(id)arg1;
- (void)webView:(id)arg0 didFinishLoadForFrame:(id)arg1;
- (void)webView:(id)arg0 didFailLoadWithError:(id)arg1 forFrame:(id)arg2;
- (void)webView:(id)arg0 willCloseFrame:(id)arg1;
- (void)webView:(id)arg0 didFirstLayoutInFrame:(id)arg1;
- (void)webView:(id)arg0 didFirstVisuallyNonEmptyLayoutInFrame:(id)arg1;
- (unsigned int)audioSessionCategoryOverride;
- (char)resignFirstResponder;
- (void)dealloc;
- (id)initWithFrame:(CGRect)arg0;
- (void)setFrame:(CGRect)arg0;
- (void)setBounds:(CGRect)arg0;
- (BOOL)isEditable;;
@end
