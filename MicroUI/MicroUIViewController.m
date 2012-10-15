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
    
    exitButton = [[MicroUIButton alloc] initWithX:100 AndY:400 AndWidth:200 AndHeight:50];
    [exitButton setButtonText:@"Exit"];
    [exitButton setDelegate:self];
    [container addSubView:exitButton];
    
//    MicroUIDraggableLine *line = [[MicroUIDraggableLine alloc] initWithBoundingBox:CGRectMake(100, 100, 100, 100)];
//    //start and end point are relative to the bounding box
//    line.startPoint = CGPointMake(0, 0);
//    line.endPoint = CGPointMake(100, 100);
//    [line setColor:GLKVector4Make(0., 0., 0., 1.)];
//    [dragContainer addSubView:line];

//    MicroUIImage *image = [[MicroUIImage alloc] initWithX:100 AndY:200 AndWidth:100 AndHeight:100];
//    [image setImage:[UIImage imageNamed:@"avatar.jpeg"]];
//    [container addSubView:image];
    
//    MicroUIDraggableLine *line = [[MicroUIDraggableLine alloc] initWithX:0 AndY:0 AndWidth:0 AndHeight:0];
//    [line setStartPoint:CGPointMake(200, 200)];
//    [line setEndPoint:CGPointMake(300, 300)];
//    [container addSubView:line];
}

- (void)onButtonPress:(CGPoint)point withSender:(GLView*)sender
{
    if (sender == exitButton) exit(0);
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
