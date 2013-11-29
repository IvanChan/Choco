//
//  WebDataSourceProtocol.h
//  ChocoCore
//
//  Created by Chan Ivan on 11/29/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DocumentLoader id

@protocol WebDataSourceProtocol <NSObject>

/*
{
    void *                         	 _private
}
*/
@optional
+ (void)initialize;
+ (Class)_representationClassForMIMEType:(id)arg0 allowingPlugins:(char)arg1 ;
+ (id)_repTypesAllowImageTypeOmission:(char)arg0 ;

- (oneway void)release;
- (oneway void)_webcore_releaseOnWebThread;
- (id)initWithRequest:(id)arg0 ;
- (id)_URL;
- (id)initialRequest;
- (id)request;
- (void)finalize;
- (id)data;
- (void)dealloc;
- (id)subresources;
- (id)webFrame;
- (id)subresourceForURL:(id)arg0 ;
- (id)representation;
- (id)webArchive;
- (id)mainResource;
- (void)_setRepresentation:(id)arg0 ;
- (id)dataSourceDelegate;
- (id)_mainDocumentError;
- (void)_addSubframeArchives:(id)arg0 ;
- (id)_responseMIMEType;
- (char)_transferApplicationCache:(id)arg0 ;
- (void)_setDeferMainResourceDataLoad:(char)arg0 ;
- (void)_setOverrideTextEncodingName:(id)arg0 ;
- (void)_setAllowToBeMemoryMapped;
- (void)setDataSourceDelegate:(id)arg0 ;
- (id)_documentFragmentWithArchive:(id)arg0 ;
- (id)_documentFragmentWithImageResource:(id)arg0 ;
- (id)_imageElementWithImageResource:(id)arg0 ;
- (void)addSubresource:(id)arg0 ;
- (id)_webView;
- (void)_finishedLoading;
- (void)_receivedData:(id)arg0 ;
- (void)_setMainDocumentError:(id)arg0 ;
- (void)_revertToProvisionalState;
- (void)_replaceSelectionWithArchive:(id)arg0 selectReplacement:(char)arg1 ;
- (char)_isDocumentHTML;
- (void)_makeRepresentation;
- (DocumentLoader)_documentLoader;
- (id)_initWithDocumentLoader:(id)arg0 ;
- (id)pageTitle;
- (id)unreachableURL;
- (id)response;
- (char)isLoading;
- (id)textEncodingName;

@end

typedef NSObject<WebDataSourceProtocol> WebDataSource;