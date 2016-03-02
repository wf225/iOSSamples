//
//  ViewController.m
//  GL3D
//
//  Created by Bill Wu on 15/11/26.
//  Copyright © 2015 Autodesk. All rights reserved.
//

#import "GLViewController.h"

@interface GLViewController ()
{
    EAGLContext *_glContext;
}
@end

@implementation GLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGL];
}

- (void)setupGL
{
    _glContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:_glContext];
    _glView.context = _glContext;
    
    // Configure renderbuffers created by the view
    _glView.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
    _glView.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    _glView.drawableStencilFormat = GLKViewDrawableStencilFormat8;
    _glView.drawableMultisample = GLKViewDrawableMultisample4X;
    
    _glView.clearColor = GLKVector4Make(1.0, 1.0, 1.0, 0.0);
    [_glView setupGL];
    
}

- (void)tearDownGL
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
