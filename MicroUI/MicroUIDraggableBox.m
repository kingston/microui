//
//  MicroUIDraggableBox.m
//  MicroUI
//
//  Created by Kingston Tam on 10/14/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "MicroUIDraggableBox.h"

@implementation MicroUIDraggableBox

- (id)initWithBoundingBox:(CGRect)box
{
    self = [super initWithBoundingBox:box];
    if (self) {
        currentTouch = nil;
    }
    return self;
}

- (void)onTouchStart:(UITouch *)touch atPoint:(CGPoint)point
{
    if (currentTouch != nil) return; // ignore other touches
    currentTouch = [NSValue valueWithNonretainedObject:touch];
    dragStartBoxPosition = self.boundingBox.origin;
    dragStartTouchPosition = point;
}

- (void)onTouchMove:(UITouch *)touch atPoint:(CGPoint)point
{
    if ([currentTouch nonretainedObjectValue] != touch) return;
    CGPoint newPt = dragStartBoxPosition;
    newPt.x += point.x - dragStartTouchPosition.x;
    newPt.y += point.y - dragStartTouchPosition.y;
    
    CGRect box = self.boundingBox;
    box.origin = newPt;
    self.boundingBox = box;
}

- (void)onTouchEnd:(UITouch *)touch atPoint:(CGPoint)point
{
    if ([currentTouch nonretainedObjectValue] != touch) return;
    currentTouch = nil;
}

@end
