//
//  Line.h
//  GL3D
//
//  Created by Bill Wu on 15/11/26.
//  Copyright © 2015 Autodesk. All rights reserved.
//

#import "Shape.h"

@interface Line : Shape

@property (nonatomic, assign) GLPoint3 startPoint;
@property (nonatomic, assign) GLPoint3 endPoint;

- (id) initWith:(GLPoint3)start end:(GLPoint3)end;

@end
