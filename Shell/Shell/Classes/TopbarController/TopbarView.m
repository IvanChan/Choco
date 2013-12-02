//
//  TopbarView.m
//  testUIWebCore
//
//  Created by Chan Ivan on 7/22/13.
//  Copyright (c) 2013 Chan Ivan. All rights reserved.
//

#import "TopbarView.h"
#import <QuartzCore/QuartzCore.h>
#import "Progressbar.h"

@interface TopbarView () <UITextFieldDelegate>

@property (nonatomic, retain) UIView        *addressView;
@property (nonatomic, retain) UIView        *addressBackgroundView;
@property (nonatomic, retain) UITextField   *addressField;
@property (nonatomic, retain) UIButton      *loadingButton;
@property (nonatomic, retain) UIControl     *editMaskView;
@property (nonatomic, retain) UIButton      *addButton;
@property (nonatomic, retain) UIButton *backwardButton;
@property (nonatomic, retain) UIButton *forwardButton;

@property (nonatomic, assign) TopbarState   state;
@property (nonatomic, assign) TopbarState   animatingState;
@property (nonatomic, assign, getter = isAnimating) BOOL animating;

@property (nonatomic, retain) NSString      *title;
@property (nonatomic, retain) NSString      *URL;

@property (nonatomic, retain) Progressbar   *progressbar;

@end

@implementation TopbarView
@synthesize addressView = _addressView;
@synthesize addressBackgroundView = _addressBackgroundView;
@synthesize addressField = _addressField;
@synthesize loadingButton = _loadingButton;
@synthesize editMaskView = _editMaskView;
@synthesize addButton = _addButton;
@synthesize backwardButton = _backwardButton;
@synthesize forwardButton = _forwardButton;
@synthesize state = _state;
@synthesize animatingState = _animatingState;
@synthesize animating = _animating;
@synthesize title = _title;
@synthesize URL = _URL;
@synthesize progressbar = _progressbar;

