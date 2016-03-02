//
//  Ellipse.h
//  GL3D
//
//  Created by Bill Wu on 15/11/26.
//  Copyright © 2015 Autodesk. All rights reserved.
//

#import "Shape.h"

@interface Ellipse : Shape

@property (nonatomic, assign) GLPoint3 center;
@property CGFloat radiusX, radiusY;

- (id) initWith:(GLPoint3)centerPoint radiusX:(CGFloat)radiusX radiusY:(CGFloat)radiusY;

@end
