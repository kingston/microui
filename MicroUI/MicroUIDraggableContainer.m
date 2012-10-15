//
//  MicroUIDraggableContainer.m
//  MicroUI
//
//  Created by Kingston Tam on 10/14/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "MicroUIDraggableContainer.h"
#import "MicroUIDraggableLine.h"

@implementation MicroUIDraggableContainer

@synthesize lineArray = _lineArray;

- (NSMutableArray *)lineArray
{
    if (!_lineArray) {
        _lineArray = [[NSMutableArray alloc] init];
    }
    return _lineArray;
}

- (void)onTouchStart:(UITouch *)touch atPoint:(CGPoint)point
{
    if (currentTouch != nil) return; // ignore other touches
    currentTouch = [NSValue valueWithNonretainedObject:touch];
    dragStartTouchPosition = point;
    
    MicroUIDraggableLine *line = [[MicroUIDraggableLine alloc] init];
    //start and end point are relative to the bounding box
    CGPoint startPointInImage = CGPointMake(dragStartTouchPosition.x - self.boundingBox.origin.x, dragStartTouchPosition.y - self.boundingBox.origin.y);
    CGPoint endPointInImage = CGPointMake(point.x - self.boundingBox.origin.x, point.y - self.boundingBox.origin.y);
    line.startPoint = startPointInImage;
    line.endPoint = endPointInImage;
    [line setColor:GLKVector4Make(0., 0., 0., 1.)];
    [self.lineArray addObject:line];
    [self drawLinesInContainer];
}

- (void)onTouchMove:(UITouch *)touch atPoint:(CGPoint)point
{
    if ([currentTouch nonretainedObjectValue] != touch) return;
    MicroUIDraggableLine *line = [[MicroUIDraggableLine alloc] init];
    //start and end point are relative to the bounding box
    CGPoint startPointInImage = CGPointMake(dragStartTouchPosition.x - self.boundingBox.origin.x, dragStartTouchPosition.y - self.boundingBox.origin.y);
    CGPoint endPointInImage = CGPointMake(point.x - self.boundingBox.origin.x, point.y - self.boundingBox.origin.y);
    line.startPoint = startPointInImage;
    line.endPoint = endPointInImage;
    [line setColor:GLKVector4Make(1., 1., 1., 1.)];
    [self.lineArray removeLastObject];
    [self.lineArray addObject:line];
    [self drawLinesInContainer];
}

- (void)onTouchEnd:(UITouch *)touch atPoint:(CGPoint)point
{
    if ([currentTouch nonretainedObjectValue] != touch) return;
    currentTouch = nil;
    
    MicroUIDraggableLine *line = [[MicroUIDraggableLine alloc] init];
    //start and end point are relative to the bounding box
    CGPoint startPointInImage = CGPointMake(dragStartTouchPosition.x - self.boundingBox.origin.x, dragStartTouchPosition.y - self.boundingBox.origin.y);
    CGPoint endPointInImage = CGPointMake(point.x - self.boundingBox.origin.x, point.y - self.boundingBox.origin.y);
    line.startPoint = startPointInImage;
    line.endPoint = endPointInImage;
    [line setColor:GLKVector4Make(0., 0., 0., 1.)];
    [self.lineArray removeLastObject];
    [self.lineArray addObject:line];
    [self drawLinesInContainer];
}

- (void)drawLinesInContainer
{
    [self removeAllSubViews];
    for (MicroUIDraggableLine *line in self.lineArray) {
        [self addSubView:line];
    }
}

@end
