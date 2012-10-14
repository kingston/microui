//
//  MicroUILabel.m
//  MicroUI
//
//  Created by Kingston Tam on 10/14/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

// Text code adapted from http://www.codza.com/creating-and-drawing-on-a-new-uiimage

#import "MicroUILabel.h"

@implementation MicroUILabel

@synthesize text, font;

- (id)initWithBoundingBox:(CGRect)box
{
    self = [super initWithBoundingBox:box];
    if (self)
    {
        text = @"";
        font = [UIFont fontWithName:@"Helvetica" size:14.0f];
    }
    return self;
}

- (void)setText:(NSString *)_text
{
    text = _text;
    cachedTexture = nil;
}

- (void)setBoundingBox:(CGRect)boundingBox
{
    [super setBoundingBox:boundingBox];
    
    // Reset cache if bounds are changed
    cachedTexture = nil;
}

- (UIImage*)getTextImage
{
    UIGraphicsBeginImageContext(self.boundingBox.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIGraphicsPushContext(context);
    
    [text drawInRect:CGRectMake(0, 0, self.boundingBox.size.width, self.boundingBox.size.height) withFont:font lineBreakMode:NSLineBreakByClipping alignment:NSTextAlignmentLeft];
    
    UIGraphicsPopContext();
    
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return outputImage;
}

- (void)renderToShape:(GLShape *)shape
{
    [super renderToShape:shape];
    
    GLRectangle *rect = [[GLRectangle alloc] init];
    rect.color = GLKVector4Make(1,0,0,0);
    rect.useConstantColor = YES;
    rect.width = self.boundingBox.size.width;
    rect.height = self.boundingBox.size.height;
    if (cachedTexture == nil) {
        [rect setTextureImage:[self getTextImage]];
        cachedTexture = [rect texture];
    } else {
        [rect setTexture: cachedTexture];
    }
    rect.textureCoordinates[0] = GLKVector2Make(0,0);
    rect.textureCoordinates[1] = GLKVector2Make(1,0);
    rect.textureCoordinates[2] = GLKVector2Make(1,1);
    rect.textureCoordinates[3] = GLKVector2Make(0,1);
    [shape addChild:rect];
}
@end
