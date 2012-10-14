//
//  GLContainerView.h
//  MicroUI
//
//  Created by Kingston Tam on 10/13/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "GLView.h"

@interface GLContainerView : GLView

@property (nonatomic, readonly, strong)NSMutableArray *views;

- (void)addView:(GLView*)view;

- (GLView *)hitTestForTouchAtPoint:(CGPoint)point;

@end
