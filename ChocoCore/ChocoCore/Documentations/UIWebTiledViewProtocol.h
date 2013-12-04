//
//  UIWebTiledViewProtocol.h
//  ChocoCore
//
//  Created by Chan Ivan on 12/4/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WKWindow;
@protocol UIWebTiledViewProtocol <NSObject>
//{
//    WAKWindow                      	 _wakWindow
//    int                            	 _inGestureType
//    int                            	 _tilingArea
//    char                           	 _didFirstTileLayout
//    char                           	 _layoutTilesInMainThread
//    char                           	 _tilingModeIsLocked
//    char                           	 _allowsPaintingAndScriptsWhilePanning
//}

@optional
- (void)layoutSubviews;
- (void)willMoveToWindow:(id)arg0 ;
- (void)_didScroll;
- (void)layoutTilesNow;
- (void)setMaxTileCount:(unsigned int)arg0 ;
- (void)setTilingEnabled:(char)arg0 ;
- (void)setLayoutTilesInMainThread:(char)arg0 ;
- (WKWindow *)wkWindow;
- (void)removeAllNonVisibleTiles;
- (void)setTilingArea:(int)arg0 ;
- (void)setTilesOpaque:(char)arg0 ;
- (void)removeAllTiles;
- (void)removeForegroundTiles;
- (void)setInGesture:(int)arg0 ;
- (int)tilingArea;
- (void)_updateForScreen:(id)arg0 ;
- (void)_screenChanged:(id)arg0 ;
- (void)layoutTilesNowForRect:(CGRect)arg0 ;
- (void)updateTilingMode;
- (char)tilesOpaque;
- (void)setKeepsZoomedOutTiles:(char)arg0 ;
- (char)keepsZoomedOutTiles;
- (void)dumpTiles;
- (void)setWAKWindow:(id)arg0 ;
- (void)layoutTilesNowOnWebThread;
- (void)lockTilingMode;
- (void)unlockTilingMode;
- (char)allowsPaintingAndScriptsWhilePanning;
- (void)setAllowsPaintingAndScriptsWhilePanning:(char)arg0 ;
- (void)setDrawsGrid:(char)arg0 ;
- (char)drawsGrid;
- (unsigned int)maxTileCount;
- (unsigned int)adjustedMaxTileCount;
- (char)isTilingEnabled;
- (void)setLogsTilingChanges:(char)arg0 ;
- (char)logsTilingChanges;
- (void)setTileDrawingEnabled:(char)arg0 ;
- (char)tileDrawingEnabled;
- (char)layoutTilesInMainThread;
- (id)wakWindow;
- (void)dealloc;
- (id)initWithFrame:(CGRect)arg0 ;
- (void)setTransform:(CGAffineTransform)arg0 ;
- (void)setNeedsLayout;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)arg0 ;
- (CGSize)tileSize;
- (void)setTileSize:(CGSize)arg0 ;
- (CGRect)visibleRect;

@end
