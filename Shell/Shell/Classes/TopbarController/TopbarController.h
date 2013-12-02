//
//  TopbarController.h
//  testUIWebCore
//
//  Created by Chan Ivan on 7/22/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalDef.h"
#import "CCController.h"

@interface TopbarController : NSObject <CCController>

- (TopbarState)state;
- (void)changeToState:(TopbarState)state animated:(BOOL)animated;

@end
