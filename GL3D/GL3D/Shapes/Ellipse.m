//
//  Ellipse.m
//  GL3D
//
//  Created by Bill Wu on 15/11/26.
//  Copyright © 2015 Autodesk. All rights reserved.
//

#import "Ellipse.h"

@implementation Ellipse

- (id) initWith:(GLPoint3)centerPoint radiusX:(CGFloat)radiusX radiusY:(CGFloat)radiusY
{
    if (self = [super init])
    {
        self.center = centerPoint;
        self.radiusX = radiusX;
        self.radiusY = radiusY;
    }
    return self;
}

- (void)renderInCanvas:(GLView *)canvas
{
    [super renderInCanvas:canvas];
    
    GLStrokeCircle(self.center, self.radiusX);
    
    // Samples
    //[self drawTriCone];
    GLStrokeRect(CGRectMake(0, 0, 1, 1));
}

- (void)drawTriCone
{
    GLfloat vertices[] = {
        0.5f, 0.5f, 0.0f,
        0.5f, -0.5f, 0.0f,
        -0.5f, -0.5f, 0.0f,
        -0.5f, 0.5f, 0.0f,
        0.0f, 0.0f, -0.707f, };
    GLubyte indices[] = { 0, 1, 1, 2, 2, 3, 3, 0, 4, 0, 4, 1, 4, 2, 4, 3 };
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 0, vertices );
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    // Draw lines
    glDrawElements(GL_LINES, sizeof(indices)/sizeof(GLubyte), GL_UNSIGNED_BYTE, indices);
}

@end
