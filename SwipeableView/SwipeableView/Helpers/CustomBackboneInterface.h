//
//  CustomBackboneInterface.h
//  ASBunqAssignment
//
//  Created by Alessio Sardella on 07/09/18.
//  Copyright © 2018 Alessio Sardella. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomBackboneInterface : UIView

@property (strong,nonatomic) UIView* status;
@property (strong,nonatomic) UIView* navigation;
@property (strong,nonatomic) UILabel* titleLabel;
@property (strong,nonatomic) UIView* container;
@property (assign,nonatomic) BOOL bottomButtonIsVisible;
- (instancetype)initWithFrame:(CGRect)frame title:(NSString*)title;
- (void)addLeftNavigationButtonWithImageNamed:(NSString*)imageName action:(SEL)action onTarget:(id)target;
- (void)addRightNavigationButtonWithImageNamed:(NSString*)imageName action:(SEL)action onTarget:(id)target;
- (void)showBottomButtonWhitTitle:(NSString*)title target:(id)target action:(SEL)action;
@end
