//
//  ViewController.h
//  GL3D
//
//  Created by Bill Wu on 15/11/26.
//  Copyright © 2015 Autodesk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "GLView.h"

@interface GLViewController : UIViewController //GLKViewController

@property (strong, nonatomic) IBOutlet GLView *glView;

@end

