//
//  MicroUIDraggableBox.h
//  MicroUI
//
//  Created by Kingston Tam on 10/14/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "GLBox.h"

@interface MicroUIDraggableBox : GLBox {
    NSValue *currentTouch;
    CGPoint dragStartBoxPosition;
    CGPoint dragStartTouchPosition;
}

@end
