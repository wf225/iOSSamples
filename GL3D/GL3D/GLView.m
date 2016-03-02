//
//  EAGLView.m
//  GL3D
//
//  Created by Bill Wu on 15/11/26.
//  Copyright © 2015 Autodesk. All rights reserved.
//

#import "GLView.h"
#import "GL2DUtils.h"
#import "Shape.h"
#import "Line.h"
#import "Ellipse.h"

@interface GLView ()
{    

}
@end

@implementation GLView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (void)setupGL
{
    // Set viewport: set the CS origin to the screen's center.
    CGFloat scaleFactor = 20;
    CGFloat fieldWidth = self.frame.size.width / scaleFactor;
    CGFloat fieldHeitht = self.frame.size.height / scaleFactor;
    CGPoint worldCsOriginOffset = CGPointMake(fieldWidth/2, fieldHeitht/2);
    
    _left   = - worldCsOriginOffset.x;
    _right  =  fieldWidth + _left;
    _bottom = - worldCsOriginOffset.y;
    _top    =  fieldHeitht + _bottom;
    
    //
    _shapes = [[NSMutableArray alloc] init];
    
    // Draw Samples:
//    Line *axisX = [[Line alloc] initWith:GLPoint3Make(-10, 0, 0) end:GLPoint3Make(10, 0, 0)];
//    axisX.color = GLCOLOR_PINK;
//    [_shapes addObject:axisX];
//    
//    Line *axisY = [[Line alloc] initWith:GLPoint3Make(0, -10, 0) end:GLPoint3Make(0, 10, 0)];
//    axisY.color = GLCOLOR_PURPLE;
//    //axisY.rotation = GLKVector4Make(0, 0, 1, 0.75);
//    [_shapes addObject:axisY];
    
    Ellipse *circle = [[Ellipse alloc] initWith:GLPoint3Make(0, 0, 0) radiusX:10 radiusY:10];
    circle.useConstantColor = true;
    circle.color = GLCOLOR_RED; // GLKVector4Make(0, 0, 1, 0.0);
    circle.position = GLKVector3Make(0, 0, 0);
    circle.scale = GLKVector3Make(1, 1, 1);
    //circle.rotation = GLKVector4Make(1, 0, 0, 1.75);
    [_shapes addObject:circle];
}

- (GLKMatrix4)projectionMatrix
{
    return GLKMatrix4MakeOrtho(_left, _right, _bottom, _top, 1, -1);
    //return GLKMatrix4MakeLookAt(0, 0, 100, 0, 0, 0, 10, 10, 10);
}

- (void)drawRect:(CGRect)rect
{
    [self render];
    
    [self.context presentRenderbuffer:GL_RENDERBUFFER];
}

- (void)render
{
    // 1 Clear the screen
    glClearColor(self.clearColor.r, self.clearColor.g, self.clearColor.b, self.clearColor.a);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    [_shapes makeObjectsPerformSelector:@selector(renderInCanvas:) withObject:self];
}





@end
