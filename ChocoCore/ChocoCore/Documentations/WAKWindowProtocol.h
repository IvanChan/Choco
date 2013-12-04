//
//  WAKWindowProtocol.h
//  ChocoCore
//
//  Created by Chan Ivan on 12/4/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WKWindow;
@protocol WAKWindowProtocol <NSObject>

//{
//    WKWindow                       	 _wkWindow
//    CALayer                        	 _hostLayer
//    TileCache                      	 _tileCache
//    CGRect                         	 _cachedVisibleRect
//    CALayer                        	 _rootLayer
//    CGSize                         	 _screenSize
//    CGSize                         	 _availableScreenSize
//    float                          	 _screenScale
//    CGRect                         	 _frame
//    char                           	 _useOrientationDependentFontAntialiasing
//}

@optional
+ (void)setOrientationProvider:(id)arg0 ;
+ (id)currentEvent;
+ (char)hasLandscapeOrientation;
+ (id)_wrapperForWindowRef:(WKWindow *)arg0 ;

- (oneway void)release;
- (oneway void)_webcore_releaseOnWebThread;
- (void)makeKeyWindow;
- (id)recursiveDescription;
- (void)layoutTilesNow;
- (void)setRootLayer:(id)arg0 ;
- (void)willRotate;
- (void)didRotate;
- (void)setContentRect:(CGRect)arg0 ;
- (void)setCurrentTileScale:(float)arg0 ;
- (void)setZoomedOutTileScale:(float)arg0 ;
- (void)removeAllNonVisibleTiles;
- (void)setTilesOpaque:(char)arg0 ;
- (void)removeAllTiles;
- (void)setUseOrientationDependentFontAntialiasing:(char)arg0 ;
- (void)setTilingDirection:(int)arg0 ;
- (void)removeForegroundTiles;
- (void)sendMouseMoveEvent:(id)arg0 contentChange:(int *)arg1 ;
- (void)setScreenSize:(CGSize)arg0 ;
- (void)setAvailableScreenSize:(CGSize)arg0 ;
- (void)setScreenScale:(float)arg0 ;
- (void)layoutTilesNowForRect:(CGRect)arg0 ;
- (void)layoutTiles;
- (void)setTilingMode:(int)arg0 ;
- (char)tilesOpaque;
- (void)setKeepsZoomedOutTiles:(char)arg0 ;
- (char)keepsZoomedOutTiles;
- (void)dumpTiles;
- (id)description;
- (void)close;
- (void)dealloc;
- (void)setContentView:(id)arg0 ;
- (id)contentView;
- (id)initWithFrame:(CGRect)arg0 ;
- (CGRect)frame;
- (id)initWithLayer:(id)arg0 ;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)arg0 ;
- (id)rootLayer;
- (WKWindow *)_windowRef;
- (id)firstResponder;
- (int)keyViewSelectionDirection;
- (char)makeFirstResponder:(id)arg0 ;
- (id)_newFirstResponderAfterResigning;
- (void)setAcceleratedDrawingEnabled:(char)arg0 ;
- (void)setTileBordersVisible:(char)arg0 ;
- (void)setTilePaintCountsVisible:(char)arg0 ;
- (float)zoomedOutTileScale;
- (float)screenScale;
- (CGSize)screenSize;
- (CGSize)availableScreenSize;
- (CGRect)visibleRect;
- (CGPoint)convertBaseToScreen:(CGPoint)arg0 ;
- (CGPoint)convertScreenToBase:(CGPoint)arg0 ;
- (id)hostLayer;
- (char)useOrientationDependentFontAntialiasing;
- (void)displayRect:(CGRect)arg0 ;
- (char)isKeyWindow;
- (void)sendEventSynchronously:(id)arg0 ;
- (char)makeViewFirstResponder:(id)arg0 ;
- (void)sendEvent:(id)arg0 ;
- (void)setFrame:(CGRect)arg0 display:(char)arg1 ;
- (int)tilingMode;
- (int)tilingDirection;
- (float)currentTileScale;
- (char)hasPendingDraw;

@end
