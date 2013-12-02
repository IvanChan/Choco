//
//  ViewController.m
//  testUIWebCore
//
//  Created by Chan Ivan on 7/19/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "ViewController.h"
#import "GlobalDef.h"
#import "TopbarController.h"
#import "ToolbarController.h"
#import "WebViewController.h"
#import "PageManager.h"

#import "TabsTableController.h"
#import "TabbarController.h"
#import "SegmentViewController.h"

@interface ViewController ()
{
    CGFloat underOS7_fix;
}

@property (nonatomic, retain) TopbarController *topbarController;
@property (nonatomic, retain) ToolbarController *toolbarController;
@property (nonatomic, retain) TabsTableController *tabTableController;
@property (nonatomic, retain) TabbarController *tabbarController;
@property (nonatomic, retain) SegmentViewController *bookmarkHistoryController;

@property (nonatomic, retain) UIView      *contentView;

@end

@implementation ViewController
@synthesize topbarController = _topbarController;
@synthesize toolbarController = _toolbarController;
@synthesize tabTableController = _tabTableController;
@synthesize tabbarController = _tabbarController;
@synthesize bookmarkHistoryController = _bookmarkHistoryController;
@synthesize contentView = _contentView;

#pragma mark - Init & Dealloc
- (id)init
{
    if (self = [super init])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveUserGoURLNotification:)
                                                     name:UserGoURLNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveUserRefreshStopNotification:)
                                                     name:UserRefreshStopNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveUserGoBacwardkNotification:)
                                                     name:UserGoBacwardkNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveUserGoForwardNotification:)
                                                     name:UserGoForwardNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveUserGoBookmarkNotification:)
                                                     name:UserGoBookmarkNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveUserGoDownloadNotification:)
                                                     name:UserGoDownloadNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveUserGoTabsNotification:)
                                                     name:UserGoTabsNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveUserDidCloseTabNotification:)
                                                     name:UserDidCloseTabNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceivePageDidActivateNotification:)
                                                     name:PageDidActivateNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceivePageDidScrolNotification:)
                                                     name:PageDidScrolNotification
                                                   object:nil];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [_topbarController release];
    _topbarController = nil;
    
    [_toolbarController release];
    _toolbarController = nil;
    
    [_tabTableController release];
    _tabTableController = nil;
    
    [_tabbarController release];
    _tabbarController = nil;
    
    [_bookmarkHistoryController release];
    _bookmarkHistoryController = nil;
    
    [_contentView release];
    _contentView = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = GRAY_COLOR;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    underOS7_fix = 0;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7)
    {
        underOS7_fix = -20;
    }
    
    //setup page content view
    CGRect contentRect = CGRectZero;
    
    if (DEVICE_PAD)
    {
        contentRect = CGRectMake(0,
                                 TOPBAR_NORMAL_HEIGHT + underOS7_fix,
                                 CGRectGetWidth(self.view.bounds),
                                 CGRectGetHeight(self.view.bounds) - TOPBAR_NORMAL_HEIGHT);
    }
    else
    {
        contentRect = CGRectMake(0,
                                 TOPBAR_NORMAL_HEIGHT + underOS7_fix,
                                 CGRectGetWidth(self.view.bounds),
                                 CGRectGetHeight(self.view.bounds));
    }
    
    self.contentView = [[[UIView alloc] initWithFrame:contentRect] autorelease];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.contentView];
    
    [[PageManager sharedManger] setPageSuperView:self.contentView];
    
    //setup topbar
    self.topbarController = [[[TopbarController alloc] init] autorelease];
    [self.topbarController createViewWithFrameIfNeeded:CGRectMake(0, underOS7_fix, CGRectGetWidth(self.view.bounds), TOPBAR_NORMAL_HEIGHT)];
    [self.view addSubview:self.topbarController.view];
    
    if (DEVICE_PHONE)
    {
        //setup toolbar
        self.toolbarController = [[[ToolbarController alloc] init] autorelease];
        [self.toolbarController createViewWithFrameIfNeeded:CGRectMake(0, CGRectGetHeight(self.view.bounds) - TOOLBAR_HEIGHT, CGRectGetWidth(self.view.bounds), TOOLBAR_HEIGHT)];
        [self.view addSubview:self.toolbarController.view];
        
        self.tabTableController = [[[TabsTableController alloc] init] autorelease];
        
        self.bookmarkHistoryController = [[[SegmentViewController alloc] init] autorelease];
    }
    else
    {
        self.tabbarController = [[[TabbarController alloc] init] autorelease];
        [self.tabbarController createViewWithFrameIfNeeded:CGRectMake(0, CGRectGetMaxY(self.topbarController.view.frame), CGRectGetWidth(self.view.bounds), TABBAR_HEIGHT)];
        [self.view addSubview:self.tabbarController.view];
        [self.view bringSubviewToFront:self.topbarController.view];
    }
    
    //setup first tab
    [[PageManager sharedManger] addNewPageWithURL:[NSURL URLWithString:@"http://www.163.com"]];
}

