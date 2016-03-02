//
//  GL2DHelper.h
//  GL3D
//
//  Created by Bill Wu on 15/11/26.
//  Copyright © 2015 Autodesk. All rights reserved.
//

#import <GLKit/GLKit.h>

#define ELLIPSE_RESOLUTION 64

#define GLCOLOR_BLACK   GLKVector4Make(0, 0, 0, 0.0)
#define GLCOLOR_RED     GLKVector4Make(1, 0, 0, 0.0)
#define GLCOLOR_GREEN   GLKVector4Make(0, 1, 0, 0.0)
#define GLCOLOR_BLUE    GLKVector4Make(0, 0, 1, 0.0)
#define GLCOLOR_YELLOW  GLKVector4Make(1, 1, 0, 0.0)
#define GLCOLOR_MAGENTA GLKVector4Make(1, 0, 1, 0.0)
#define GLCOLOR_CYAN    GLKVector4Make(0, 1, 1, 0.0)
#define GLCOLOR_DARKGRAY  GLKVector4Make(0.25, 0.25, 0.25, 0.0)
#define GLCOLOR_LIGHTGRAY GLKVector4Make(0.75, 0.75, 0.75, 0.0)
#define GLCOLOR_BROWN   GLKVector4Make(0.60, 0.40, 0.12, 0.0)
#define GLCOLOR_ORANGE  GLKVector4Make(0.98, 0.625, 0.12, 0.0)
#define GLCOLOR_PINK    GLKVector4Make(0.98, 0.04, 0.70, 0.0)
#define GLCOLOR_PURPLE  GLKVector4Make(0.60, 0.40, 0.70, 0.0)
#define GLCOLOR_WHITE   GLKVector4Make(1, 1, 1, 0.0)


typedef GLKVector3 GLPoint3;

GLK_INLINE GLPoint3 GLPoint3Make(float x, float y, float z)
{
    GLKVector3 v = { x, y, z };
    return v;
}


GLK_INLINE void GLStrokeLine(GLPoint3 a, GLPoint3 b)
{
    const GLfloat lineVertices[] = {
        a.x, a.y, a.z,
        b.x, b.y, b.z
    };
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 0, lineVertices);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 2);
    glDisableVertexAttribArray(GLKVertexAttribPosition);
}

GLK_INLINE void GLFillRect(CGRect rect)
{
    const GLfloat quadVertices[] = {
        CGRectGetMinX(rect), CGRectGetMinY(rect),
        CGRectGetMaxX(rect), CGRectGetMinY(rect),
        CGRectGetMinX(rect), CGRectGetMaxY(rect),
        CGRectGetMaxX(rect), CGRectGetMaxY(rect)
    };
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, quadVertices);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    glDisableVertexAttribArray(GLKVertexAttribPosition);
}

GLK_INLINE void GLStrokeRect(CGRect rect)
{
    const GLfloat vertices[] = {
        CGRectGetMinX(rect), CGRectGetMinY(rect),
        CGRectGetMinX(rect), CGRectGetMaxY(rect),
        CGRectGetMaxX(rect), CGRectGetMaxY(rect),
        CGRectGetMaxX(rect), CGRectGetMinY(rect)
    };
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, vertices);
    glDrawArrays(GL_LINE_LOOP, 0, 4);
    glDisableVertexAttribArray(GLKVertexAttribPosition);
}

GLK_INLINE void GLFillCircle(GLPoint3 center, float radius)
{
    GLfloat *vertices = calloc(sizeof(GLfloat), (ELLIPSE_RESOLUTION + 1) * 4);
    float   step = M_PI * 2 / ELLIPSE_RESOLUTION;
    
    for (int i=0; i <= ELLIPSE_RESOLUTION; i++) {
        float angle = i*step;
        vertices[i*4] = center.x + cos(angle)*radius;
        vertices[i*4+1] = center.y + sin(angle)*radius;
        vertices[i*4+2] = center.x;
        vertices[i*4+3] = center.y;
    }
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, vertices);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, (ELLIPSE_RESOLUTION + 1)*2);
    glDisableVertexAttribArray(GLKVertexAttribPosition);
    
    free(vertices);
}

GLK_INLINE void GLStrokeCircle(GLPoint3 center, float radius)
{
    GLfloat *vertices = calloc(sizeof(GLfloat), (ELLIPSE_RESOLUTION + 1) * 2);
    float   step = M_PI * 2 / ELLIPSE_RESOLUTION;
    
    for (int i=0; i <= ELLIPSE_RESOLUTION; i++) {
        float angle = i*step;
        vertices[i*2] = center.x + cos(angle)*radius;
        vertices[i*2+1] = center.y + sin(angle)*radius;
        //vertices[i*2+2] = center.z;
    }
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, vertices);
    glDrawArrays(GL_LINE_LOOP, 0, (ELLIPSE_RESOLUTION + 1));
    glDisableVertexAttribArray(GLKVertexAttribPosition);
    
    free(vertices);
}




