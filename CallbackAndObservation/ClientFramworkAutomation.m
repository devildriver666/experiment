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
//@synthesize dataModelFirst,dataModelSecond,delegate; (no point synthesizing properties now, complier directly does that for you and any property can be used by "self.property" or in form of iVar just by putting an underscore  "_" prefix as _property)


//Creating singleton, one of the most popular way. dispatch_once will be called only once.
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
        
        self.dataModelFirst = [[ServiceDatamodel alloc]init];
        
        //Just an example for Key Value Coading. Assigning initial value.
        [self.dataModelFirst setValue:[NSNumber numberWithDouble:1.0] forKeyPath:@"fetchedValue"];
        self.dataModelSecond = [[ServiceDatamodel alloc]init];
        
         //Fetching initial value just for example.
         NSString *initialNumber = [self.dataModelFirst valueForKey:@"fetchedValue"];
         NSLog(@"initial value = %@", initialNumber);
    }
    return self;
}


//Creating a heart beat type scenario. Auusme a service which is fetchign some data at regular 2 sec interval from server.
//Imagine a server where you have to hit and get data every 2 sec.

-(void)startAutomation{

    // This can be represented as a service which is hitting a server every 2 second and getting some data to show to custom view.
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(findData)
                                   userInfo:nil
                                    repeats:YES];
}

//Call back with Block , use of NSTimer + Block Category to use NSTimer block call back.
-(void)runLoopWithBlock:(CallBackBlock)serviceCallback{
    
   [NSTimer scheduledTimerWithTimeInterval:2.0 block:^
    {
        self.dataModelSecond.fetchedValue = (double)rand();
        serviceCallback(self.dataModelSecond.fetchedValue);
        
    } repeats:YES];
}

//Call back with delegate.
-(void)findData{

    self.dataModelFirst.fetchedValue = (double)rand();
    [[self delegate] getData:self.dataModelFirst.fetchedValue];
}

    
@end
