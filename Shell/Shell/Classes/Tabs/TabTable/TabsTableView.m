//
//  TabsTableView.m
//  testUIWebCore
//
//  Created by Chan Ivan on 7/30/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "TabsTableView.h"
#import "GlobalDef.h"
#import "TabItem.h"
#import <QuartzCore/QuartzCore.h>

@interface TabsTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) UIView *bottomBar;

@property (nonatomic, retain) NSMutableArray *tabList;

@end

@implementation TabsTableView
@synthesize tableView = _tableView;
@synthesize bottomBar = _bottomBar;
@synthesize tabList = _tabList;
@synthesize delegate = _delegate;

#pragma mark - Init & Dealloc
- (id)initWithFrame:(CGRect)frame tabList:(NSArray *)tabList
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.tabList = [[tabList mutableCopy] autorelease];
        
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.backgroundColor = [UIColor clearColor];
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        backgroundView.backgroundColor = WHITE_COLOR;
        backgroundView.alpha = 0.95;
        [self addSubview:backgroundView];
        [backgroundView release];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) - 50 - STATUS_BAR_HEIGHT)];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.backgroundView = nil;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_tableView];
        
        _bottomBar = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds) - 50, CGRectGetWidth(self.bounds), 50)];
        _bottomBar.backgroundColor = [UIColor whiteColor];
        _bottomBar.alpha = 0.9;
        _bottomBar.layer.borderColor = [GRAY_COLOR CGColor];
        _bottomBar.layer.borderWidth = 1;
        _bottomBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        [self addSubview:_bottomBar];
        
        UIButton *editButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, CGRectGetHeight(_bottomBar.bounds))];
        editButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
        [editButton setTitle:@"Eidt" forState:UIControlStateNormal];
        [editButton setTitleColor:BLUE_COLOR forState:UIControlStateNormal];
        [editButton setTitleColor:GRAY_COLOR forState:UIControlStateHighlighted];
        [editButton addTarget:self action:@selector(editButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomBar addSubview:editButton];
        [editButton release];
        
        UIButton *newPageButton = [[UIButton alloc] initWithFrame:CGRectMake((int)(CGRectGetWidth(_bottomBar.bounds) - 100)/2,
                                                                             0,
                                                                             100,
                                                                             CGRectGetHeight(_bottomBar.bounds))];
        newPageButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [newPageButton setImage:[UIImage imageNamed:@"Add.png"] forState:UIControlStateNormal];        
        [newPageButton addTarget:self action:@selector(newPageButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomBar addSubview:newPageButton];
        [newPageButton release];
        
        UIButton *exitButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(_bottomBar.bounds) - 100, 0, 100, CGRectGetHeight(_bottomBar.bounds))];
        exitButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [exitButton setTitle:@"Exit" forState:UIControlStateNormal];
        [exitButton setTitleColor:BLUE_COLOR forState:UIControlStateNormal];
        [exitButton setTitleColor:GRAY_COLOR forState:UIControlStateHighlighted];
        [exitButton addTarget:self action:@selector(exitButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomBar addSubview:exitButton];
        [exitButton release];
        
    }
    return self;
}

- (void)dealloc
{
    _delegate = nil;
    
    [_tableView release];
    _tableView = nil;
    
    [_bottomBar release];
    _bottomBar = nil;
    
    [_tabList release];
    _tabList = nil;
    
    [super dealloc];
}

#pragma mark - Callbacks
- (void)editButtonClicked:(UIButton *)sender
{
    self.tableView.editing = !self.tableView.editing;
    
    NSString *title = self.tableView.editing ? @"Done" : @"Edit";
    [sender setTitle:title forState:UIControlStateNormal];
    
}

- (void)newPageButtonClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(tabsTableViewDidAddNewTab:)])
    {
        [self.delegate tabsTableViewDidAddNewTab:self];
    }
    
    [self exitButtonClicked:nil];
}

- (void)exitButtonClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(tabsTableViewDidExit:)])
    {
        [self.delegate tabsTableViewDidExit:self];
    }
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tabList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier = @"TabsTableViewCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellidentifier] autorelease];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    TabItem *page = [self.tabList objectAtIndex:[indexPath row]];
    if (page)
    {
        cell.textLabel.text = page.title?  page.title : page.URL;
        cell.detailTextLabel.text = page.URL;
    }
    
    return cell;
}

#pragma mark - UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.bounds), 30)] autorelease];
    label.backgroundColor = [UIColor whiteColor];
    label.layer.borderColor = [GRAY_COLOR CGColor];
    label.layer.borderWidth = 1;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"ALL PAGES";
    return label;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TabItem *page = [self.tabList objectAtIndex:[indexPath row]];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self exitButtonClicked:nil];
    
    if ([self.delegate respondsToSelector:@selector(tabsTableView:didSelectTabWithID:)])
    {
        [self.delegate tabsTableView:self didSelectTabWithID:page.tabID];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    TabItem *page = [self.tabList objectAtIndex:[indexPath row]];
    
    if ([self.delegate respondsToSelector:@selector(tabsTableView:didRemoveTabWithID:)])
    {
        [self.delegate tabsTableView:self didRemoveTabWithID:page.tabID];
    }
    
    [self.tabList removeObjectAtIndex:[indexPath row]];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
