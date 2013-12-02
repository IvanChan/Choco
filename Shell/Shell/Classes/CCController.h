//
//  IUCController.h
//  Shell
//
//  Created by Chan Ivan on 8/3/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCController <NSObject>

- (UIView *)view;
- (void)createViewWithFrameIfNeeded:(CGRect)frame;

@end