#pragma mark - Init & Dealloc
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.state = TopbarStateNormal;
        
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = NO;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        UIView *background = [[UIView alloc] initWithFrame:self.bounds];
        background.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        background.backgroundColor = WHITE_COLOR;
        background.alpha = TOPBAR_BACKGROUND_VIEW_ALPHA;
        [self addSubview:background];
        
        if (DEVICE_PHONE)
        {
            UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds) - 1, CGRectGetWidth(self.bounds), 1)];
            bottomLine.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            bottomLine.backgroundColor = GRAY_COLOR;
            [self addSubview:bottomLine];
        }
        
        if (DEVICE_PAD)
        {
            CGFloat buttonWitdh = CGRectGetHeight(self.bounds);
            _backwardButton = [[UIButton alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, buttonWitdh, CGRectGetHeight(self.bounds) - STATUS_BAR_HEIGHT)];
            _backwardButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            [_backwardButton setImage:[UIImage imageNamed:@"Backward.png"] forState:UIControlStateNormal];
            [_backwardButton setImage:[UIImage imageNamed:@"Backward_disabled.png"] forState:UIControlStateDisabled];
            [_backwardButton addTarget:self action:@selector(backwardButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_backwardButton];
            _backwardButton.enabled = NO;
            
            _forwardButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonWitdh, STATUS_BAR_HEIGHT, buttonWitdh, CGRectGetHeight(self.bounds) - STATUS_BAR_HEIGHT)];
            _forwardButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            [_forwardButton setImage:[UIImage imageNamed:@"Forward.png"] forState:UIControlStateNormal];
            [_forwardButton setImage:[UIImage imageNamed:@"Forward_disabled.png"] forState:UIControlStateDisabled];
            [_forwardButton addTarget:self action:@selector(forwardButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_forwardButton];
            _forwardButton.enabled = NO;
            
            _addButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds) - CGRectGetHeight(self.bounds),
                                                                    STATUS_BAR_HEIGHT,
                                                                    CGRectGetHeight(self.bounds),
                                                                    CGRectGetHeight(self.bounds) - STATUS_BAR_HEIGHT)];
            _addButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |  UIViewAutoresizingFlexibleHeight;
            [_addButton setImage:[UIImage imageNamed:@"Add.png"] forState:UIControlStateNormal];
            [_addButton addTarget:self action:@selector(addButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_addButton];
            [_addButton release];
        }
        
        _addressView = [[UIView alloc] initWithFrame:CGRectMake(TOPBAR_ADDRESS_VIEW_EDGE_INSET + CGRectGetMaxX(_forwardButton.frame),
                                                                STATUS_BAR_HEIGHT + TOPBAR_ADDRESS_VIEW_EDGE_INSET,
                                                                [self addressViewWidthForState:TopbarStateNormal],
                                                                CGRectGetHeight(self.bounds) - STATUS_BAR_HEIGHT - TOPBAR_ADDRESS_VIEW_EDGE_INSET*2)];
        _addressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        _addressView.backgroundColor = [UIColor clearColor];
        [self addSubview:_addressView];

        _addressBackgroundView = [[UIView alloc] initWithFrame:_addressView.bounds];
        _addressBackgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _addressBackgroundView.backgroundColor = GRAY_COLOR;
        _addressBackgroundView.alpha = TOPBAR_ADDRESS_BACKGROUND_VIEW_ALPHA;
        _addressBackgroundView.layer.cornerRadius = 6.0f;
        [_addressView addSubview:_addressBackgroundView];
        
        _addressField = [[UITextField alloc] initWithFrame:CGRectMake(TOPBAR_ADDRESS_FIELD_EDGE_INSET,
                                                                 TOPBAR_ADDRESS_FIELD_EDGE_INSET,
                                                                 CGRectGetWidth(_addressView.bounds) - TOPBAR_ADDRESS_FIELD_EDGE_INSET*2,
                                                                 CGRectGetHeight(_addressView.bounds) - TOPBAR_ADDRESS_VIEW_EDGE_INSET*2)];
        _addressField.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        _addressField.borderStyle = UITextBorderStyleNone;
        _addressField.font = [UIFont systemFontOfSize:TOPBAR_NORMAL_FONTSIZE];
        _addressField.textColor = [UIColor blackColor];
        _addressField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _addressField.textAlignment = NSTextAlignmentCenter;
        _addressField.placeholder = @"Search or enter an address";
        _addressField.returnKeyType = UIReturnKeyGo;
        _addressField.autocorrectionType = UITextAutocorrectionTypeNo;
        _addressField.delegate = self;
        [_addressView addSubview:_addressField];
        
        _loadingButton = [[UIButton alloc] initWithFrame:
                          CGRectMake(CGRectGetWidth(_addressView.bounds) - TOPBAR_LOADIING_BUTTON_EDGE_INSET - CGRectGetHeight(_addressView.bounds),
                                     TOPBAR_LOADIING_BUTTON_EDGE_INSET,
                                     CGRectGetHeight(_addressView.bounds),
                                     CGRectGetHeight(_addressView.bounds))];
        _loadingButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin;
        [_loadingButton setImage:[UIImage imageNamed:@"Refresh.png"] forState:UIControlStateNormal];
        [_loadingButton addTarget:self action:@selector(loadingButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_addressView addSubview:_loadingButton];
        
        _editMaskView = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _editMaskView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;;
        [_editMaskView addTarget:self action:@selector(editMaskClicked:) forControlEvents:UIControlEventTouchUpInside];
        _editMaskView.backgroundColor = [UIColor darkGrayColor];
        _editMaskView.alpha = 0;

        _progressbar = [[Progressbar alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds) - 1, CGRectGetWidth(self.bounds), 3)];
        _progressbar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [self addSubview:_progressbar];
        
    }
    return self;
}

- (void)dealloc
{
    _delegate = nil;
    _state = TopbarStateNone;
    
    [_addressView release];
    _addressView = nil;
    
    [_addressBackgroundView release];
    _addressBackgroundView = nil;
    
    [_addressField release];
    _addressField = nil;
    
    [_loadingButton removeTarget:self action:nil forControlEvents:UIControlEventAllEvents];
    [_loadingButton release];
    _loadingButton = nil;
    
    [_editMaskView removeTarget:self action:nil forControlEvents:UIControlEventAllEvents];
    [_editMaskView release];
    _editMaskView = nil;
    
    [_addButton removeTarget:self action:nil forControlEvents:UIControlEventAllEvents];
    [_addButton release];
    _addButton = nil;
    
    [_backwardButton release];
    _backwardButton = nil;
    
    [_forwardButton release];
    _forwardButton = nil;
    
    [_title release];
    _title = nil;
    
    [_URL release];
    _URL = nil;
    
    [_progressbar release];
    _progressbar = nil;
    
    [super dealloc];
}

