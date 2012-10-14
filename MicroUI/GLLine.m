//
//  GLLine.m
//  MicroUI
//
//  Created by Julie Fortuna on 10/14/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "GLLine.h"

@implementation GLLine

@synthesize length = _length;

- (int)numVertices
{
    return 2;
}

- (void)updateVertices
{
    self.vertices[0] = GLKVector2Make(0, 0);
    self.vertices[1] = GLKVector2Make(0, self.length);
}

- (void)setLength:(float)length
{
    _length = length;
    [self updateVertices];
}

@end
