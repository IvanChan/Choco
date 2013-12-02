//
//  TopbarController.h
//  testUIWebCore
//
//  Created by Chan Ivan on 7/22/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCController.h"

@interface ToolbarController : NSObject <CCController>

- (void)setToolbarHidden:(BOOL)isHidden animated:(BOOL)animated;

@end
