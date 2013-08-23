//
//  JukaelaButton.m
//  JukaelaCore
//
//  Created by Josh Barrow on 4/9/13.
//  Copyright (c) 2013 Jukaela Enterprises.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "JukaelaButton.h"

@interface JukaelaButton ()
- (UIColor *)darkerColorForColor:(UIColor *)color;
@end

@implementation JukaelaButton

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
