//
//  GLView.h
//  MicroUI
//
//  Created by Kingston Tam on 10/13/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "GLShape.h"
#import "GLGraphicsContext.h"

@interface GLView : NSObject

@property (nonatomic)CGRect boundingBox;
@property (nonatomic, weak)GLView *parent;
@property (nonatomic, readonly, strong)NSMutableArray *subviews;

- (id)initWithX:(float)x AndY:(float)y AndWidth:(float)width AndHeight:(float)height;

- (id)initWithBoundingBox:(CGRect)box;

- (void)updateWithController:(GLKViewController*)controller;

- (void)render:(GLGraphicsContext*)context;

- (void)renderToShape:(GLShape*)shape;

- (void)addSubView:(GLView*)view;

- (GLView *)hitTestForTouchAtPoint:(CGPoint)point;

@end