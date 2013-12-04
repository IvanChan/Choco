//
//  UIWebDocumentViewProtocol.h
//  ChocoCore
//
//  Created by Chan Ivan on 11/29/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebViewCC.h"

@protocol UIWebDocumentViewProtocol <NSObject>

@optional

/*
{
    WKWindow                       	 _wkWindow
    WebView                        	 _webView
    WebViewReachabilityObserver    	 _reachabilityObserver
    id                             	 m_parentTextView
    id                             	 _delegate
    id                             	 _textSuggestionDelegate
    CGRect                         	 _doubleTapRect
    CGRect                         	 _mainDocumentDoubleTapRect
    CGPoint                        	 _scrollPoint
    CGPoint                        	 _doubleTapStartPosition
    double                         	 _doubleTapStartTime
    CGSize                         	 _pendingSize
    int                            	 _orientation
    DOMHTMLElement                 	 _standaloneEditingElement
    CGPoint                        	 _mouseDownPoint
    double                         	 _mouseDownTime
    UIAutoscroll                   	 _autoscroll
    __CFDictionary                 	 _plugInViews
    int                            	 m_selectionGranularity
    CALayer                        	 _contentLayersHostingLayer
    CALayer                        	 _flattenedRotatingContentLayer
    NSMutableSet                   	 _overflowScrollViewsPendingInsertion
    NSMutableSet                   	 _overflowScrollViewsPendingDeletion
    NSMutableSet                   	 _overflowScrollViews
    NSArray                        	 _additionalSubviews
    UITextInputTraits              	 _traits
    <UITextInputDelegate>          	 _inputDelegate
    UITapGestureRecognizer         	 _singleTapGestureRecognizer
    UITapGestureRecognizer         	 _doubleTapGestureRecognizer
    UITapGestureRecognizer         	 _twoFingerDoubleTapGestureRecognizer
    UILongPressGestureRecognizer   	 _highlightLongPressGestureRecognizer
    UILongPressGestureRecognizer   	 _longPressGestureRecognizer
    UIPanGestureRecognizer         	 _twoFingerPanGestureRecognizer
    ?                              	 _interaction
    [5{UIWebDocumentViewViewportConfiguration="size"{CGSize="width"f"height"f}"initialScale"f"minimumScale"f"maximumScale"f"allowsUserScaling"c}] 	 _defaultViewportConfigurations
    UIWebDocumentViewViewportConfiguration 	 _currentViewportConfiguration
    CGSize                         	 _minimumSize
    int                            	 _documentType
    float                          	 _documentScale
    float                          	 _previousDocumentScale
    CGRect                         	 _documentBounds
    CGSize                         	 _fixedLayoutOriginRoundingDelta
    CGSize                         	 _fixedLayoutSizeRoundingDelta
    unsigned int                   	 _customConfigurations
    unsigned int                   	 _mouseDownCount
    unsigned int                   	 _dataDetectorTypes
    b1                             	 _webCoreNeedsSetNeedsDisplay
    b1                             	 _webCoreNeedsDraw
    b1                             	 _ignoresFocusingMouse
    b1                             	 _ignoresKeyEvents
    b1                             	 _autoresizes
    b1                             	 _ignoresViewportOverflowWhenAutoresizing
    b1                             	 _updatingSize
    b1                             	 _scalesToFit
    b1                             	 _updatesScrollView
    b1                             	 _hasCustomScale
    b1                             	 _shouldRestoreScrollPosition
    b1                             	 _pageNeedsReset
    b1                             	 _hasScrollPoint
    b1                             	 _gesturesDisabled
    b1                             	 _doubleTapRectIsReplaced
    b1                             	 _standaloneEditableView
    b1                             	 _widgetEditingView
    b1                             	 _mouseDragged
    b1                             	 _mouseReentrancyGuard
    b1                             	 _isShowingFullScreenPlugIn
    b1                             	 _isSettingRedrawFrame
    b1                             	 _needsScrollNotifications
    b1                             	 _loadsSynchronously
    b1                             	 _mouseDown
    b1                             	 _usePreTimberlineTransparencyBehavior
    b1                             	 _geolocationDialogAllowed
    b1                             	 _usingMinimalTilesDuringLoading
    b2                             	 _sheetsCount
    b1                             	 _didFirstVisuallyNonEmptyLayout
    b1                             	 _loadInProgress
    b1                             	 _uiwdvIsResigningFirstResponder
    b1                             	 _classicViewportMode
    b1                             	 _sizeUpdatesSuspended
    b1                             	 _sizeUpdateOccurredWhileSuspended
    b1                             	 _shouldOnlyRecognizeGesturesOnActiveElements
    b1                             	 _shouldIgnoreCustomViewport
    b1                             	 _ignoresFocusEventFromFirstResponderChange
    b1                             	 _shouldCloseWebViewAtDealloc
    b1                             	 _shouldRemoveUserStyleSheet
    b1                             	 _hasDrawnTiles
    b1                             	 _showingTextStyleOptions
    b1                             	 _subviewCachesNeedUpdate
    b1                             	 _avoidFixedPositionUpdateViaDidScroll
    b1                             	 _inspectorSearchingForNode
    b1                             	 _previousScrollWasScrollToTop
    b1                             	 _skipResettingNeedsScrollNotifications
    WebThreadSafeUndoManager       	 _undoManager
    UIWebSelectionAssistant        	 _webSelectionAssistant
    UITextInteractionAssistant     	 _textSelectionAssistant
    UITextChecker                  	 _textChecker
    UIEdgeInsets                   	 _caretInsets
    UIWebFileUploadPanel           	 _fileUploadPanel
    int                            	 _selectionAffinity
    DOMElement                     	 _dictationResultPlaceholder
    id                             	 _dictationResultPlaceholderRemovalObserver
    DOMRange                       	 _rangeToRestoreAfterDictation
    _UITextServiceSession          	 _definitionSession
    _UITextServiceSession          	 _learnSession
    char                           	 _suppressesIncrementalRendering
}
*/