#pragma mark - Getter
- (TopbarState)state
{
    return _state;
}

- (CGFloat)addressViewWidthForState:(TopbarState)state
{
    if (state == TopbarStateEdit)
    {
        return CGRectGetWidth(self.bounds) - TOPBAR_ADDRESS_VIEW_EDGE_INSET*2;
    }
    else
    {
        if (DEVICE_PAD)
        {
            return CGRectGetWidth(self.bounds) - CGRectGetWidth(_addButton.bounds) - CGRectGetMaxX(_forwardButton.frame);
        }
        else
        {
            return CGRectGetWidth(self.bounds) - TOPBAR_ADDRESS_VIEW_EDGE_INSET*2 - CGRectGetWidth(_addButton.bounds) - CGRectGetMaxX(_forwardButton.frame);
        }
    }
}

#pragma mark - Setter
- (void)updateTopbarContent
{
    if ([self.addressField isFirstResponder])
    {
        return;
    }
    
    if (self.title && [self.title length] > 0)
    {
        self.addressField.text = self.title;
    }
    else if (self.URL)
    {
        self.addressField.text = self.URL;
    }
}

- (void)setTopbarTitle:(NSString *)title URL:(NSString *)URL
{
    self.title = title;
    self.URL = URL;

    [self updateTopbarContent];
}

- (void)setLoadingState:(BOOL)isLoading
{
    UIImage *image = nil;
    if (isLoading)
    {
        image = [UIImage imageNamed:@"Stop.png"];
    }
    else
    {
        image = [UIImage imageNamed:@"Refresh.png"];
    }
    
    [self.loadingButton setImage:image forState:UIControlStateNormal];
}

- (void)setProgressPercentage:(CGFloat)percentage
{
    [self.progressbar setPercentage:percentage];
}

- (void)updateBackwardState:(BOOL)canBackward forwardState:(BOOL)canForward
{
    self.backwardButton.enabled = canBackward;
    self.forwardButton.enabled = canForward;
}

#pragma mark - StateChanging
- (void)stateChangingAnimationDidStop
{
    self.state = self.animatingState;
    self.animating = NO;
    
    if (self.state != TopbarStateEdit)
    {
        [self.editMaskView removeFromSuperview];
    }
}
    
