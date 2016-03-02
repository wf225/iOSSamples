//
//  ViewController.h
//  CaptureVideo
//
//  Created by Bill Wu on 15/11/19.
//  Copyright © 2015年 Autodesk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <ImageIO/CGImageProperties.h>

@interface ViewController : UIViewController<AVCaptureVideoDataOutputSampleBufferDelegate>
{
    
}

@property (nonatomic, strong) AVCaptureStillImageOutput *stillImageOutput;
@property (nonatomic, strong) AVCaptureSession *session;

@property (nonatomic, strong) IBOutlet UIView *videoPreview;
@property (nonatomic, strong) IBOutlet UIImageView *videoImage;
- (IBAction)captureScreen:(id)sender;

@end

