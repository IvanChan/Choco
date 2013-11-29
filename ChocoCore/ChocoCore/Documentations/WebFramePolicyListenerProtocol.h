//
//  WebFramePolicyListenerProtocol.h
//  ChocoCore
//
//  Created by Ivan.C on 11/29/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WebFramePolicyListenerProtocol <NSObject>

/*
WebFramePolicyListener:
{
    Frame                          	 m_frame
}
*/

+ (void)initialize;

- (void)finalize;
- (void)invalidate;
- (void)dealloc;
- (void)use;
- (void)ignore;
- (void)continue;
- (id)initWithWebCoreFrame:(id)arg0 ;
- (void)receivedPolicyDecision:(int)arg0 ;
- (void)download;
    
@end

typedef NSObject<WebFramePolicyListenerProtocol> WebFramePolicyListener;
