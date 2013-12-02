//
//  BookmarkView.h
//  Shell
//
//  Created by Chan Ivan on 8/3/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BookmarkViewDelegate;
@interface BookmarkView : UIView

@property (nonatomic, assign) NSObject<BookmarkViewDelegate> *delegate;

@end

@protocol BookmarkViewDelegate <NSObject>



@end