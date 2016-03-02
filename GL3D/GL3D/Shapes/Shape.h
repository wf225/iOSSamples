//
//  Shape.h
//  GL3D
//
//  Created by Bill Wu on 15/11/26.
//  Copyright © 2015 Autodesk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "GLView.h"
#import "GL2DUtils.h"

@interface Shape : NSObject
{
    Shape *_axisXYZ;
}

@property GLKVector4 color;
@property BOOL useConstantColor;
@property GLKVector3 position, scale;
@property GLKVector4 rotation; //x,y,z, 
@property(readonly) GLKMatrix4 modelviewMatrix;
@property(strong,readonly) GLKTextureInfo *texture;

- (void)renderInCanvas:(GLView *)canvas;

@end
