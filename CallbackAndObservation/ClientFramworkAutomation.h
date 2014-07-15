//
//  ClientFramworkAutomation.h
//  CallbackAndObservation
//
//  Created by abhijeet on 14/07/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceDatamodel.h"

typedef void (^CallBackBlock)(double);

@protocol GetDataDelegate <NSObject>

@required

-(void)getData:(double)fetchedData;

@end

@interface ClientFramworkAutomation : NSObject
{

}
@property(nonatomic,weak)id<GetDataDelegate>delegate;
@property(nonatomic,strong)ServiceDatamodel *dataModelFirst,*dataModelSecond;

+ (id)sharedManager;
-(void)startAutomation;

-(void)runLoopWithBlock:(CallBackBlock)serviceCallback;
@end
