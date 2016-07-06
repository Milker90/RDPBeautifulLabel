//
//  ViewController.m
//  RDPBeautifulLabel
//
//  Created by Allan Liu on 16/7/6.
//  Copyright © 2016年 GO. All rights reserved.
//

#import "ViewController.h"
#import "RDPBeautifulLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RDPBeautifulLabel *label = [RDPBeautifulLabel new];
    label.frame = CGRectMake(100, 100, 80, 18);
    label.backgroundColor = [UIColor redColor];
    label.textColor = [UIColor whiteColor];
    label.text = @"中国人";
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
