//
//  GlobalDef.h
//  testUIWebCore
//
//  Created by Chan Ivan on 7/22/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#define IPHONE_UA @"Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7"

#define IPAD_UA @"Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A403 Safari/8536.25"


#define WHITE_COLOR [UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1.0]

//#define GRAY_COLOR [UIColor colorWithRed:222.0/255.0 green:222.0/255.0 blue:222.0/255.0 alpha:1.0]
#define GRAY_COLOR [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0]

#define BLUE_COLOR [UIColor colorWithRed:32.0/255.0 green:135.0/255.0 blue:252.0/255.0 alpha:1.0]


#define UserGoURLNotification                           @"UserGoURLNotification"
#define UserRefreshStopNotification                     @"UserRefreshStopNotification"
#define UserGoBacwardkNotification                      @"UserGoBacwardkNotification"
#define UserGoForwardNotification                       @"UserGoForwardNotification"
#define UserGoBookmarkNotification                      @"UserGoBookmarkNotification"
#define UserGoDownloadNotification                      @"UserGoDownloadNotification"
#define UserGoTabsNotification                          @"UserGoTabsNotification"

#define UserAddNewTabNotification                       @"UserAddNewTabNotification"
#define UserDidCloseTabNotification                     @"UserDidCloseTabNotification"

#define PageDidLoadNotification                         @"PageDidLoadNotification"
#define PageDidActivateNotification                     @"PageDidActivateNotification"
#define PageDidScrolNotification                        @"PageDidScrolNotification"
#define PageLoadingPercentageChangedNotification        @"PageLoadingPercentageChangedNotification"

#define KEY_URL                 @"KEY_URL"
#define KEY_TITLE               @"KEY_TITLE"
#define KEY_LOADING_FLAG        @"KEY_LOADING_FLAG"
#define KEY_BACKWARD_FLAG       @"KEY_BACKWARD_FLAG"
#define KEY_FORWARD_FLAG        @"KEY_FORWARD_FLAG"
#define KEY_SCROLL_VIEW         @"KEY_SCROLL_VIEW"
#define KEY_LOAD_PERCENTAGE     @"KEY_LOAD_PERCENTAGE"
#define KEY_CONTROLLER          @"KEY_CONTROLLER"

#define DEVICE_PAD ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define DEVICE_PHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

typedef NS_ENUM(NSInteger, TopbarState)
{
    TopbarStateNone,
    TopbarStateNormal,
    TopbarStateEdit,
    TopbarStateMini
};

#define STATUS_BAR_HEIGHT    20

#define TOPBAR_NORMAL_HEIGHT    (40+STATUS_BAR_HEIGHT)
#define TOPBAR_MINI_HEIGHT      (20+STATUS_BAR_HEIGHT)

#define TOPBAR_ADDRESS_VIEW_EDGE_INSET          5
#define TOPBAR_ADDRESS_FIELD_EDGE_INSET         5
#define TOPBAR_LOADIING_BUTTON_EDGE_INSET       0

#define TOPBAR_BACKGROUND_VIEW_ALPHA            0.9f
#define TOPBAR_ADDRESS_BACKGROUND_VIEW_ALPHA    0.9f
#define TOPBAR_EDIT_MASK_VIEW_ALPHA             0.9f

#define TOPBAR_NORMAL_FONTSIZE 16.0f
#define TOPBAR_MINI_FONTSIZE 12.0f

#define TOOLBAR_HEIGHT      40

#define TABBAR_HEIGHT      30







