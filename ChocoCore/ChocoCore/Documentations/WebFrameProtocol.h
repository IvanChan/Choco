//
//  WebFrameProtocol.h
//  ChocoCore
//
//  Created by Chan Ivan on 11/29/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebDataSourceProtocol.h"

#define Page id
#define HTMLFrameOwnerElement id
#define String id
#define __GSFont id
#define Vector id
#define VisiblePosition id
#define OpaqueJSContext id
#define OpaqueJSValue id
#define Range id

@protocol WebFrameProtocol <NSObject>

/*
{
    WebFramePrivate                	 _private
}
*/
@optional

+ (id)_createFrameWithPage:(Page)arg0 frameName:(id)arg1 frameView:(id)arg2 ownerElement:(HTMLFrameOwnerElement)arg3 ;
+ (void)_createMainFrameWithPage:(Page)arg0 frameName:(id)arg1 frameView:(id)arg2 ;
+ (id)_createSubframeWithOwnerElement:(HTMLFrameOwnerElement)arg0 frameName:(String)arg1 frameView:(id)arg2 ;
+ (void)_createMainFrameWithSimpleHTMLDocumentWithPage:(Page)arg0 frameView:(id)arg1 style:(id)arg2 ;
+ (id)stringWithData:(id)arg0 textEncodingName:(id)arg1 ;

