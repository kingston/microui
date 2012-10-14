//
//  MicroUIDraggableLine.m
//  MicroUI
//
//  Created by Kingston Tam on 10/14/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "MicroUIDraggableLine.h"
#import "GLLine.h"
#define ENDPOINT_RADIUS 3

@implementation MicroUIDraggableLine

- (id)initWithBoundingBox:(CGRect)box
{
    self = [super initWithBoundingBox:box];
    if (self) {
        start = [[MicroUIDraggableEndpoint alloc] initWithX:0 AndY:0 AndWidth:ENDPOINT_RADIUS AndHeight:ENDPOINT_RADIUS];
        end = [[MicroUIDraggableEndpoint alloc] initWithX:0 AndY:0 AndWidth:ENDPOINT_RADIUS AndHeight:ENDPOINT_RADIUS];
    }
    return self;
}

@synthesize startPoint, endPoint;

- (void)setStartPoint:(CGPoint)_startPoint
{
    startPoint = _startPoint;
    [start setPosition:_startPoint];
}

- (void)setEndPoint:(CGPoint)_endPoint
{
    endPoint = _endPoint;
    [end setPosition:_endPoint];
}

- (void)renderToShape:(GLShape *)shape
{
    GLLine *line = [[GLLine alloc] init];
    line.start = self.startPoint;
    line.end = self.endPoint;
    line.color = self.color;
    line.useConstantColor = YES;
    [shape addChild:line];
}

@end
