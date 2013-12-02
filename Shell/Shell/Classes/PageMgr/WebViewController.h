//
//  WebViewController.h
//  testUIWebCore
//
//  Created by Chan Ivan on 7/29/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebViewController : NSObject

@property (nonatomic, assign, readonly) NSInteger pageID;
@property (nonatomic, assign, getter = isActive) BOOL active;

- (id)initWebViewWithFrame:(CGRect)frame;

- (UIView *)view;

- (void)loadURL:(NSURL *)URL;

- (void)reload;
- (BOOL)isLoading;
- (void)stopLoading;

- (BOOL)canGoBack;
- (void)goBack;

- (BOOL)canGoForward;
- (void)goForward;

- (NSString *)title;
- (NSString *)URL;

@end
