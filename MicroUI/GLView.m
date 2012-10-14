//
//  GLView.m
//  MicroUI
//
//  Created by Kingston Tam on 10/13/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "GLView.h"

@implementation GLView

@synthesize boundingBox;

- (id) initWithBoundingBox:(CGRect)box
{
    self = [super init];
    if (self) {
        boundingBox = box;
    }
    return self;
}

- (void)updateWithController:(GLKViewController *)controller
{
    // Do absolutely nothing
}

- (void)render:(GLGraphicsContext*)context
{
    // By default, render a base shape
    GLShape *baseShape = [[GLShape alloc] init];
    baseShape.position = GLKVector2Make(boundingBox.origin.x, boundingBox.origin.y);
    [self renderWithShape:baseShape];
    [baseShape renderWithContext:context];
}

- (void)renderWithShape:(GLShape *)shape
{
    // No shapes to render :)
}

@end
