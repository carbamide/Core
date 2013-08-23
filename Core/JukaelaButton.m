//
//  GradientButton.m
//  Spectangle
//
//  Created by Josh Barrow on 4/9/13.
//  Copyright (c) 2013 DecisionPoint Systems. All rights reserved.
//

#import "GradientButton.h"

@interface GradientButton ()
- (UIColor *)darkerColorForColor:(UIColor *)color;
@end

@implementation GradientButton

- (id)initWithFrame:(CGRect)frame withHighColor:(UIColor *)firstColor andLowColor:(UIColor *)secondColor
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setHighColor:firstColor];
        [self setLowColor:secondColor];
    }
    return self;
}

- (void) awakeFromNib
{
    [self setupGradient];
}

-(void)drawRect:(CGRect)rect
{
    [self setupGradient];
}

-(void)setupGradient
{
    [self setClipsToBounds:NO];
    
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        [_gradientLayer setFrame:[self bounds]];
        [_gradientLayer setColors:@[(id)[_highColor CGColor], (id)[_lowColor CGColor]]];
        
        _wrapperLayer = [CALayer layer];
        [_wrapperLayer setFrame:[self bounds]];
        [_wrapperLayer setCornerRadius:5.0f];
        [_wrapperLayer setMasksToBounds:YES];
        [_wrapperLayer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [_wrapperLayer setBorderWidth:1.0f];
        
        [_wrapperLayer addSublayer:_gradientLayer];
        
        [[self layer] insertSublayer:_wrapperLayer atIndex:0];
    }
    else {
        if (self.highlighted) {
            return;
        }
        
        [_gradientLayer setColors:@[(id)[_highColor CGColor], (id)[_lowColor CGColor]]];
    }
    
    [[self layer] setShadowColor:[[UIColor blackColor] CGColor]];
    [[self layer] setShadowOffset:CGSizeMake(2, 2)];
    [[self layer] setShadowOpacity:0.8f];
    [[self layer] setShadowRadius:5.0f];
    [[self layer] setShadowPath:[[UIBezierPath bezierPathWithRoundedRect:[self bounds] cornerRadius:5.0f] CGPath]];
}

-(void)setHighlighted:(BOOL)highlighted
{
    if (highlighted != self.highlighted){
        UIColor *darkColor = [self darkerColorForColor:_highColor];
        UIColor *lowColor = [self darkerColorForColor:_lowColor];

        [_gradientLayer setColors:@[(id)[darkColor CGColor], (id)[lowColor CGColor]]];
        
        [[self layer] replaceSublayer:_gradientLayer with:_gradientLayer];
    }
    
    [self setNeedsDisplay];
    
    [super setHighlighted:highlighted];
}

- (UIColor *)darkerColorForColor:(UIColor *)color
{
    float red, green, blue, alpha;
    
    if ([color getRed:&red green:&green blue:&blue alpha:&alpha]) {
        return [UIColor colorWithRed:MAX(red - 0.2, 0.0) green:MAX(green - 0.2, 0.0) blue:MAX(blue - 0.2, 0.0) alpha:alpha];
    }
    
    return nil;
}
@end
