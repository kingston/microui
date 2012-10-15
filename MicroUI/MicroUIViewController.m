//
//  MicroUIViewController.m
//  MicroUI
//
//  Created by Kingston Tam on 10/13/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "MicroUIViewController.h"
#import "GLBox.h"
#import "MicroUILabel.h"
#import "MicroUIDraggableBox.h"
#import "MicroUIDraggableContainer.h"
#import "MicroUIButton.h"
#import "MicroUIImage.h"
#import "MicroUIDraggableLine.h"

@interface MicroUIViewController ()

@end

@implementation MicroUIViewController
- (void)setupSubViews:(GLView*)container
{
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    
    MicroUIImage *image = [[MicroUIImage alloc] initWithX:0 AndY:0 AndWidth:screenBounds.size.width AndHeight:screenBounds.size.height];
    [image setImage:[UIImage imageNamed:@"avatar.jpeg"]];
    [container addSubView:image];
    
    MicroUIDraggableContainer *dragContainer = [[MicroUIDraggableContainer alloc] initWithBoundingBox:CGRectMake(0, 0, screenBounds.size.width, screenBounds.size.height)];
    [container addSubView:dragContainer];
    
//    MicroUIDraggableBox *box = [[MicroUIDraggableBox alloc] initWithBoundingBox:CGRectMake(0, 0, 100, 100)];
//    [box setColor:GLKVector4Make(1.0, 0.0, 0.0, 1.0)];
//    [dragContainer addSubView:box];
    
    MicroUILabel *text = [[MicroUILabel alloc] initWithX:10 AndY:400 AndWidth:200 AndHeight:50];
    text.isCentered = YES;
    text.color = [UIColor redColor];
    [text setText:@"MicroUI by Kingston and Julie"];
    [container addSubView:text];
    
    MicroUIButton *button = [[MicroUIButton alloc] initWithX:100 AndY:400 AndWidth:200 AndHeight:50];
    [button setButtonText:@"Exit"];
    [container addSubView:button];
    
    MicroUIDraggableLine *line = [[MicroUIDraggableLine alloc] initWithBoundingBox:CGRectMake(100, 100, 100, 100)];
    //start and end point are relative to the bounding box
    line.startPoint = CGPointMake(0, 0);
    line.endPoint = CGPointMake(100, 100);
    [line setColor:GLKVector4Make(0., 0., 0., 1.)];
    [dragContainer addSubView:line];
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
