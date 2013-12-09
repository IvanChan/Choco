//
//  UIWebViewInternal.h
//  ChocoCore
//
//  Created by Chan Ivan on 12/9/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIWebBrowserView, UICheckeredPatternView, UIWebViewWebViewDelegate, UIWebPDFViewHandler;
@interface UIWebViewInternalCC : NSObject
{
    UIScrollView                   	 *scroller;
    UIWebBrowserView               	 *browserView;
    UICheckeredPatternView         	 *checkeredPatternView;
    id<UIWebViewDelegate>            delegate;
    BOOL                             scalesPageToFit;
    BOOL                             isLoading;
    BOOL                             hasOverriddenOrientationChangeEventHandling;
    BOOL                             drawsCheckeredPattern;
    BOOL                             webSelectionEnabled;
    BOOL                             drawInWebThread;
    BOOL                             inRotation;
    NSURLRequest                   	 *request;
    int                            	 clickedAlertButtonIndex;
    UIWebViewWebViewDelegate       	 *webViewDelegate;
    UIWebPDFViewHandler            	 *pdfHandler;
}

@end
