//
//  MicroUIDraggableLine.h
//  MicroUI
//
//  Created by Kingston Tam on 10/14/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "MicroUIDraggableView.h"
#import "MicroUIDraggableEndpoint.h"

@interface MicroUIDraggableLine : MicroUIDraggableView {
    MicroUIDraggableEndpoint *start;
    MicroUIDraggableEndpoint *end;
}

@property(nonatomic) CGPoint startPoint;
@property(nonatomic) CGPoint endPoint;

@end