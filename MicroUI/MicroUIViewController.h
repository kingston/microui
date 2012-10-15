//
//  MicroUIViewController.h
//  MicroUI
//
//  Created by Kingston Tam on 10/13/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "GLViewController.h"
#import "MicroUILabel.h"
#import "MicroUIDraggableBox.h"
#import "MicroUIDraggableContainer.h"
#import "MicroUIButton.h"
#import "MicroUIImage.h"
#import "MicroUIDraggableLine.h"
#import "MicroUIButtonDelegate.h"

@interface MicroUIViewController : GLViewController<MicroUIButtonDelegate> {
    MicroUIButton *exitButton;
    MicroUIButton *deleteButton;
    MicroUIDraggableContainer *dragContainer;
}

@end
