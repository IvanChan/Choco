//
//  HistoryView.h
//  Shell
//
//  Created by Chan Ivan on 8/3/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HistoryViewDelegate;
@interface HistoryView : UIView

@property (nonatomic, assign) NSObject<HistoryViewDelegate> *delegate;

@end

@protocol HistoryViewDelegate <NSObject>



@end
