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
    
    //set GetDataDelegate to self to receive callback.
    ((ClientFramworkAutomation*)[ClientFramworkAutomation sharedManager]).delegate = self;
    
    //Block Call back
    [[ClientFramworkAutomation sharedManager] runLoopWithBlock:^(double value){
    
        _blockValueLevel.text = [NSString stringWithFormat:@"%f",value ];
    }];
        
	
    //Add observer to see data change in first Service Datamodel object object.
    [((ClientFramworkAutomation*)[ClientFramworkAutomation sharedManager]).dataModelFirst addObserver:self forKeyPath:@"fetchedValue" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

//Observation call back
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"fetchedValue"])
    {
        NSLog(@"observed value = %@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
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
