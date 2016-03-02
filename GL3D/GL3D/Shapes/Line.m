//
//  Line.m
//  GL3D
//
//  Created by Bill Wu on 15/11/26.
//  Copyright © 2015 Autodesk. All rights reserved.
//

#import "Line.h"

@implementation Line

- (id) initWith:(GLPoint3)start end:(GLPoint3)end
{
    if (self = [super init])
    {
        self.startPoint = start;
        self.endPoint = end;
    }
    return self;
}

- (void)renderInCanvas:(GLView *)canvas
{
    [super renderInCanvas:canvas];
    
    GLStrokeLine(self.startPoint, self.endPoint);
    GLFillCircle(self.endPoint, 0.2);
}

@end
