//
//  GLShape.m
//  MicroUI
//
//  Created by Kingston Tam on 10/13/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

#import "GLShape.h"

@implementation GLShape

@synthesize parent, children, position, color, useConstantColor, texture;

-(id)init {
    self = [super init];
    if (self) {
        children = [[NSMutableArray alloc] init];
    }
    return self;
}

-(int)numVertices
{
    return 0;
}

- (GLKVector2 *)vertices {
    if (vertexData == nil)
        vertexData = [NSMutableData dataWithLength:sizeof(GLKVector2)*self.numVertices];
    return [vertexData mutableBytes];
}

- (GLKVector4 *)vertexColors {
    if (vertexColorData == nil)
        vertexColorData = [NSMutableData dataWithLength:sizeof(GLKVector4)*self.numVertices];
    return [vertexColorData mutableBytes];
}

- (GLKVector2 *)textureCoordinates {
    if (textureCoordinateData == nil)
        textureCoordinateData = [NSMutableData dataWithLength:sizeof(GLKVector2)*self.numVertices];
    return [textureCoordinateData mutableBytes];
}

-(GLKMatrix4)modelviewMatrix {
    GLKMatrix4 modelviewMatrix =GLKMatrix4MakeTranslation(position.x, position.y, 0);
    
    if (parent != nil)
        modelviewMatrix = GLKMatrix4Multiply(parent.modelviewMatrix, modelviewMatrix);
    
    return modelviewMatrix;
}

-(void)renderWithContext:(GLGraphicsContext *)context
{
    if ([self numVertices] > 0) {
        GLKBaseEffect *effect = [context baseEffect];
        
        // Set up the constant color effect if set
        if (useConstantColor) {
            effect.useConstantColor = YES;
            effect.constantColor = self.color;
        } else {
            effect.useConstantColor = NO;
        }
        
        effect.transform.modelviewMatrix = self.modelviewMatrix;
        
        [effect prepareToDraw];
        
        // Enable transparency
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        
        // Tell OpenGL that we'll be using vertex position data
        glEnableVertexAttribArray(GLKVertexAttribPosition);
        glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.vertices);
        
        // If we're using vertex coloring, tell OpenGL that we'll be using vertex color data
        if (!useConstantColor) {
            glEnableVertexAttribArray(GLKVertexAttribColor);
            glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, 0, self.vertexColors);
        }
        
        // If we have a texture, tell OpenGL that we'll be using texture coordinate data
        
        if (texture != nil) {
            glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
            glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 0, self.textureCoordinates);
        }
        
        // Draw our primitives!
        glDrawArrays(GL_TRIANGLE_FAN, 0, self.numVertices);
        
        // Draw our primitives!
        glDrawArrays(GL_TRIANGLE_FAN, 0, self.numVertices);
        
        // Cleanup: Done with position data
        glDisableVertexAttribArray(GLKVertexAttribPosition);
        
        // Cleanup: Done with color data (only if we used it)
        if (!useConstantColor)
            glDisableVertexAttribArray(GLKVertexAttribColor);
        
        // Cleanup: Done with texture data (only if we used it)
        if (self.texture != nil)
            glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
        
        // Cleanup: Done with the current blend function
        glDisable(GL_BLEND);
    }
    
    // Draw our children
    [children makeObjectsPerformSelector:@selector(renderWithContext:) withObject:context];
}

-(void)setTextureImage:(UIImage *)image {
    NSError *error;
    texture = [GLKTextureLoader textureWithCGImage:image.CGImage options:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:GLKTextureLoaderOriginBottomLeft] error:&error];
    if (error) {
        NSLog(@"Error loading texture from image: %@",error);
    }
}

- (void)addChild:(GLShape *)child
{
    child.parent = self;
    [children addObject:child];
}
@end
