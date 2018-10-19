//
//  CustomBackboneInterface.m
//  ASBunqAssignment
//
//  Created by Alessio Sardella on 07/09/18.
//  Copyright © 2018 Alessio Sardella. All rights reserved.
//

#import "CustomBackboneInterface.h"
#define left_button_tag 390
#define title_label_tag 391
#define right_button_tag 392

@implementation CustomBackboneInterface

- (instancetype)initWithFrame:(CGRect)frame title:(NSString*)title{
 
    self = [super initWithFrame:frame];
    if (self) {
        
        _status = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, [UIApplication sharedApplication].statusBarFrame.size.height)];
        _status.backgroundColor = [UIColor defaultNavigationBarColor];
        [self addSubview:_status];
        
        _navigation = [[UIView alloc]initWithFrame:CGRectMake(0, [MUtilities getBottomYpointForView:_status], frame.size.width, 50)];
        _navigation.backgroundColor = [UIColor defaultNavigationBarColor];
        [MUtilities addBottomBorderOnView:_navigation withPad:0 color:[UIColor blackColor]];
        [self addSubview:_navigation];
        
        int pad = 10;
        CGSize buttonSize = CGSizeMake(50, 30);
        float titleLabelW = _navigation.frame.size.width - 2*buttonSize.width - 4*pad;
        
        UILabel* titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(buttonSize.width + pad*2, pad, titleLabelW, buttonSize.height)];
        titleLabel.text = title;
        titleLabel.adjustsFontSizeToFitWidth = YES;
        titleLabel.minimumScaleFactor = 0.1f;
        titleLabel.clipsToBounds = YES;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:24];
        titleLabel.textColor = [UIColor defaultNavigationBarTextColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.tag = title_label_tag;
        [_navigation addSubview:titleLabel];
        
        
        _container = [[UIView alloc]initWithFrame:CGRectMake(0,
                                                             [MUtilities getBottomYpointForView:_navigation],
                                                             _navigation.frame.size.width,
                                                             self.frame.size.height - _navigation.frame.size.height - _status.frame.size.height)];
        _container.backgroundColor = [UIColor clearColor];
        [self addSubview:_container];
    }
    return self;
}

- (void)addLeftNavigationButtonWithImageNamed:(NSString*)imageName action:(SEL)action onTarget:(id)target{
    
    int pad = 10;
    CGSize buttonSize = CGSizeMake(50, 30);
    
    UIButton* T1button = [UIButton buttonWithType:UIButtonTypeCustom];
    [T1button setFrame:CGRectMake(pad, pad, buttonSize.width, buttonSize.height)];
    [T1button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [T1button setBackgroundColor:[UIColor clearColor]];
    [T1button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    T1button.tag = left_button_tag;
    [_navigation addSubview:T1button];
}

- (void)addRightNavigationButtonWithImageNamed:(NSString*)imageName action:(SEL)action onTarget:(id)target{
    
    int pad = 10;
    CGSize buttonSize = CGSizeMake(50, 30);
    
    UIButton* T2button = [UIButton buttonWithType:UIButtonTypeCustom];
    [T2button setFrame:CGRectMake(_navigation.frame.size.width - pad - buttonSize.width, pad, buttonSize.width, buttonSize.height)];
    [T2button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [T2button setBackgroundColor:[UIColor clearColor]];
    [T2button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    T2button.tag = right_button_tag;
    [_navigation addSubview:T2button];
    
}

- (void)setNavigationTitle:(NSString*)title{
    ((UILabel*)[self viewWithTag:title_label_tag]).text = title;
}

- (void)showBottomButtonWhitTitle:(NSString*)title target:(id)target action:(SEL)action{
    
    int bottom_button_height = 50;
    if (!_bottomButtonIsVisible) {
        float padX = 5.00f;
        UIButton* bottomButton = [[UIButton alloc]initWithFrame:CGRectMake(padX,
                                                                               self.frame.size.height - bottom_button_height - padX/2,
                                                                               self.frame.size.width - 2*padX,
                                                                               bottom_button_height - padX)];
        
        [bottomButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [bottomButton setBackgroundColor:[UIColor defaultNavigationBarColor]];
        [bottomButton setTitle:title forState:UIControlStateNormal];
        [bottomButton.titleLabel setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightBold]];
        [bottomButton.titleLabel setTextColor:[UIColor whiteColor]];
        bottomButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        bottomButton.tag = 333555;
        bottomButton.layer.cornerRadius = 5.0f;
        bottomButton.layer.masksToBounds = YES;
        
        [self addSubview:bottomButton];
        _bottomButtonIsVisible = YES;
        
        [_container setFrame:CGRectMake(_container.frame.origin.x,
                                        _container.frame.origin.y,
                                        _container.frame.size.width,
                                        _container.frame.size.height - bottom_button_height - padX)];
    }else{
        
        UIButton* bottomButton = (UIButton*)[self viewWithTag:333555];
        [bottomButton setTitle:title forState:UIControlStateNormal];
        
    }
    
}

@end
