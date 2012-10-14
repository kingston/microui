//
//  GLView.m
//  MicroUI
//
//  Created by Kingston Tam on 10/13/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "GLView.h"

@implementation GLView

@synthesize boundingBox, parent, subviews;

- (id) init
{
    return [self initWithBoundingBox:CGRectMake(0, 0, 0, 0)];
}

- (id)initWithX:(float)x AndY:(float)y AndWidth:(float)width AndHeight:(float)height
{
    return [self initWithBoundingBox:CGRectMake(x, y, width, height)];
}

- (id) initWithBoundingBox:(CGRect)box
{
    self = [super init];
    if (self) {
        boundingBox = box;
        subviews = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)updateWithController:(GLKViewController *)controller
{
    [subviews makeObjectsPerformSelector:@selector(updateWithController:) withObject:controller];
}

- (void)render:(GLGraphicsContext*)context
{
    // Slightly awkward... :/
    
    // By default, render a base shape if we are subclassing
    if ([self class] != [GLView class]) {
        GLShape *baseShape = [[GLShape alloc] init];
        baseShape.position = GLKVector2Make(boundingBox.origin.x, boundingBox.origin.y);
        [self renderToShape:baseShape];
        [baseShape renderWithContext:context];
    }
    
    // Render sub views afterwards
    [subviews makeObjectsPerformSelector:@selector(render:) withObject:context];
}

- (void)renderToShape:(GLShape *)shape
{
    // No shapes to render :)
}

- (void)addSubView:(GLView *)view
{
    view.parent = self;
    [subviews addObject:view];
}

- (BOOL)hitTestForPoint:(CGPoint)point
{
    return CGRectContainsPoint(self.boundingBox, point);
}

- (GLView *)hitTestForTouchAtPoint:(CGPoint)point
{
    NSLog(@"%f, %f", point.x, point.y);
    if ([self hitTestForPoint:point]) {
        // Check if any subviews are in bounding box
        // reversed so that we get top most first
        for (GLView *view in [subviews reverseObjectEnumerator]) {
            GLView *targettedView = [view hitTestForTouchAtPoint:point];
            if (targettedView) return targettedView;
        }
        return self;
    }
    return nil;
}

@end
