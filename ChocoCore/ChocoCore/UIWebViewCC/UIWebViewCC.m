//
//  UIWebViewCC.m
//  ChocoCore
//
//  Created by Chan Ivan on 12/9/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "UIWebViewCC.h"

@implementation UIWebViewCC

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)_frameOrBoundsChanged
{
    //[UIWebPDFViewHandler pdfView]
    
    //[UIWebBrowserView setFrame:]
}

- (void)_didRotate:(NSNotification *)notification
{
    //[_webBrowserView sendOrientationEventForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}
@end
