//
//  CCWebScrollView.m
//  ChocoCore
//
//  Created by Chan Ivan on 11/29/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "CCWebScrollView.h"

@implementation CCWebScrollView

#pragma mark - Init & Dealloc
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

#pragma mark - Observer
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{//FIXME: bad to bind WebScrollView & WebDocumentView togother

}

@end