+ (void)_initializeSafeCategory;
+ (Class)layerClass;
+ (id)standardTextViewPreferences;
+ (double)getTimestamp;
+ (id)_createDefaultHighlightView;
+ (id)_sharedHighlightView;
+ (void)initialize;
+ (char)hasLandscapeOrientation;

- (void)accessibilityScrollDownPage;
- (void)accessibilityScrollUpPage;
- (void)accessibilityScrollRightPage;
- (void)accessibilityScrollLeftPage;
- (void)_accessibilityScrollToFrame:(CGRect)arg0 forView:(id)arg1 ;
- (char)_accessibilityScrollingEnabled;
- (id)_accessibilityDataDetectorScheme:(CGPoint)arg0 ;
- (id)_accessibilityAttributedValueForRange:(NSRange)arg0 ;
- (id)_accessibilityScrollStatus;
- (char)_accessibilityIsScrollAncestor;
- (char)_accessibilityHasTextOperations;
- (void)accessibilityZoomOutAtPoint:(CGPoint)arg0 ;
- (void)accessibilityZoomInAtPoint:(CGPoint)arg0 ;
- (id)_accessibilityHitTest:(CGPoint)arg0 withEvent:(id)arg1 ;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)_accessibilityRootObject;
- (id)_accessibilityDocumentView;
- (void)_accessibilityZoomAtPoint:(CGPoint)arg0 zoomIn:(char)arg1 ;
- (char)_accessibilityIsFirstElementForFocus;
- (id)_accessibilityResponderElement;
- (unsigned long long)accessibilityTraits;
- (id)accessibilityLabel;
- (char)isAccessibilityElement;
- (int)indexOfAccessibilityElement:(id)arg0 ;
- (id)accessibilityElementAtIndex:(int)arg0 ;
- (int)accessibilityElementCount;
- (char)shouldGroupAccessibilityChildren;
- (CGRect)accessibilityFrame;
- (NSDictionary *)_axPluginViews;
- (id)mf_URLsForAttachmentsInRange:(id)arg0 ;
- (void)setIgnoresKeyEvents:(char)arg0 ;
- (void)layoutSubviews;
- (void)setText:(id)arg0 ;
- (char)canPerformAction:(SEL)arg0 withSender:(id)arg1 ;
- (void)actionSheet:(id)arg0 clickedButtonAtIndex:(int)arg1 ;
- (void)actionSheet:(id)arg0 didDismissWithButtonIndex:(int)arg1 ;
- (id)scriptingInfoWithChildren;
- (char)cancelTouchTracking;
- (char)cancelMouseTracking;
- (id)_responderForBecomeFirstResponder;
- (void)deferredBecomeFirstResponder;
- (void)_didMoveFromWindow:(id)arg0 toWindow:(id)arg1 ;
- (void)didMoveToSuperview;
- (void)willMoveToSuperview:(id)arg0 ;
- (CGRect)visibleBounds;
- (CGImageRef)newSnapshotWithRect:(CGRect)arg0 ;
- (CGImageRef)createSnapshotWithRect:(CGRect)arg0 ;
- (char)canBecomeFirstResponder;
- (void)_didScroll;
- (char)gestureRecognizerShouldBegin:(id)arg0 ;
- (char)gestureRecognizer:(id)arg0 canPreventGestureRecognizer:(id)arg1 ;
- (char)gestureRecognizer:(id)arg0 shouldReceiveTouch:(id)arg1 ;
- (CGPoint)autoscrollContentOffset;
- (void)setAutoscrollContentOffset:(CGPoint)arg0 ;
- (CGRect)contentFrameForView:(id)arg0 ;
- (void)_setFont:(id)arg0 ;
- (char)gestureRecognizer:(id)arg0 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)arg1 ;
- (id)interactionAssistant;
- (id)selectionView;
- (id)textInputTraits;
- (void)takeTraitsFrom:(id)arg0 ;
- (char)hasContent;
- (char)hasMarkedText;
- (NSRange)_markedTextNSRange;
- (void)_setTextColor:(id)arg0 ;
- (void)selectAll:(id)arg0 ;
- (id)typingAttributes;
- (void)setTypingAttributes:(id)arg0 ;
- (NSRange)selectionRange;
- (char)keyboardInput:(id)arg0 shouldInsertText:(id)arg1 isMarkedText:(char)arg2 ;
- (char)keyboardInputShouldDelete:(id)arg0 ;
- (char)keyboardInputChanged:(id)arg0 ;
- (void)keyboardInputChangedSelection:(id)arg0 ;
- (void)selectAll;
- (char)canResignFirstResponder;
- (void)clearSelection;
- (void)selectionChanged;
- (id)markedTextRange;
- (void)beginSelectionChange;
- (void)endSelectionChange;
- (void)startAutoscroll:(CGPoint)arg0 ;
- (void)cancelAutoscroll;
- (id)selectionRectsForDOMRange:(id)arg0 ;
- (id)selectedTextRange;
- (id)textInRange:(id)arg0 ;
- (CGRect)closestCaretRectInMarkedTextRangeForPoint:(CGPoint)arg0 ;
- (unsigned int)offsetInMarkedTextForSelection:(id)arg0 ;
- (CGPoint)constrainedPoint:(CGPoint)arg0 ;
- (id)inputDelegate;    //default nil
- (void)cut:(id)arg0 ;
- (void)disableClearsOnInsertion;
- (void)copy:(id)arg0 ;
- (void)selectWord;
- (void)makeTextWritingDirectionRightToLeft:(id)arg0 ;
- (void)makeTextWritingDirectionLeftToRight:(id)arg0 ;
- (void)toggleBoldface:(id)arg0 ;
- (void)toggleItalics:(id)arg0 ;
- (void)toggleUnderline:(id)arg0 ;
- (void)_showTextStyleOptions:(id)arg0 ;
- (void)replace:(id)arg0 ;
- (void)paste:(id)arg0 ;
- (void)_promptForReplace:(id)arg0 ;
- (void)select:(id)arg0 ;
- (void)_define:(id)arg0 ;
- (void)_addShortcut:(id)arg0 ;
- (char)inPopover;
- (id)tokenizer;
- (void)deleteBackward;
- (void)insertDictationResult:(id)arg0 withCorrectionIdentifier:(id)arg1 ;
- (id)insertDictationResultPlaceholder;
- (void)removeDictationResultPlaceholder:(id)arg0 willInsertResult:(char)arg1 ;
- (CGRect)frameForDictationResultPlaceholder:(id)arg0 ;
- (id)metadataDictionariesForDictationResults;
- (char)hasText;
- (void)replaceRange:(id)arg0 withText:(id)arg1 ;
- (void)setSelectedTextRange:(id)arg0 ;
- (id)markedTextStyle;
- (void)setMarkedTextStyle:(id)arg0 ;
- (void)unmarkText;
- (id)beginningOfDocument;
- (id)endOfDocument;
- (id)textRangeFromPosition:(id)arg0 toPosition:(id)arg1 ;
- (id)positionFromPosition:(id)arg0 offset:(int)arg1 ;
- (id)positionFromPosition:(id)arg0 inDirection:(int)arg1 offset:(int)arg2 ;
- (int)comparePosition:(id)arg0 toPosition:(id)arg1 ;
- (int)offsetFromPosition:(id)arg0 toPosition:(id)arg1 ;
- (void)setInputDelegate:(id)arg0 ;
- (id)positionWithinRange:(id)arg0 farthestInDirection:(int)arg1 ;
- (id)characterRangeByExtendingPosition:(id)arg0 inDirection:(int)arg1 ;
- (int)baseWritingDirectionForPosition:(id)arg0 inDirection:(int)arg1 ;
- (void)setBaseWritingDirection:(int)arg0 forRange:(id)arg1 ;
- (CGRect)firstRectForRange:(id)arg0 ;
- (CGRect)caretRectForPosition:(id)arg0 ;
- (id)closestPositionToPoint:(CGPoint)arg0 ;
- (id)closestPositionToPoint:(CGPoint)arg0 withinRange:(id)arg1 ;
- (id)characterRangeAtPoint:(CGPoint)arg0 ;
- (int)selectionAffinity;
- (void)setSelectionAffinity:(int)arg0 ;
- (id)positionAtStartOrEndOfWord:(id)arg0 ;
- (int)selectionGranularity;
- (void)setSelectionGranularity:(int)arg0 ;
- (id)selectionRectsForRange:(id)arg0 ;
- (char)keyboardInput:(id)arg0 shouldReplaceTextInRange:(NSRange)arg1 replacementText:(id)arg2 ;
- (CGRect)_selectionClipRect;
- (id)initSimpleHTMLDocumentWithStyle:(id)arg0 frame:(CGRect)arg1 preferences:(id)arg2 groupName:(id)arg3 ;
- (void)setIgnoresFocusingMouse:(char)arg0 ;
- (void)scrollSelectionToVisible:(char)arg0 ;
- (CGRect)rectForNSRange:(NSRange)arg0 ;
- (void)setSelectionWithPoint:(CGPoint)arg0 ;
- (CGRect)caretRect;
- (CGRect)caretRectForVisiblePosition:(id)arg0 ;
- (id)_textSelectingContainer;
- (id)textColorForCaretSelection;
- (char)isInsideRichlyEditableTextWidget;
- (id)automaticallySelectedOverlay;
- (char)mouseEventsChangeSelection;
- (void)setDataDetectorTypes:(unsigned int)arg0 ;
- (unsigned int)dataDetectorTypes;
- (void)setLoadsSynchronously:(char)arg0 ;
- (void)_setParentTextView:(id)arg0 ;
- (char)makeWKFirstResponder;
- (char)clearWKFirstResponder;
- (void)_removeDefinitionController:(char)arg0 ;
- (void)setSelectionToEnd;
- (void)ensureSelection;
- (void)setSelectedDOMRange:(id)arg0 affinity:(int)arg1 ;
- (id)_focusedOrMainFrame;
- (void)setAllowsDataDetectorsSheet:(char)arg0 ;
- (unsigned int)effectiveDataDetectorTypes;
- (void)tapInteractionWithLocation:(CGPoint)arg0 ;
- (void)startInteractionWithLocation:(CGPoint)arg0 ;
- (void)continueInteractionWithLocation:(CGPoint)arg0 ;
- (void)validateInteractionWithLocation:(CGPoint)arg0 ;
- (void)cancelInteraction;
- (char)startActionSheet;
- (char)isInInteraction;
- (char)willInteractWithLocation:(CGPoint)arg0 ;
- (void)updateSelection;
- (char)becomesEditableWithGestures;
- (void)setBecomesEditableWithGestures:(char)arg0 ;
- (void)setBottomBufferHeight:(float)arg0 ;
- (float)_documentScale;
- (void)didRemovePlugInView:(id)arg0 ;
- (void)_setSubviewCachesNeedUpdate:(char)arg0 ;
- (id)_parentTextView;
- (char)requiresKeyEvents;
- (void)setContinuousSpellCheckingEnabled:(char)arg0 ;
- (void)setSelectedDOMRange:(id)arg0 affinityDownstream:(char)arg1 ;
- (void)replaceRangeWithTextWithoutClosingTyping:(id)arg0 replacementText:(id)arg1 ;
- (CGRect)rectContainingCaretSelection;
- (void)handleKeyWebEvent:(id)arg0 ;
- (id)previousUnperturbedDictationResultBoundaryFromPosition:(id)arg0 ;
- (id)nextUnperturbedDictationResultBoundaryFromPosition:(id)arg0 ;
- (void)moveBackward:(unsigned int)arg0 ;
- (void)moveForward:(unsigned int)arg0 ;
- (unsigned short)characterBeforeCaretSelection;
- (id)wordContainingCaretSelection;
- (id)wordRangeContainingCaretSelection;
- (id)markedText;
- (void)setMarkedText:(id)arg0 ;
- (id)fontForCaretSelection;
- (id)rangeEnclosingPosition:(id)arg0 withGranularity:(int)arg1 inDirection:(int)arg2 ;
- (char)isPosition:(id)arg0 atBoundary:(int)arg1 inDirection:(int)arg2 ;
- (id)positionFromPosition:(id)arg0 toBoundary:(int)arg1 inDirection:(int)arg2 ;
- (char)isPosition:(id)arg0 withinTextUnit:(int)arg1 inDirection:(int)arg2 ;
- (void)collapseSelection;
- (char)selectionIsCaretInDisplayBlockElementAtOffset:(int)arg0 ;
- (CGRect)_lastRectForRange:(id)arg0 ;
- (void)addInputString:(id)arg0 ;
- (void)replaceRangeWithText:(NSRange)arg0 replacementText:(id)arg1 ;
- (void)replaceCurrentWordWithText:(id)arg0 ;
- (void)confirmMarkedText:(id)arg0 ;
- (unsigned short)characterInRelationToCaretSelection:(int)arg0 ;
- (unsigned short)characterAfterCaretSelection;
- (void)expandSelectionToStartOfWordContainingCaretSelection;
- (int)wordOffsetInRange:(id)arg0 ;
- (char)selectionAtDocumentStart;
- (char)selectionAtWordStart;
- (id)rangeByMovingCurrentSelection:(int)arg0 ;
- (id)rangeByExtendingCurrentSelection:(int)arg0 ;
- (void)extendCurrentSelection:(int)arg0 ;
- (CGRect)convertCaretRect:(CGRect)arg0 ;
- (char)hasEditableSelection;
- (void)_reachabilityManagerNotifiedIsReachable:(char)arg0 ;
- (void)setInitialScale:(float)arg0 forDocumentTypes:(int)arg1 ;
- (void)setMinimumScale:(float)arg0 forDocumentTypes:(int)arg1 ;
- (void)setMaximumScale:(float)arg0 forDocumentTypes:(int)arg1 ;
- (void)setAllowsUserScaling:(char)arg0 forDocumentTypes:(int)arg1 ;
- (void)setViewportSize:(CGSize)arg0 forDocumentTypes:(int)arg1 ;
- (CGRect)webViewFrameForUIFrame:(CGRect)arg0 ;
- (id)initWithWebView:(id)arg0 frame:(CGRect)arg1 ;
- (void)installGestureRecognizers;
- (void)setMinimumSize:(CGSize)arg0 ;
- (void)_restoreViewportSettingsWithSize:(CGSize)arg0 ;
- (void)sendOrientationEventForOrientation:(int)arg0 ;
- (void)selectionChanged:(id)arg0 ;
- (void)_resetShowingTextStyle:(id)arg0 ;
- (void)_inspectorDidStartSearchingForNode:(id)arg0 ;
- (void)_inspectorDidStopSearchingForNode:(id)arg0 ;
- (id)_groupName;
- (char)_dataDetectionIsActivated;
- (void)cancelInteractionWithImmediateDisplay:(char)arg0 ;
- (void)_cleanupSheet;
- (void)_updateScrollViewBoundaryZoomScales;
- (void)completeInteraction;
- (void)_runLoadBlock:(id)arg0 ;
- (void)_cleanUpFrameStateAndLoad:(id)arg0 ;
- (void)loadHTMLString:(id)arg0 baseURL:(id)arg1 ;
- (void)_notifyContentHostingLayersOfScaleChange;
- (float)integralScaleForScale:(float)arg0 keepingPointFixed:(CGPoint)arg1 ;
- (float)integralScaleForScale:(float)arg0 ;
- (void)_notifyPlugInViewsOfScaleChange;
- (void)_updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange;
- (float)viewportHeight;
- (float)viewportWidth;
- (float)minimumScale;
- (float)initialScale;
- (void)_setDocumentScale:(float)arg0 ;
- (void)_updateFixedPositionedObjectsLayoutRectUsingWebThread:(char)arg0 synchronize:(char)arg1 ;
- (unsigned int)_applyViewportArguments:(id)arg0 ;
- (void)viewportConfigurationsDidChange:(unsigned int)arg0 ;
- (void)_setDocumentType:(int)arg0 overrideCustomConfigurations:(char)arg1 viewportArguments:(id)arg2 ;
- (void)_setDocumentType:(int)arg0 ;
- (void)sendScrollEventIfNecessaryWasUserScroll:(char)arg0 ;
- (void)setTilingArea:(int)arg0 ;
- (void)resetTilingAfterLoadComplete;
- (void)_selectionLayoutChangedByScrolling:(char)arg0 ;
- (void)_editableSelectionLayoutChangedByScrolling:(char)arg0 ;
- (void)_resetFormDataForFrame:(id)arg0 ;
- (void)_clearDoubleTapRect;
- (void)_clearAllConsoleMessages;
- (void)_WAKViewSizeDidChange:(id)arg0 ;
- (void)setMinimumSize:(CGSize)arg0 updateCurrentViewportConfigurationSize:(char)arg1 ;
- (void)_updateFixedPositioningObjectsLayoutAfterScroll;
- (void)_restoreScrollPointForce:(char)arg0 ;
- (void)_showPendingContentLayers;
- (void)_saveStateToHistoryItem:(id)arg0 ;
- (char)_shouldResetForNewPage;
- (void)_resetForNewPage;
- (void)_cancelLongPressGestureRecognizer;
- (void)_updateFixedPositionContent;
- (CGRect)_documentViewVisibleRect;
- (float)_zoomedDocumentScale;
- (CGRect)_layoutRectForFixedPositionObjects;
- (CGRect)_adjustedLayoutRectForFixedPositionObjects;
- (id)formElement;
- (char)fragmentContainsRichContent:(id)arg0 ;
- (id)_supportedPasteboardTypesForCurrentSelection;
- (void)_addAdditionalSubview:(id)arg0 ;
- (void)_updateSubviewCaches;
- (void)_reshapePlugInViews;
- (void)_noteOverflowScrollViewPendingInsertion:(id)arg0 ;
- (void)_noteOverflowScrollViewPendingDeletion:(id)arg0 ;
- (void)_removeAdditionalSubview:(id)arg0 ;
- (char)_shouldUpdateSubviewCachesForPlugins;
- (char)_isInspectorSearchingForNode;
- (void)_restoreFlattenedContentLayers;
- (void)updateInteractionElements;
- (void)setMediaPlaybackAllowsAirPlay:(char)arg0 ;
- (char)_acceptsFirstResponder;
- (void)_removeShortcutController:(char)arg0 ;
- (void)setInteractionAssistantGestureRecognizers;
- (void)_undoManagerDidUndo:(id)arg0 ;
- (void)_undoManagerDidRedo:(id)arg0 ;
- (char)isEditingSingleLineElement;
- (id)rangeToRestoreAfterDictation;
- (void)setRangeToRestoreAfterDictation:(id)arg0 ;
- (id)dictationResultMetadataForRange:(id)arg0 ;
- (char)hasRangedSelection;
- (char)_dictationPlaceholderHasBeenRemoved;
- (CGRect)convertRectFromSelectedFrameCoordinates:(CGRect)arg0 ;
- (void)_finishedUsingDictationPlaceholder;
- (void)setPaused:(char)arg0 withEvents:(char)arg1 ;
- (char)isShowingFullScreenPlugInUI;
- (CGRect)_shortcutPresentationRect;
- (void)toggleBaseWritingDirection;
- (char)isCaretInEmptyParagraph;
- (void)sendScrollEventIfNecessary;
- (void)_notifyPlugInViewsOfWillBeginZooming;
- (void)_notifyPlugInViewsOfDidZoom;
- (void)_notifyPlugInViewsOfDidEndZooming;
- (unsigned int)_contentSizeInExposedRect:(CGRect)arg0 topLayer:(id)arg1 visibleLayerCount:(int *)arg2 ;
- (char)_shouldFlattenContentLayersForRect:(CGRect)arg0 ;
- (void *)_createIOSurfaceFromRect:(CGRect)arg0 ;
- (char)containsOnlySelectableElements;
- (id)_positionFromPosition:(id)arg0 inDirection:(int)arg1 offset:(int)arg2 withAffinityDownstream:(char)arg3 ;
- (id)webVisiblePositionForPoint:(CGPoint)arg0 ;
- (float)minimumScaleForMinimumSize:(CGSize)arg0 ;
- (void)_handleDoubleTapAtPoint:(CGPoint)arg0 inWebHTMLView:(id)arg1 outRenderRect:(CGRect)arg2 ;
- (float)minimumScaleForSize:(CGSize)arg0 ;
- (float)maximumDoubleTapScale;
- (id)enclosingScrollView;
- (float)zoomedDocumentScale;
- (float)currentDocumentScale;
- (CGRect)visibleContentRect;
- (CGRect)rectOfInterestForPoint:(CGPoint)arg0 ;
- (id)doubleTapScalesForSize:(CGSize)arg0 ;
- (char)considerHeightForDoubleTap;
- (void)willZoomToMinimumScale;
- (char)shouldSelectionAssistantReceiveDoubleTapAtPoint:(CGPoint)arg0 forScale:(float)arg1 ;
- (void)willZoomToLocation:(CGPoint)arg0 atScale:(float)arg1 forDuration:(double)arg2 ;
- (void)fileUploadPanelDidDismiss:(id)arg0 ;
- (void)enableReachability;
- (char)_presentViewController:(id)arg0 animated:(char)arg1 completion:(id)arg2 ;
- (void)_dismissViewControllerAnimated:(char)arg0 completion:(id)arg1 ;
- (char)didFirstVisuallyNonEmptyLayout;
- (char)hasDrawnTiles;
- (char)loadsSynchronously;
- (void)setUserStyleSheet:(id)arg0 ;
- (void)setDetectsPhoneNumbers:(char)arg0 ;
- (char)detectsPhoneNumbers;
- (void)setUsePreTimberlineTransparencyBehavior;
- (float)maximumScale;
- (CGPoint)convertPoint:(CGPoint)arg0 toFrame:(id)arg1 ;
- (CGPoint)convertPoint:(CGPoint)arg0 fromFrame:(id)arg1 ;
- (CGRect)convertRect:(CGRect)arg0 toFrame:(id)arg1 ;
- (CGRect)convertRect:(CGRect)arg0 fromFrame:(id)arg1 ;
- (void)setSizeUpdatesSuspended:(char)arg0 ;
- (char)sizeUpdatesSuspended;
- (void)setShouldIgnoreCustomViewport:(char)arg0 ;
- (char)shouldIgnoreCustomViewport;
- (char)isClassicViewportMode;
- (char)needsScrollNotifications;
- (CGRect)documentBounds;
- (void)setAutoresizes:(char)arg0 ;
- (void)setIgnoresViewportOverflowWhenAutoresizing:(char)arg0 ;
- (void)setUpdatesScrollView:(char)arg0 ;
- (char)updatesScrollView;
- (void)saveStateToCurrentHistoryItem;
- (void)forceLayout;
- (void)setSmoothsFonts:(char)arg0 ;
- (char)_isSubviewOfPlugInView:(id)arg0 ;
- (void)_overflowScrollView:(id)arg0 willStartScrollingForNode:(id)arg1 ;
- (void)_overflowScrollView:(id)arg0 scrollOffsetChangedForNode:(id)arg1 whileScrolling:(char)arg2 ;
- (void)_overflowScrollView:(id)arg0 didEndScrollingForNode:(id)arg1 ;
- (char)_hasSubviewContainingWebContent:(id)arg0 ;
- (void)_renderUnbufferedInContext:(CGContextRef)arg0 ;
- (void)redrawScaledDocument;
- (void)willRotateInteractionSheet;
- (void)didRotateInteractionSheet;
- (void)setShouldOnlyRecognizeGesturesOnActiveElements:(char)arg0 ;
- (char)shouldOnlyRecognizeGesturesOnActiveElements;
- (void)setDoubleTapEnabled:(char)arg0 ;
- (char)isDoubleTapEnabled;
- (void)_handleDoubleTapAtLocation:(CGPoint)arg0 ;
- (void)_handleTwoFingerDoubleTapAtLocation:(CGPoint)arg0 ;
- (CGRect)doubleTapRect;
- (char)doubleTapRectIsReplaced;
- (void)assistFormNode:(id)arg0 ;
- (id)textFormElement;
- (char)isStandaloneEditableView;
- (void)setStandaloneEditingElement:(id)arg0 ;
- (id)standaloneEditingElement;
- (void)setIsWidgetEditingView:(char)arg0 ;
- (char)isWidgetEditingView;
- (char)updateKeyboardStateOnResponderChanges;
- (id)dictationInterpretations;
- (void)replaceSelectionWithWebArchive:(id)arg0 selectReplacement:(char)arg1 smartReplace:(char)arg2 ;
- (id)implementationWebView;
- (char)hasPlugInSubviews;
- (id)webSelectionAssistant;
- (CGRect)visibleFrame;
- (CGRect)visibleContentFrame;
- (CGRect)autoscrollDragFrame;
- (CGRect)autoscrollContentFrame;
- (char)playsNicelyWithGestures;
- (void)useSelectionAssistantWithMode:(int)arg0 ;
- (void)willStartScroll;
- (void)willStartScrollToTop;
- (void)didEndScroll;
- (void)scrollViewWasRemoved;
- (void)willStartZoom;
- (void)didZoom;
- (void)didEndZoom;
- (char)_shouldUseInitialScale;
- (void)_flattenAndSwapContentLayersInRect:(CGRect)arg0 ;
- (void)setTileUpdatesDisabled:(char)arg0 ;
- (char)hasSimpleTextOnlyStructure;
- (void)setSelectedTextRange:(id)arg0 withAffinityDownstream:(char)arg1 ;
- (id)rangeOfEnclosingWord:(id)arg0 ;
- (void)_scrollRectToVisible:(CGRect)arg0 animated:(char)arg1 ;
- (id)_documentUrl;
- (int)documentType;
- (void)setSuppressesIncrementalRendering:(char)arg0 ;
- (id)_doubleTapGestureRecognizer;
- (id)_scriptingInfoForLink:(id)arg0 ;
- (id)_scriptingInfoForForm:(id)arg0 ;
- (UIEdgeInsets)caretInsets;
- (void)clearInteractionTimer;
- (void)highlightApproximateNodeInverted:(char)arg0 ;
- (void)_resetInteractionWithLocation:(CGPoint)arg0 ;
- (void)attemptClick:(id)arg0 ;
- (void)_showDataDetectorsSheet;
- (void)_showLinkSheet;
- (id)approximateNodeAtViewportLocation:(CGPoint)arg0 ;
- (void)_singleTapRecognized:(id)arg0 ;
- (void)_doubleTapRecognized:(id)arg0 ;
- (void)_twoFingerDoubleTapRecognized:(id)arg0 ;
- (void)_highlightLongPressRecognized:(id)arg0 ;
- (void)_longPressRecognized:(id)arg0 ;
- (void)_twoFingerPanRecognized:(id)arg0 ;
- (void)_showImageSheet;
- (SEL)_actionForLongPressOnElement:(id)arg0 ;
- (char)supportsTwoFingerScrollingAtTouchLocation:(CGPoint)arg0 andLocation:(CGPoint)arg1 ;
- (void)sendScrollWheelEvents;
- (void)deferInteraction;
- (void)performClick:(id)arg0 ;
- (id)deepestNodeAtViewportLocation:(CGPoint)arg0 ;
- (void)_sendMouseMoveAndAttemptClick:(id)arg0 ;
- (void)performInteractionSelector:(SEL)arg0 afterDelay:(double)arg1 ;
- (void)resetInteraction;
- (void)hideTapHighlight;
- (id)_targetURL;
- (char)gestureRecognizer:(id)arg0 canBePreventedByGestureRecognizer:(id)arg1 ;
- (void)highlightApproximateNodeAndDisplayInfoSheet;
- (void)setInteractionDelegate:(id)arg0 ;
- (id)interactionDelegate;  //default nil
- (void)setAllowsImageSheet:(char)arg0 ;
- (void)setAllowsLinkSheet:(char)arg0 ;
- (id)interactionElement;
- (CGPoint)interactionLocation;
- (id)superviewForSheet;
- (void)_setAcceptsFirstResponder:(char)arg0 ;
- (void)_createSheetWithElementActions:(id)arg0 showLinkTitle:(char)arg1 ;
- (void)actionDidFinish;
- (CGRect)_presentationRectForSheetGivenPoint:(CGPoint)arg0 inHostView:(id)arg1 ;
- (id)hostViewForSheet:(id)arg0 ;
- (CGRect)initialPresentationRectInHostViewForSheet:(id)arg0 ;
- (CGRect)presentationRectInHostViewForSheet:(id)arg0 ;
- (id)beginPrintModeWithWidth:(float)arg0 height:(float)arg1 startOffset:(float)arg2 shrinkToFit:(char)arg3 tileClippedContent:(char)arg4 ;
- (id)beginPrintModeForFrame:(id)arg0 withWidth:(float)arg1 height:(float)arg2 startOffset:(float)arg3 shrinkToFit:(char)arg4 tileClippedContent:(char)arg5 ;
- (id)beginPrintModeForFrame:(id)arg0 withSize:(CGSize)arg1 startOffset:(float)arg2 minimumLayoutWidth:(float)arg3 maximumLayoutWidth:(float)arg4 tileClippedContent:(char)arg5 ;
- (id)_beginPrintModeForHTMLView:(id)arg0 withSize:(CGSize)arg1 startOffset:(float)arg2 minimumLayoutWidth:(float)arg3 maximumLayoutWidth:(float)arg4 tileClippedContent:(char)arg5 ;
- (id)_beginPrintModeForPDFView:(id)arg0 withSize:(CGSize)arg1 startOffset:(float)arg2 minimumLayoutWidth:(float)arg3 maximumLayoutWidth:(float)arg4 ;
- (void)_drawPDFPagesForPage:(unsigned int)arg0 withPaginationInfo:(id)arg1 ;
- (char)isInPrintMode;
- (id)beginPrintModeWithWidth:(float)arg0 height:(float)arg1 startOffset:(float)arg2 shrinkToFit:(char)arg3 ;
- (void)endPrintMode;
- (void)drawPage:(unsigned int)arg0 withPaginationInfo:(id)arg1 ;
- (id)selectionRects;
- (void)setRangedSelectionBaseToCurrentSelection;
- (void)clearRangedSelectionInitialExtent;
- (void)setRangedSelectionWithExtentPoint:(CGPoint)arg0 ;
- (void)setSelectionWithFirstPoint:(CGPoint)arg0 secondPoint:(CGPoint)arg1 ;
- (CGPoint)convertPointToSelectedFrameCoordinates:(CGPoint)arg0 ;
- (void)setRangedSelectionBaseToCurrentSelectionStart;
- (void)setRangedSelectionBaseToCurrentSelectionEnd;
- (void)setRangedSelectionInitialExtentToCurrentSelectionStart;
- (void)setRangedSelectionInitialExtentToCurrentSelectionEnd;
- (void)setRangedSelectionExtentPoint:(CGPoint)arg0 baseIsStart:(char)arg1 allowFlipping:(char)arg2 ;
- (id)wordAtPoint:(CGPoint)arg0 ;
- (void)smartExtendRangedSelection:(int)arg0 ;
- (void)setCaretInsets:(UIEdgeInsets)arg0 ;
- (char)setRangedSelectionExtentPoint:(CGPoint)arg0 baseIsStart:(char)arg1 ;
- (id)textInDOMRange:(id)arg0 ;
- (id)asText;
- (Class)_printFormatterClass;
- (id)delegate;
- (void)setDelegate:(id)arg0 ;
- (void)setSelectionToStart;
- (void)setIsStandaloneEditableView:(char)arg0 ;
- (void)forwardInvocation:(id)arg0 ;
- (id)methodSignatureForSelector:(SEL)arg0 ;
- (void)dealloc;
- (id)contentView;
- (id)initWithFrame:(CGRect)arg0 ;
- (void)loadData:(id)arg0 MIMEType:(id)arg1 textEncodingName:(id)arg2 baseURL:(id)arg3 ;
- (WebView *)webView;
- (void)setFrame:(CGRect)arg0 ;
- (id)subviews;
- (void)stopLoading:(id)arg0 ;
- (void)webView:(id)arg0 runOpenPanelForFileButtonWithResultListener:(id)arg1 allowMultipleFiles:(char)arg2 acceptMIMETypes:(id)arg3 ;
- (void)webViewDidPreventDefaultForEvent:(id)arg0 ;
- (void)webView:(id)arg0 didReceiveDocTypeForFrame:(id)arg1 ;//TODO:
- (void)webView:(id)arg0 needsScrollNotifications:(id)arg1 forFrame:(id)arg2 ;//TODO:
- (void)webView:(id)arg0 didObserveDeferredContentChange:(int)arg1 forFrame:(id)arg2 ;//TODO:
- (void)webView:(id)arg0 didReceiveViewportArguments:(id)arg1 forFrame:(id)arg2 ;//TODO:
- (void)revealedSelectionByScrollingWebFrame:(id)arg0 ;//TODO:
- (void)webThreadWebViewDidLayout:(id)arg0 byScrolling:(char)arg1 ;//TODO:
- (void)webViewDidStartOverflowScroll:(id)arg0 ;//TODO:
- (void)webViewDidEndOverflowScroll:(id)arg0 ;//TODO:
- (void)_webthread_webView:(id)arg0 attachRootLayer:(id)arg1 ;//TODO:
- (void)webViewDidCommitCompositingLayerChanges:(id)arg0 ;//TODO:
- (void)webView:(id)arg0 didCreateOrUpdateScrollingLayer:(id)arg1 withContentsLayer:(id)arg2 scrollSize:(id)arg3 forNode:(id)arg4 allowHorizontalScrollbar:(char)arg5 allowVerticalScrollbar:(char)arg6 ;//TODO:
- (void)webView:(id)arg0 willRemoveScrollingLayer:(id)arg1 withContentsLayer:(id)arg2 forNode:(id)arg3 ;//TODO:
- (id)supportedPasteboardTypesForCurrentSelection;
- (id)undoManagerForWebView:(id)arg0 ;//TODO:
- (void)webView:(id)arg0 didCommitLoadForFrame:(id)arg1 ;
- (void)webView:(id)arg0 didFinishLoadForFrame:(id)arg1 ;
- (void)webView:(id)arg0 didFailLoadWithError:(id)arg1 forFrame:(id)arg2 ;
- (void)webView:(id)arg0 didChangeLocationWithinPageForFrame:(id)arg1 ;
- (void)webView:(id)arg0 didFirstVisuallyNonEmptyLayoutInFrame:(id)arg1 ;
- (void)webView:(id)arg0 saveStateToHistoryItem:(id)arg1 forFrame:(id)arg2 ;//TODO:
- (void)webView:(id)arg0 restoreStateFromHistoryItem:(id)arg1 forFrame:(id)arg2 force:(char)arg3 ;//TODO:
- (char)webView:(id)arg0 shouldScrollToPoint:(CGPoint)arg1 forFrame:(id)arg2 ;//TODO:
- (void)webViewDidRestoreFromPageCache:(id)arg0 ;//TODO:
- (id)webView:(id)arg0 plugInViewWithArguments:(id)arg1 fromPlugInPackage:(id)arg2 ;
- (void)webView:(id)arg0 willShowFullScreenForPlugInView:(id)arg1 ;//TODO:
- (void)webView:(id)arg0 didHideFullScreenForPlugInView:(id)arg1 ;//TODO:
- (void)addInputString:(id)arg0 fromVariantKey:(char)arg1 ;
- (void)deleteFromInput;
- (id)checkSpellingOfString:(id)arg0 ;
- (void)writeDataToPasteboard:(id)arg0 ;
- (id)readDataFromPasteboard:(id)arg0 withIndex:(int)arg1 ;
- (int)getPasteboardItemsCount;
- (char)hasRichlyEditableSelection;
- (char)performsTwoStepPaste:(id)arg0 ;
- (int)getPasteboardChangeCount;
- (char)isUnperturbedDictationResultMarker:(id)arg0 ;
- (void)webView:(id)arg0 willAddPlugInView:(id)arg1 ;//TODO:
- (void)webViewDidDrawTiles:(id)arg0 ;//TODO:
- (id)undoManager;
- (void)setDrawsBackground:(char)arg0 ;
- (id)selectedDOMRange;
- (void)setMarkedText:(id)arg0 selectedRange:(NSRange)arg1 ;
- (void)loadRequest:(id)arg0 ;
- (int)selectionState;
- (char)hasSelection;
- (int)selectionBaseWritingDirection;
- (void)insertText:(id)arg0 ;
- (char)suppressesIncrementalRendering;
- (char)mediaPlaybackAllowsAirPlay;
- (void)setCaretChangeListener:(id)arg0 ;
- (id)text;
- (void)setOpaque:(char)arg0 ;
- (char)becomeFirstResponder;
- (char)resignFirstResponder;
- (void)setBaseWritingDirection:(int)arg0 ;
- (char)isEditable;
- (char)isEditing;
- (void)_updateSize;
- (void)setPaused:(char)arg0 ;
- (id)beginPrintModeWithSize:(CGSize)arg0 startOffset:(float)arg1 minimumLayoutWidth:(float)arg2 maximumLayoutWidth:(float)arg3 tileClippedContent:(char)arg4 ;
- (id)rectsForNSRange:(NSRange)arg0 ; 

@end
