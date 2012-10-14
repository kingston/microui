//
//  GLBox.m
//  MicroUI
//
//  Created by Kingston Tam on 10/14/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "GLBox.h"
#import "GLRectangle.h"

@implementation GLBox

@synthesize color;

- (void)renderWithShape:(GLShape *)shape
{
    GLRectangle *rect = [[GLRectangle alloc] init];
    rect.width = self.boundingBox.size.width;
    rect.height = self.boundingBox.size.height;
    [shape addChild:rect];
}
@end