- (void)changeToState:(TopbarState)state animated:(BOOL)animated
{
    if (self.isAnimating /*|| state == self.state*/)
    {
        return;
    }
    
    if (DEVICE_PAD)
    {
        if (state == TopbarStateMini)
        {
            state = TopbarStateNormal;
        }
    }
    
    self.animatingState = state;
    self.animating = YES;
    
    if (animated)
    {
        [UIView beginAnimations:@"StateChangingAnimation" context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(stateChangingAnimationDidStop)];
    }
    
    CGRect pFrame = self.frame;
    CGRect addressViewFrame = self.addressView.frame;
    
    CGFloat addressBgViewAlpha = TOPBAR_ADDRESS_BACKGROUND_VIEW_ALPHA;
    CGFloat editMaskAlpha = 0;
    CGFloat loadingButtonAlpha = 0;
    CGFloat addButtonAlpha = 1;
    CGFloat backwardButtonAlpha = 1;
    CGFloat forwardButtonAlpha = 1;
    
    CGFloat addressFieldFontSize = TOPBAR_NORMAL_FONTSIZE;
    
    NSTextAlignment addressFieldAlignment = NSTextAlignmentCenter;
    switch (state)
    {
        case TopbarStateNormal:
        {
            pFrame.size.height = TOPBAR_NORMAL_HEIGHT;
            addressViewFrame.size.width = [self addressViewWidthForState:TopbarStateNormal];
            addressViewFrame.origin.x = TOPBAR_ADDRESS_VIEW_EDGE_INSET + CGRectGetMaxX(_forwardButton.frame);
            addressViewFrame.origin.y = STATUS_BAR_HEIGHT + TOPBAR_ADDRESS_VIEW_EDGE_INSET;
            addressViewFrame.size.height = CGRectGetHeight(pFrame) - STATUS_BAR_HEIGHT - TOPBAR_ADDRESS_VIEW_EDGE_INSET*2;
            
            loadingButtonAlpha = 1;
        }
            break;
        case TopbarStateEdit:
        {
            [self.superview addSubview:self.editMaskView];
            self.editMaskView.frame = [self.superview bounds];
            [self.superview bringSubviewToFront:self];
            
            pFrame.size.height = TOPBAR_NORMAL_HEIGHT;
            addressViewFrame.size.width = [self addressViewWidthForState:TopbarStateEdit];
            addressViewFrame.origin.x = TOPBAR_ADDRESS_VIEW_EDGE_INSET;
            addressViewFrame.origin.y = STATUS_BAR_HEIGHT + TOPBAR_ADDRESS_VIEW_EDGE_INSET;
            addressViewFrame.size.height = CGRectGetHeight(pFrame) - STATUS_BAR_HEIGHT - TOPBAR_ADDRESS_VIEW_EDGE_INSET*2;
            
            editMaskAlpha = TOPBAR_EDIT_MASK_VIEW_ALPHA;
            addButtonAlpha = 0;
            backwardButtonAlpha = 0;
            forwardButtonAlpha = 0;
            
            addressFieldAlignment = NSTextAlignmentLeft;
        }
            break;
        case TopbarStateMini:
        {
            pFrame.size.height = TOPBAR_MINI_HEIGHT;
            
            addressViewFrame.origin.y = STATUS_BAR_HEIGHT;
            addressViewFrame.size.height = TOPBAR_MINI_HEIGHT - STATUS_BAR_HEIGHT;
            
            addressBgViewAlpha = 0;
            
            addressFieldFontSize = TOPBAR_MINI_FONTSIZE;
        }
            break;
        default:
            break;
    }
    
    self.frame = pFrame;
    self.addressView.frame = addressViewFrame;
    
    self.addressBackgroundView.alpha = addressBgViewAlpha;
    self.editMaskView.alpha = editMaskAlpha;
    self.loadingButton.alpha = loadingButtonAlpha;
    self.addButton.alpha = addButtonAlpha;
    self.backwardButton.alpha = backwardButtonAlpha;
    self.forwardButton.alpha = forwardButtonAlpha;
    
    self.addressField.font = [UIFont systemFontOfSize:addressFieldFontSize];
    
    self.addressField.textAlignment = addressFieldAlignment;
    
    if (animated)
    {
        [UIView commitAnimations];
    }
    else
    {
        [self stateChangingAnimationDidStop];
    }
}

#pragma mark - Callbacks
- (void)editMaskClicked:(id)sender
{
    [self.addressField resignFirstResponder];
}

- (void)loadingButtonClicked:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(topbarView:didClickRefreshStop:)])
    {
        [self.delegate topbarView:self didClickRefreshStop:sender];
    }
}

- (void)addButtonClicked:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(topbarView:didClickAdd:)])
    {
        [self.delegate topbarView:self didClickAdd:sender];
    }
}

- (void)backwardButtonClicked:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(topbarView:didClickBackward:)])
    {
        [self.delegate topbarView:self didClickBackward:sender];
    }
}

- (void)forwardButtonClicked:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(topbarView:didClickForward:)])
    {
        [self.delegate topbarView:self didClickForward:sender];
    }
}

#pragma mark - TextField Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.addressField.text = self.URL;
    [self changeToState:TopbarStateEdit animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self changeToState:TopbarStateNormal animated:YES];
    
    [self updateTopbarContent];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![textField.text isEqualToString:self.URL] && [textField.text isEqualToString:self.title] )
    {
        self.URL = textField.text;
        self.title = nil;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(topbarView:didClickGoToWithText:)])
    {
        [self.delegate topbarView:self didClickGoToWithText:textField.text];
    }
    
    [textField resignFirstResponder];
    
    return YES;
}

@end
