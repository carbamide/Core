//
//  GradientButton.h
//  Spectangle
//
//  Created by Josh Barrow on 4/9/13.
//  Copyright (c) 2013 DecisionPoint Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradientButton : UIButton

@property (nonatomic, strong) UIColor *highColor;
@property (nonatomic, strong) UIColor *lowColor;
@property (nonatomic, strong) CALayer *wrapperLayer;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end
