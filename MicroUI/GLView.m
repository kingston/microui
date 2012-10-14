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

- (void)render
{
    // Also nothing :)
}

@end