- (void)layoutWebContentSize
{
    if (DEVICE_PAD)
    {
        NSInteger pageCount = [[PageManager sharedManger] pagesCount];
        
        CGRect contentRect = self.contentView.frame;
        
        if (pageCount <= 1)
        {
            contentRect.origin.y = TOPBAR_NORMAL_HEIGHT + underOS7_fix;
            contentRect.size.height = CGRectGetHeight(self.view.bounds) - TOPBAR_NORMAL_HEIGHT - underOS7_fix;
        }
        else
        {
            contentRect.origin.y = TOPBAR_NORMAL_HEIGHT + TABBAR_HEIGHT + underOS7_fix;
            contentRect.size.height = CGRectGetHeight(self.view.bounds) - (TOPBAR_NORMAL_HEIGHT + TABBAR_HEIGHT + underOS7_fix);
        }
        
        [UIView animateWithDuration:0.3f
                         animations:^{
                             
                             self.contentView.frame = contentRect;
                         }];
    }
}

#pragma mark - Notifications
- (void)didReceiveUserGoURLNotification:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    NSString *URLStr = [info objectForKey:KEY_URL];
    
    NSURL *URL = [NSURL URLWithString:URLStr];
    
    WebViewController *activetab = [[PageManager sharedManger] activePage];
    [activetab loadURL:URL];
}

- (void)didReceiveUserRefreshStopNotification:(NSNotification *)notification
{
    WebViewController *activetab = [[PageManager sharedManger] activePage];
    if ([activetab isLoading])
    {
        [activetab stopLoading];
    }
    else
    {
        [activetab reload];
    }
}

- (void)didReceiveUserGoBacwardkNotification:(NSNotification *)notification
{
    WebViewController *activetab = [[PageManager sharedManger] activePage];
    [activetab goBack];
}

- (void)didReceiveUserGoForwardNotification:(NSNotification *)notification
{
    WebViewController *activetab = [[PageManager sharedManger] activePage];
    [activetab goForward];
}

- (void)didReceiveUserGoBookmarkNotification:(NSNotification *)notification
{
    [self.bookmarkHistoryController setSegmentIndex:0];
    self.bookmarkHistoryController.view.alpha = 0;
    [self.view addSubview:self.bookmarkHistoryController.view];
    
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         self.bookmarkHistoryController.view.alpha = 1;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

- (void)didReceiveUserGoDownloadNotification:(NSNotification *)notification
{}

- (void)didReceiveUserGoTabsNotification:(NSNotification *)notification
{
    if (self.tabTableController.view == nil)
    {
        [self.tabTableController createViewWithFrameIfNeeded:self.view.bounds];
    }

    self.tabTableController.view.alpha = 0;
    [self.view addSubview:self.tabTableController.view];
    
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         self.tabTableController.view.alpha = 1;
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
}

- (void)didReceivePageDidScrolNotification:(NSNotification *)notification
{
    UIScrollView *scrollView = [[notification userInfo] objectForKey:KEY_SCROLL_VIEW];
    
    //calculate offset
    static CGFloat lastContentOffset_Y = 1;
    
    if (DEVICE_PHONE)
    {
        CGFloat contentOffset_Y = scrollView.contentOffset.y;
        CGFloat maxOffset_Y = scrollView.contentSize.height - CGRectGetHeight(scrollView.bounds);
        contentOffset_Y = contentOffset_Y > 0 ? contentOffset_Y : 0;
        contentOffset_Y = contentOffset_Y > maxOffset_Y ? maxOffset_Y : contentOffset_Y;

        //configure topbar
        BOOL shouldEnterFullMode = ((contentOffset_Y > lastContentOffset_Y) || (contentOffset_Y == maxOffset_Y)) && contentOffset_Y > 0;
        TopbarState topbarState = (shouldEnterFullMode)? TopbarStateMini : TopbarStateNormal;
        [self.topbarController changeToState:topbarState animated:YES];
        
        //configure toolbar
        BOOL shouldHideToolbar = shouldEnterFullMode;
        [self.toolbarController setToolbarHidden:shouldHideToolbar animated:YES];
        
        //Update webview offset
        CGFloat topbarHeight = CGRectGetHeight(self.topbarController.view.bounds) + underOS7_fix;
        CGFloat webOffset_Y = topbarHeight - contentOffset_Y;
        webOffset_Y = webOffset_Y < 0? 0 : webOffset_Y;
        webOffset_Y = webOffset_Y > topbarHeight? topbarHeight : webOffset_Y;
        CGRect webRect = self.contentView.frame;
        webRect.origin.y = webOffset_Y;
        self.contentView.frame = webRect;
        
        //update last content offset
        if (abs(lastContentOffset_Y - contentOffset_Y) > 5)
        {
            lastContentOffset_Y = contentOffset_Y;
        }
    }
}

- (void)didReceivePageDidActivateNotification:(NSNotification *)notification
{
    [self layoutWebContentSize];
}

- (void)didReceiveUserDidCloseTabNotification:(NSNotification *)notification
{
    [self layoutWebContentSize];
}

#pragma mark - Rotate
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    //[self.topbarController changeToState:[self.topbarController state] animated:NO];
}

@end
