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

@interface MicroUIViewController ()

@end

@implementation MicroUIViewController
- (void)setupSubViews:(GLContainerView*)container
{
    GLBox *box = [[GLBox alloc] initWithBoundingBox:CGRectMake(100, 100, 100, 100)];
    [box setColor:GLKVector4Make(1.0, 0.0, 0.0, 1.0)];
    [container addView:box];
    
    MicroUILabel *text = [[MicroUILabel alloc] initWithX:100 AndY:300 AndWidth:200 AndHeight:50];
    [text setText:@"AAAHHH"];
    [container addView:text];
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
