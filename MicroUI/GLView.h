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

- (id)initWithBoundingBox:(CGRect)box;

- (void)updateWithController:(GLKViewController*)controller;

- (void)render:(GLGraphicsContext*) context;

- (void)renderWithShape:(GLShape*) shape;

@end