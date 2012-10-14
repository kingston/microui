//
//  GLViewController.m
//  MicroUI
//
//  Created by Kingston Tam on 10/13/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "GLViewController.h"

@interface GLViewController ()

@end

@implementation GLViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setupOpenGL
{
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:context];
    
    GLKView *view = (GLKView*)[self view];
    [view setContext:context];
    
    graphicsContext = [[GLGraphicsContext alloc] init];
    [graphicsContext setBaseEffect: [[GLKBaseEffect alloc] init]];
}

- (void)setupBaseView
{
    CGRect bounds = [[self view] bounds];
    baseView = [[GLContainerView alloc] initWithBoundingBox:bounds];
    [self setupSubViews:(GLContainerView *)baseView];
}

- (void)setupSubViews:(GLContainerView*)container
{
    // no sub views to add
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setupOpenGL];
    [self setupBaseView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    if ([EAGLContext currentContext] != nil) {
        //TODO: Destroy context?
    }
}

- (void)glkViewControllerUpdate:(GLKViewController *)controller
{
    [baseView updateWithController:controller];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    // We do all our clearing stuff here
    glClearColor(1.0, 1.0, 1.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [baseView render:graphicsContext];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