- (oneway void)release;
- (oneway void)_webcore_releaseOnWebThread;
- (char)containsOnlySelectableElements;
- (char)isTexty;
- (id)_topFrame;
- (void)_collectFormFieldElementsIntoArray:(id)arg0 upToLimit:(unsigned int)arg1 onlyIncludeFocusedElements:(char)arg2 ;
- (char)isMainFrame;
- (id)allFormFields;
- (char)containsAnyFormFields;
- (char)containsAnyFocusedFormFields;
- (char)isOrphaned;
- (void)setNeedsLayout;
- (char)needsLayout;
- (void)_handleKeyEvent:(id)arg0 ;
- (void)clearSelection;
- (CGRect)closestCaretRectInMarkedTextRangeForPoint:(CGPoint)arg0 ;
- (id)_documentFragmentForWebArchive:(id)arg0 ;
- (void)_replaceSelectionWithText:(id)arg0 selectReplacement:(char)arg1 smartReplace:(char)arg2 matchStyle:(char)arg3 ;
- (CGRect)caretRectForPosition:(id)arg0 ;
- (id)characterRangeAtPoint:(CGPoint)arg0 ;
- (int)selectionAffinity;
- (void)setSelectionGranularity:(int)arg0 ;
- (id)selectionRectsForRange:(id)arg0 ;
- (void)createDefaultFieldEditorDocumentStructure;
- (void)setIsSingleLine:(char)arg0 ;
- (void)selectNSRange:(NSRange)arg0 onElement:(id)arg1 ;
- (void)selectNSRange:(NSRange)arg0 ;
- (void)revealSelectionAtExtent:(char)arg0 ;
- (NSRange)convertDOMRangeToNSRange:(id)arg0 ;
- (void)updateLayout;
- (void)setText:(id)arg0 asChildOfElement:(id)arg1 ;
- (CGRect)caretRect;
- (void)_setSelectionFromNone;
- (int)preferredHeight;
- (void)setSelectionChangeCallbacksDisabled:(char)arg0 ;
- (void)setDictationPhrases:(id)arg0 metadata:(id)arg1 asChildOfElement:(id)arg2 ;
- (CGRect)rectForScrollToVisible;
- (id)convertNSRangeToDOMRange:(NSRange)arg0 ;
- (CGRect)caretRectAtNode:(id)arg0 offset:(int)arg1 affinity:(int)arg2 ;
- (void)setSelectedDOMRange:(id)arg0 affinity:(int)arg1 closeTyping:(char)arg2 ;
- (CGRect)firstRectForDOMRange:(id)arg0 ;
- (id)previousUnperturbedDictationResultBoundaryFromPosition:(id)arg0 ;
- (id)nextUnperturbedDictationResultBoundaryFromPosition:(id)arg0 ;
- (unsigned short)characterBeforeCaretSelection;
- (id)wordRangeContainingCaretSelection;
- (void)collapseSelection;
- (void)confirmMarkedText:(id)arg0 ;
- (unsigned short)characterInRelationToCaretSelection:(int)arg0 ;
- (unsigned short)characterAfterCaretSelection;
- (void)expandSelectionToStartOfWordContainingCaretSelection;
- (int)wordOffsetInRange:(id)arg0 ;
- (char)selectionAtDocumentStart;
- (char)selectionAtWordStart;
- (id)rangeByMovingCurrentSelection:(int)arg0 ;
- (id)rangeByExtendingCurrentSelection:(int)arg0 ;
- (char)hasEditableSelection;
- (void)loadHTMLString:(id)arg0 baseURL:(id)arg1 ;
- (void)_setLoadsSynchronously:(char)arg0 ;
- (void)resetTextAutosizingBeforeLayout;
- (void)sendScrollEvent;
- (void)_userScrolled;
- (char)_isVisuallyNonEmpty;
- (int)_loadType;
- (void)removeUnchangeableStyles;
- (void)sendOrientationChangeEvent:(int)arg0 ;
- (CGRect)renderRectForPoint:(CGPoint)arg0 isReplaced:(char *)arg1 fontSize:(float *)arg2 ;
- (void)getDictationResultRanges:(id *)arg0 andMetadatas:(id *)arg1 ;
- (id)stringForRange:(id)arg0 ;
- (id)dictationResultMetadataForRange:(id)arg0 ;
- (void)forceLayoutAdjustingViewSize:(char)arg0 ;
- (id)interpretationsForCurrentRoot;
- (void)selectWithoutClosingTypingNSRange:(NSRange)arg0 ;
- (void)setMarkedText:(id)arg0 forCandidates:(char)arg1 ;
- (id)markedTextDOMRange;
- (__GSFont)fontForSelection:(char *)arg0 ;
- (void)_replaceSelectionWithWebArchive:(id)arg0 selectReplacement:(char)arg1 smartReplace:(char)arg2 ;
- (void)_selectAll;
- (void)expandSelectionToElementContainingCaretSelection;
- (char)focusedNodeHasContent;
- (void)prepareForPause;
- (void)setPluginsPaused:(char)arg0 ;
- (void)resumeFromPause;
- (void)toggleBaseWritingDirection;
- (id)webVisiblePositionForPoint:(CGPoint)arg0 ;
- (void)_setProhibitsScrolling:(char)arg0 ;
- (id)elementRangeContainingCaretSelection;
- (void)moveSelectionToPoint:(CGPoint)arg0 ;
- (int)innerLineHeight:(id)arg0 ;
- (id)approximateNodeAtViewportLocation:(CGPoint)arg0 ;
- (id)deepestNodeAtViewportLocation:(CGPoint)arg0 ;
- (id)scrollableNodeAtViewportLocation:(CGPoint)arg0 ;
- (void)_setVisibleSize:(CGSize)arg0 ;
- (id)parentFrame;
- (char)_isDescendantOfFrame:(id)arg0 ;
- (id)selectionRects;
- (void)setRangedSelectionBaseToCurrentSelection;
- (void)clearRangedSelectionInitialExtent;
- (void)setRangedSelectionWithExtentPoint:(CGPoint)arg0 ;
- (void)setSelectionWithFirstPoint:(CGPoint)arg0 secondPoint:(CGPoint)arg1 ;
- (void)aggressivelyExpandSelectionToWordContainingCaretSelection;
- (void)setRangedSelectionBaseToCurrentSelectionStart;
- (void)setRangedSelectionBaseToCurrentSelectionEnd;
- (void)setRangedSelectionInitialExtentToCurrentSelectionStart;
- (void)setRangedSelectionInitialExtentToCurrentSelectionEnd;
- (char)setRangedSelectionExtentPoint:(CGPoint)arg0 baseIsStart:(char)arg1 allowFlipping:(char)arg2 ;
- (id)wordAtPoint:(CGPoint)arg0 ;
- (void)smartExtendRangedSelection:(int)arg0 ;
- (void)moveSelectionToEnd;
- (void)moveSelectionToStart;
- (void)resetSelection;
- (void)stopLoading;
- (void)finalize;
- (id)name;
- (void)dealloc;
- (id)init;
- (id<WebDataSourceProtocol>)dataSource;
- (void)loadArchive:(id)arg0 ;
- (void)loadData:(id)arg0 MIMEType:(id)arg1 textEncodingName:(id)arg2 baseURL:(id)arg3 ;
- (id)DOMDocument;
- (CGColorRef)_bodyBackgroundColor;
- (id)webView;
- (id)frameView;
- (id)renderTreeAsExternalRepresentationForPrinting:(char)arg0 ;
- (id)counterValueForElement:(id)arg0 ;
- (int)pageNumberForElement:(id)arg0 :(float)arg1 :(float)arg2 ;
- (int)numberOfPages:(float)arg0 :(float)arg1 ;
- (id)pageProperty:(id)arg0 :(int)arg1 ;
- (bool)isPageBoxVisible:(int)arg0 ;
- (id)pageSizeAndMarginsInPixels:(int)arg0 :(int)arg1 :(int)arg2 :(int)arg3 :(int)arg4 :(int)arg5 :(int)arg6 ;
- (void)printToCGContext:(CGContextRef)arg0 :(float)arg1 :(float)arg2 ;
- (void)_replaceSelectionWithFragment:(id)arg0 selectReplacement:(char)arg1 smartReplace:(char)arg2 matchStyle:(char)arg3 ;
- (id)_documentFragmentWithMarkupString:(id)arg0 baseURLString:(id)arg1 ;
- (char)_isIncludedInWebKitStatistics;
- (char)hasRichlyEditableSelection;
- (id<WebFrameProtocol>)coreFrame;
- (char)isSingleLine;
- (id)_initWithWebFrameView:(id)arg0 webView:(id)arg1 ;
- (char)_hasSelection;
- (id)_findFrameWithSelection;
- (void)_clearSelection;
- (id)_nodesFromList:(Vector)arg0 ;
- (id)_stringWithDocumentTypeStringAndMarkupString:(id)arg0 ;
- (char)_shouldFlattenCompositingLayers:(CGContextRef)arg0 ;
- (id)_stringByEvaluatingJavaScriptFromString:(id)arg0 forceUserGesture:(char)arg1 ;
- (CGRect)_firstRectForDOMRange:(id)arg0 ;
- (char)_canProvideDocumentSource;
- (void)_attachScriptDebugger;
- (void)_detachScriptDebugger;
- (void)_clearCoreFrame;
- (void)_updateBackgroundAndUpdatesWhileOffscreen;
- (void)_setInternalLoadDelegate:(id)arg0 ;
- (id)_internalLoadDelegate;
- (void)_unmarkAllBadGrammar;
- (void)_unmarkAllMisspellings;
- (void)_clearSelectionInOtherFrames;
- (id<WebDataSourceProtocol>)_dataSource;
- (char)_isCommitting;
- (void)_setIsCommitting:(char)arg0 ;
- (id)_markupStringFromRange:(id)arg0 nodes:(id *)arg1 ;
- (id)_selectedString;
- (id)_stringForRange:(id)arg0 ;
- (void)_drawRect:(CGRect)arg0 contentsOnly:(char)arg1 ;
- (char)_getVisibleRect:(CGRect)arg0 ;
- (id)_stringByEvaluatingJavaScriptFromString:(id)arg0 ;
- (CGRect)_caretRectAtPosition:(id)arg0 affinity:(int)arg1 ;
- (void)_scrollDOMRangeToVisible:(id)arg0 ;
- (void)_scrollDOMRangeToVisible:(id)arg0 withInset:(float)arg1 ;
- (char)_needsLayout;
- (int)_selectionGranularity;
- (id)_convertNSRangeToDOMRange:(NSRange)arg0 ;
- (NSRange)_convertDOMRangeToNSRange:(id)arg0 ;
- (id)_markDOMRange;
- (id)_smartDeleteRangeForProposedRange:(id)arg0 ;
- (id)_documentFragmentWithNodesAsParagraphs:(id)arg0 ;
- (void)_replaceSelectionWithNode:(id)arg0 selectReplacement:(char)arg1 smartReplace:(char)arg2 matchStyle:(char)arg3 ;
- (void)_insertParagraphSeparatorInQuotedContent;
- (VisiblePosition)_visiblePositionForPoint:(CGPoint)arg0 ;
- (id)_characterRangeAtPoint:(CGPoint)arg0 ;
- (id)_typingStyle;
- (void)_setTypingStyle:(id)arg0 withUndoAction:(int)arg1 ;
- (char)_canSaveAsWebArchive;
- (void)_commitData:(id)arg0 ;
- (void)_selectNSRange:(NSRange)arg0 ;
- (NSRange)_selectedNSRange;
- (void)_setTextAutosizingWidth:(float)arg0 ;
- (void)_setShouldCreateRenderers:(char)arg0 ;
- (char)_isFrameSet;
- (char)_firstLayoutDone;
- (char)_loadsSynchronously;
- (id)_rectsForRange:(id)arg0 ;
- (id)_selectionRangeForFirstPoint:(CGPoint)arg0 secondPoint:(CGPoint)arg1 ;
- (id)_selectionRangeForPoint:(CGPoint)arg0 ;
- (char)_isDisplayingStandaloneImage;
- (unsigned int)_pendingFrameUnloadEventCount;
- (void)_setIsDisconnected:(bool)arg0 ;
- (void)_setExcludeFromTextSearch:(bool)arg0 ;
- (char)_pauseAnimation:(id)arg0 onNode:(id)arg1 atTime:(double)arg2 ;
- (char)_pauseTransitionOfProperty:(id)arg0 onNode:(id)arg1 atTime:(double)arg2 ;
- (unsigned int)_numberOfActiveAnimations;
- (unsigned int)formElementsCharacterCount;
- (void)setTimeoutsPaused:(char)arg0 ;
- (NSRange)selectedNSRange;
- (void)_restoreViewState;
- (void)_saveViewState;
- (CGSize)renderedSizeOfNode:(id)arg0 constrainedToWidth:(float)arg1 ;
- (void)setCaretColor:(CGColorRef)arg0 ;
- (int)layoutCount;
- (char)isTelephoneNumberParsingAllowed;
- (char)isTelephoneNumberParsingEnabled;
- (char)mediaDataLoadsAutomatically;
- (void)setMediaDataLoadsAutomatically:(char)arg0 ;
- (id)selectedDOMRange;
- (void)expandSelectionToWordContainingCaretSelection;
- (id)wordInRange:(id)arg0 ;
- (char)spaceFollowsWordInRange:(id)arg0 ;
- (id)wordsInCurrentParagraph;
- (char)selectionAtSentenceStart;
- (void)setMarkedText:(id)arg0 selectedRange:(NSRange)arg1 ;
- (void)recursiveSetUpdateAppearanceEnabled:(char)arg0 ;
- (void)getPPTStatsWithParseCount:(unsigned int *)arg0 withLayoutCount:(unsigned int *)arg1 withForcedLayoutCount:(unsigned int *)arg2 withParseDuration:(double *)arg3 withLayoutDuration:(double *)arg4 ;
- (void)clearPPTStats;
- (id)stringByEvaluatingJavaScriptFromString:(id)arg0 forceUserGesture:(char)arg1 ;
- (void)_suspendAnimations;
- (void)_resumeAnimations;
- (void)_replaceSelectionWithText:(id)arg0 selectReplacement:(char)arg1 smartReplace:(char)arg2 ;
- (void)_replaceSelectionWithMarkupString:(id)arg0 baseURLString:(id)arg1 selectReplacement:(char)arg2 smartReplace:(char)arg3 ;
- (id)_cacheabilityDictionary;
- (char)_allowsFollowingLink:(id)arg0 ;
- (id)_stringByEvaluatingJavaScriptFromString:(id)arg0 withGlobalObject:(OpaqueJSValue)arg1 inScriptWorld:(id)arg2 ;
- (OpaqueJSContext)_globalContextForScriptWorld:(id)arg0 ;
- (void)setAccessibleName:(id)arg0 ;
- (id)_layerTreeAsText;
- (id)accessibilityRoot;
- (void)_clearOpener;
- (id)_computePageRectsWithPrintScaleFactor:(float)arg0 pageSize:(CGSize)arg1 ;
- (id)_documentFragmentForText:(id)arg0 ;
- (id)_documentFragmentForImageData:(id)arg0 withRelativeURLPart:(id)arg1 andMIMEType:(id)arg2 ;
- (void)_dispatchDidReceiveTitle:(id)arg0 ;
- (void)_loadData:(id)arg0 MIMEType:(id)arg1 textEncodingName:(id)arg2 baseURL:(id)arg3 unreachableURL:(id)arg4 ;
- (void)_loadHTMLString:(id)arg0 baseURL:(id)arg1 unreachableURL:(id)arg2 ;
- (id)initWithName:(id)arg0 webFrameView:(id)arg1 webView:(id)arg2 ;
- (id)frameElement;
- (id<WebDataSourceProtocol>)provisionalDataSource;
- (void)loadRequest:(id)arg0 ;
- (void)loadAlternateHTMLString:(id)arg0 baseURL:(id)arg1 forUnreachableURL:(id)arg2 ;
- (void)reloadFromOrigin;
- (id)findFrameNamed:(id)arg0 ;
- (id)childFrames;
- (id)windowObject;
- (OpaqueJSContext)globalContext;
- (int)selectionState;
- (VisiblePosition)visiblePositionForPoint:(CGPoint)arg0 ;
- (id)selectionRectsForCoreRange:(Range)arg0 ;
- (char)hasSelection;
- (char)setSelectionWithBasePoint:(CGPoint)arg0 extentPoint:(CGPoint)arg1 baseIsStart:(char)arg2 allowFlipping:(char)arg3 ;
- (int)selectionBaseWritingDirection;
- (VisiblePosition)closestWordBoundary:(VisiblePosition)arg0 ;
- (void)extendSelection:(char)arg0 ;
- (char)setSelectionWithBasePoint:(CGPoint)arg0 extentPoint:(CGPoint)arg1 baseIsStart:(char)arg2 ;
- (void)ensureRangedSelectionContainsInitialStartPoint:(CGPoint)arg0 initialEndPoint:(CGPoint)arg1 ;
- (void)expandSelectionToSentence;
- (id)startPosition;
- (id)endPosition;
- (char)renderedCharactersExceed:(unsigned int)arg0 ;
- (CGImageRef)imageForNode:(id)arg0 allowDownsampling:(char)arg1 drawContentBehindTransparentNodes:(char)arg2 ;
- (NSRange)_convertToNSRange:(Range)arg0 ;
- (id)_convertToDOMRange:(NSRange)arg0 ;
- (id)documentView;
- (void)setBaseWritingDirection:(int)arg0 ;
- (void)reload;
- (void)setIsActive:(char)arg0 ;

@end
