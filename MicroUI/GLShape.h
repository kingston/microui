//
//  GLShape.h
//  MicroUI
//
//  Created by Kingston Tam on 10/13/12.
//  Copyright (c) 2012 KT & JF Inc. All rights reserved.
//

// Borrowing the general concept from the tutorial: http://games.ianterrell.com/2d-game-engine-tutorial/

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "GLGraphicsContext.h"

@interface GLShape : NSObject {
    NSMutableData *vertexData, *vertexColorData, *textureCoordinateData;
}

@property(readonly) int numVertices;
@property(readonly) GLKVector2 *vertices;
@property(readonly) GLKVector4 *vertexColors;
@property(readonly) GLKVector2 *textureCoordinates;
@property GLKVector4 color;
@property BOOL useConstantColor;
@property(strong,readonly) GLKTextureInfo *texture;

@property GLKVector2 position;

@property(weak) GLShape *parent;
@property(strong, readonly) NSMutableArray *children;

- (void)renderWithContext:(GLGraphicsContext*)context;
- (void)addChild:(GLShape *)child;

@end
