//
//  ViewController.m
//  iOSGTestApp
//
//  Created by WuFeng on 16/3/17.
//  Copyright © 2016年 Alloysoft. All rights reserved.
//

#import "ViewController.h"
#include "Counter.h"
#import <XCTest/XCTest.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    
    Counter counter;
    counter.Increment();
    counter.GetCount();

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
