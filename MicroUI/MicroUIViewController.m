//
//  MicroUIViewController.m
//  MicroUI
//
//  Created by Kingston Tam on 10/13/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "MicroUIViewController.h"
#import "GLBox.h"

@interface MicroUIViewController ()

@end

@implementation MicroUIViewController
- (void)setupSubViews:(GLView*)container
{
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    
    MicroUIImage *image = [[MicroUIImage alloc] initWithX:0 AndY:0 AndWidth:screenBounds.size.width AndHeight:screenBounds.size.height];
    [image setImage:[UIImage imageNamed:@"avatar.jpeg"]];
    [container addSubView:image];
    
    dragContainer = [[MicroUIDraggableContainer alloc] initWithBoundingBox:CGRectMake(0, 0, screenBounds.size.width, screenBounds.size.height)];
    [container addSubView:dragContainer];
    MicroUIDraggableBox *box = [[MicroUIDraggableBox alloc] initWithBoundingBox:CGRectMake(0, 0, 100, 100)];
    [box setColor:GLKVector4Make(1.0, 0.0, 0.0, 1.0)];
    [dragContainer.viewArray addObject:box];
    [dragContainer drawViewsInContainer];
    
    MicroUILabel *text = [[MicroUILabel alloc] initWithX:10 AndY:400 AndWidth:200 AndHeight:50];
    text.isCentered = YES;
    text.color = [UIColor redColor];
    [text setText:@"MicroUI by Kingston and Julie"];
    [container addSubView:text];
    
    exitButton = [[MicroUIButton alloc] initWithX:225 AndY:400 AndWidth:90 AndHeight:50];
    [exitButton setButtonText:@"Exit"];
    [exitButton setDelegate:self];
    [container addSubView:exitButton];
    
    deleteButton = [[MicroUIButton alloc] initWithX:225 AndY:325 AndWidth:90 AndHeight:50];
    [deleteButton setButtonText:@"Remove"];
    [deleteButton setDelegate:self];
    [container addSubView:deleteButton];
}

- (void)onButtonPress:(CGPoint)point withSender:(GLView*)sender
{
    if (sender == exitButton) exit(0);
    if (sender == deleteButton) {
        [dragContainer removeSelectedViewsInContainer];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
