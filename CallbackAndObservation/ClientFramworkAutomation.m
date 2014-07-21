//
//  ClientFramworkAutomation.m
//  CallbackAndObservation
//
//  Created by abhijeet on 14/07/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "ClientFramworkAutomation.h"

#import "NSTimer+Blocks.h"
#import "ViewController.h"


@implementation ClientFramworkAutomation
@synthesize dataModelFirst,dataModelSecond,delegate;


+(id)sharedManager {
    
    static ClientFramworkAutomation *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        
        dataModelFirst = [[ServiceDatamodel alloc]init];
        
        //Just an example for Key Value Coading. Assigning initial value.
        [dataModelFirst setValue:[NSNumber numberWithDouble:1.0] forKeyPath:@"fetchedValue"];
        dataModelSecond = [[ServiceDatamodel alloc]init];
        
         //Fetching initial value for example.
         NSString *initialNumber = [dataModelFirst valueForKey:@"fetchedValue"];
         NSLog(@"initial value = %@", initialNumber);
    }
    return self;
}

-(void)startAutomation{

    // This can be represented as a service which is hitting a server every 2 second and getting some data to show to custom view.
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(findData)
                                   userInfo:nil
                                    repeats:YES];
}
-(void)runLoopWithBlock:(CallBackBlock)serviceCallback{
    
   [NSTimer scheduledTimerWithTimeInterval:2.0 block:^
    {
        dataModelSecond.fetchedValue = (double)rand();
        serviceCallback(dataModelSecond.fetchedValue);
        
    } repeats:YES];
}
-(void)findData{

    dataModelFirst.fetchedValue = (double)rand();
    [[self delegate] getData:dataModelFirst.fetchedValue];
}

    
@end
