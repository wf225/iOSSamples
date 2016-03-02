//
//  Shape.m
//  GL3D
//
//  Created by Bill Wu on 15/11/26.
//  Copyright © 2015 Autodesk. All rights reserved.
//

#import "Shape.h"

@implementation Shape

-(id)init
{
    self = [super init];
    if (self)
    {
        // Draw with the color white
        _useConstantColor = YES;
        _color = GLKVector4Make(1, 1, 1, 1);
        
        // No texture
        _texture = nil;
        
        // Center on the origin
        _position = GLKVector3Make(0, 0, 0);
        
        // Don't rotate
        _rotation = GLKVector4Make(0, 0, 1, 0);
        
        // Scale to original size
        _scale = GLKVector3Make(1, 1, 1);
        
        // No children by default
        //_children = [[NSMutableArray alloc] init];
        
        // No animations by default
        //_animations = [[NSMutableArray alloc] init];
    }
    return self;
}

- (GLKMatrix4)modelviewMatrix
{
    GLKMatrix4 modelviewMatrix = GLKMatrix4Multiply(
        GLKMatrix4MakeTranslation(_position.x, _position.y, _position.z),
        GLKMatrix4MakeRotation(_rotation.w, _rotation.x, _rotation.y, _rotation.z));
    modelviewMatrix = GLKMatrix4Multiply(modelviewMatrix, GLKMatrix4MakeScale(_scale.x, _scale.y, _scale.z));
    
    return modelviewMatrix;
}

- (void)renderInCanvas:(GLView *)canvas
{
    // Set up our rendering effect
    GLKBaseEffect *effect = [[GLKBaseEffect alloc] init];
    
    // Set up the constant color effect if set
    if (_useConstantColor) {
        effect.useConstantColor = YES;
        effect.constantColor = self.color;
    }
    
    // Set up our texture effect if set
    if (self.texture != nil) {
        effect.texture2d0.envMode = GLKTextureEnvModeReplace;
        effect.texture2d0.target = GLKTextureTarget2D;
//        if (self.spriteAnimation != nil)
//            effect.texture2d0.name = [self.spriteAnimation currentFrame].name;
//        else
//            effect.texture2d0.name = self.texture.name;
    }
    
    // Create a modelview matrix to position and rotate the object
    effect.transform.modelviewMatrix = self.modelviewMatrix;
    
    // Set up the projection matrix to fit the canvas's boundaries
    effect.transform.projectionMatrix = canvas.projectionMatrix;
    
    // Tell OpenGL that we're going to use this effect for our upcoming drawing
    [effect prepareToDraw];
    
    // Enable transparency
//    glEnable(GL_BLEND);
//    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
//    
//    // Tell OpenGL that we'll be using vertex position data
//    glEnableVertexAttribArray(GLKVertexAttribPosition);
//    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.vertices);
//    
//    // If we're using vertex coloring, tell OpenGL that we'll be using vertex color data
//    if (!useConstantColor) {
//        glEnableVertexAttribArray(GLKVertexAttribColor);
//        glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, 0, self.vertexColors);
//    }
//    
//    // If we have a texture, tell OpenGL that we'll be using texture coordinate data
//    
//    if (texture != nil) {
//        glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
//        glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 0, self.textureCoordinates);
//    }
//    
//    // Draw our primitives!
//    glDrawArrays(GL_TRIANGLE_FAN, 0, self.numVertices);
//    
//    // Cleanup: Done with position data
//    glDisableVertexAttribArray(GLKVertexAttribPosition);
//    
//    // Cleanup: Done with color data (only if we used it)
//    if (!useConstantColor)
//        glDisableVertexAttribArray(GLKVertexAttribColor);
//    
//    // Cleanup: Done with texture data (only if we used it)
//    if (self.texture != nil)
//        glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
//    
//    // Cleanup: Done with the current blend function
//    glDisable(GL_BLEND);
//    
//    // Draw our children
//    [children makeObjectsPerformSelector:@selector(renderInCanvas:) withObject:canvas];
    
    
    
    //GLStrokeCircle(CGPointMake(0, 0), 1, 80);
}

//+ (Shape *)axisXYZ
//{
//    Shape *axis = [[Shape alloc] init];
//    axis.color = GLKVector4Make(1, 0, 0, 0.0);
//    axis.useConstantColor = true;
//    GLStrokeLine(CGPointMake(-100, 0), CGPointMake(100, 0));
//    GLStrokeLine(CGPointMake(0, -100), CGPointMake(0, 100));
//    
//    return axis;
//}

- (void)drawSamples
{
    // 1 draw the CS origin
    //GLStrokeCircle(CGPointMake(0, 0), 5, 80);
//    GLStrokeLine(CGPointMake(-2, 0), CGPointMake(2, 0));
//    GLStrokeLine(CGPointMake(0, -2), CGPointMake(0, 2));
    
    // 2 TRIANGLES
    //self.strokeColor = GLKVector4Make(0, 1, 0, 0.0);;
    
    //    float vertices[] = {
    //        -100, -200,
    //        100, -200,
    //        0,  0};
    //    glEnableVertexAttribArray(GLKVertexAttribPosition);
    //    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, vertices);
    //    glDrawArrays(GL_TRIANGLES, 0, 3);
    //    glDisableVertexAttribArray(GLKVertexAttribPosition);
    
    // 3
    //GLFillCircle(CGPointMake(0, 0), 30, 80);
    //
    //    // change color
    //    //_effect.constantColor = GLKVector4Make(0, 0, 1, 0.0);;
    //    //[_effect prepareToDraw];
    //
    //GLStrokeRect(CGRectMake(0, 0, 1, 1));
    //    GLStrokeCircle(CGPointMake(0, 0), 300, 80);
    //
    //    // 4 line width
    //    glLineWidth(20);
    //    GLStrokeLine(CGPointMake(-300, -300), CGPointMake(300, 300));
    //    glLineWidth(3);
    //
    //    // change color
    //    //_effect.constantColor = GLKVector4Make(0, 1, 0, 0.0);
    //    //[_effect prepareToDraw];
    //    
    //    GLFillRect(CGRectMake(-100, -100, 200, 200));
}

@end
