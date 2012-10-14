//
//  GLContainerView.m
//  MicroUI
//
//  Created by Kingston Tam on 10/13/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "GLContainerView.h"

@implementation GLContainerView

@synthesize views;

- (id)initWithBoundingBox:(CGRect)box
{
    self = [super initWithBoundingBox:box];
    if (self) {
        views = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)updateWithController:(GLKViewController *)controller
{
    [views makeObjectsPerformSelector:@selector(updateWithController:) withObject:controller];
}

- (void)render:(GLGraphicsContext*)context
{
    [views makeObjectsPerformSelector:@selector(render) withObject:context];
}

- (void)addView:(GLView *)view
{
    [views addObject:view];
}

@end
