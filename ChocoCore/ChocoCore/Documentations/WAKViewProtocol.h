//
//  WAKViewProtocol.h
//  ChocoCore
//
//  Created by Chan Ivan on 12/4/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WAKWindowCC.h"

@class  WKView;
@protocol WAKViewProtocol <NSObject>
//{
//    _WKViewContext                 	 viewContext
//    WKView                         	 viewRef
//    NSMutableSet                   	 subviewReferences
//    char                           	 _isHidden
//    char                           	 _drawsOwnDescendants
//}

@optional
+ (void)_setInterpolationQuality:(int)arg0 ;
+ (id)_wrapperForViewRef:(WKView *)arg0 ;
+ (id)focusView;

- (oneway void)release;
- (oneway void)_webcore_releaseWithWebThreadLock;
- (id)_webView;
- (id)_frame;
- (id)_web_parentWebFrameView;
- (id)_web_superviewOfClass:(Class)arg0 ;
- (char)_web_firstResponderIsSelfOrDescendantView;
- (CGRect)_web_convertRect:(CGRect)arg0 toView:(id)arg1 ;
- (void)_web_addDescendantWebHTMLViewsToArray:(id)arg0 ;
- (unsigned int)autoresizingMask;
- (CGSize)convertSize:(CGSize)arg0 toView:(id)arg1 ;
- (id)lastScrollableAncestor;
- (float)scale;
- (id)description;
- (void)dealloc;
- (id)init;
- (void)removeFromSuperview;
- (id)initWithFrame:(CGRect)arg0 ;
- (void)setFrame:(CGRect)arg0 ;
- (void)addSubview:(id)arg0 ;
- (CGRect)frame;
- (void)setAutoresizingMask:(unsigned int)arg0 ;
- (id)subviews;
- (id)superview;
- (CGRect)bounds;
- (void)display;
- (id)hitTest:(CGPoint)arg0 ;
- (void)setNeedsDisplayInRect:(CGRect)arg0 ;
- (char)needsDisplay;
- (void)layoutIfNeeded;
- (void)displayIfNeeded;
- (char)isDescendantOf:(id)arg0 ;
- (char)scrollRectToVisible:(CGRect)arg0 ;
- (void)setNeedsLayout:(char)arg0 ;
- (void)layout;
- (void)setNextKeyView:(id)arg0 ;
- (id)previousValidKeyView;
- (char)mouse:(CGPoint)arg0 inRect:(CGRect)arg1 ;
- (void)setScale:(float)arg0 ;
- (void)_setDrawsOwnDescendants:(char)arg0 ;
- (id)nextKeyView;
- (id)previousKeyView;
- (char)accessibilityIsIgnored;
- (CGRect)convertRect:(CGRect)arg0 toView:(id)arg1 ;
- (WAKWindow *)window;
- (void)setHidden:(char)arg0 ;
- (CGPoint)convertPoint:(CGPoint)arg0 fromView:(id)arg1 ;
- (char)needsPanelToBecomeKey;
- (CGRect)convertRect:(CGRect)arg0 fromView:(id)arg1 ;
- (void)handleEvent:(id)arg0 ;
- (CGRect)visibleRect;
- (void)setBoundsSize:(CGSize)arg0 ;
- (void)scrollPoint:(CGPoint)arg0 ;
- (CGPoint)convertPoint:(CGPoint)arg0 toView:(id)arg1 ;
- (void)displayRect:(CGRect)arg0 ;
- (void)viewWillDraw;
- (id)_initWithViewRef:(WKView*)arg0 ;
- (WKView *)_viewRef;
- (id)nextResponder;
- (void)setBoundsOrigin:(CGPoint)arg0 ;
- (void)setFrameSize:(CGSize)arg0 ;
- (char)_selfHandleEvent:(id)arg0 ;
- (void)drawRect:(CGRect)arg0 ;
- (void)setFrameOrigin:(CGPoint)arg0 ;
- (void)setNeedsDisplay:(char)arg0 ;
- (id)_subviewReferences;
- (void)_lockFocusViewInContext:(CGContextRef)arg0 ;
- (void)_drawRect:(CGRect)arg0 context:(CGContextRef)arg1 lockFocus:(bool)arg2 ;
- (void)_unlockFocusViewInContext:(CGContextRef)arg0 ;
- (void)_appendDescriptionToString:(id)arg0 atLevel:(int)arg1 ;
- (char)_handleResponderCall:(int)arg0 ;
- (void)willRemoveSubview:(id)arg0 ;
- (void)viewDidMoveToWindow;
- (void)frameSizeChanged;
- (void)displayRectIgnoringOpacity:(CGRect)arg0 ;
- (void)displayRectIgnoringOpacity:(CGRect)arg0 inContext:(CGContextRef)arg1 ;
- (void)lockFocus;
- (void)unlockFocus;
- (id)nextValidKeyView;
- (void)invalidateGState;
- (void)releaseGState;
- (char)inLiveResize;

@end
