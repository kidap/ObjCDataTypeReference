//
//  ViewController.m
//  Objective C Data Types
//
//  Created by Karlo Pagtakhan on 02/01/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "ViewController.h"
#import "Primitives.h"
#import "NSNumber.h"
#import "NSStringDataType.h"
#import "NSDictionaryDataType.h"
#import "NSArrayDataType.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArrayDataType *newInstance = [[NSArrayDataType alloc] init];
    
    //[newInstance initNSArrayUsage];
    [newInstance initNSMutableArrayUsage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
