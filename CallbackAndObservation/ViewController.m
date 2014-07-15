//
//  ViewController.m
//  CallbackAndObservation
//
//  Created by abhijeet on 14/07/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "ViewController.h"
#import "ClientFramworkAutomation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[ClientFramworkAutomation sharedManager] startAutomation];
    
    //delegate call back
    ((ClientFramworkAutomation*)[ClientFramworkAutomation sharedManager]).delegate = self;
    
    //Block Call back
    
    [[ClientFramworkAutomation sharedManager] runLoopWithBlock:^(double value){
    
        _blockValueLevel.text = [NSString stringWithFormat:@"%f",value ];
    }];
        
	// Do any additional setup after loading the view, typically from a nib.
}

//delegate call back
-(void)getData:(double)fetchedData{
    
    _valueLabel.text = [NSString stringWithFormat:@"%f",fetchedData ];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
