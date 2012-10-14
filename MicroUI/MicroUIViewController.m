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

@interface MicroUIViewController ()

@end

@implementation MicroUIViewController
- (void)setupSubViews:(GLView*)container
{
    MicroUIDraggableContainer *dragContainer = [[MicroUIDraggableContainer alloc] initWithBoundingBox:CGRectMake(50, 50, 300, 300)];
    [container addSubView:dragContainer];
    
    MicroUIDraggableBox *box = [[MicroUIDraggableBox alloc] initWithBoundingBox:CGRectMake(0, 0, 100, 100)];
    [box setColor:GLKVector4Make(1.0, 0.0, 0.0, 1.0)];
    [dragContainer addSubView:box];
    
    MicroUILabel *text = [[MicroUILabel alloc] initWithX:100 AndY:300 AndWidth:200 AndHeight:50];
    text.isCentered = YES;
    text.color = [UIColor redColor];
    [text setText:@"AAAHHH"];
    [container addSubView:text];
    
    MicroUIButton *button = [[MicroUIButton alloc] initWithX:100 AndY:400 AndWidth:200 AndHeight:50];
    [button setButtonText:@"touch me"];
    [container addSubView:button];
    
    MicroUIImage *image = [[MicroUIImage alloc] initWithX:100 AndY:200 AndWidth:100 AndHeight:100];
    [image setImage:[UIImage imageNamed:@"avatar.jpeg"]];
    [container addSubView:image];
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
