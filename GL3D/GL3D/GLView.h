//
//  EAGLView.h
//  GL3D
//
//  Created by Bill Wu on 15/11/26.
//  Copyright © 2015 Autodesk. All rights reserved.
//

#import <GLKit/GLKit.h>

@interface GLView : GLKView

@property GLKVector4 clearColor;
@property float left, right, bottom, top;
@property(readonly) GLKMatrix4 projectionMatrix;
@property(strong,readonly) NSMutableArray *shapes;

- (void)setupGL;

@end