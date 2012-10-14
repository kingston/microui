//
//  MicroUIButton.m
//  MicroUI
//
//  Created by Kingston Tam on 10/14/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "MicroUIButton.h"

@implementation MicroUIButton
- (id)initWithBoundingBox:(CGRect)box
{
    self = [super initWithBoundingBox:box];
    if (self) {
        self.normalColor = GLKVector4Make(0, 0, 1, 1);
        self.activeColor = GLKVector4Make(0.5, 0.5, 1, 1);
        self.leftColor = GLKVector4Make(0.25, 0.25, 1, 1);
        
        rect = [[GLBox alloc] initWithBoundingBox:box];
        rect.color = normalColor;
        [self addSubView:rect];
        label = [[MicroUILabel alloc] initWithBoundingBox:box];
        label.isCentered = true;
        label.color = [UIColor whiteColor];
        label.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.0];
        [self addSubView:label];
    }
    return self;
}

- (void)setButtonText:(NSString *)_buttonText
{
    label.text = _buttonText;
}

- (NSString *)buttonText
{
    return label.text;
}

- (void)onTouchStart:(UITouch *)touch atPoint:(CGPoint)point
{
    rect.color = activeColor;
}

- (void)onTouchMove:(UITouch *)touch atPoint:(CGPoint)point
{
    if ([self hitTestForPoint:point]) {
        rect.color = activeColor;
    } else {
        rect.color = leftColor;
    }
}

- (void)onTouchEnd:(UITouch *)touch atPoint:(CGPoint)point
{
    rect.color = normalColor;
}

@synthesize activeColor, normalColor, leftColor, buttonText;

@end
