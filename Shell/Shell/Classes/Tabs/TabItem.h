//
//  TabItem.h
//  testUIWebCore
//
//  Created by Chan Ivan on 7/30/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TabItem : NSObject

- (id)initWithTitle:(NSString *)title URL:(NSString *)URL id:(NSInteger)tabID;

- (NSString *)title;
- (NSString *)URL;
- (NSInteger)tabID;

@end
