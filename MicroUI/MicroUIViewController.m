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
- (void)setupSubViews:(GLContainerView*)container
{
    GLBox *box = [[GLBox alloc] initWithBoundingBox:CGRectMake(0, 0, 1000, 1000)];
    [box setColor:GLKVector4Make(1.0, 0.0, 0.0, 1.0)];
    [container addView:box];
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
