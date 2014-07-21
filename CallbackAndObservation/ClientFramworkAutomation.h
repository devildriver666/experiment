//
//  ClientFramworkAutomation.h
//  CallbackAndObservation
//
//  Created by abhijeet on 14/07/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceDatamodel.h"


// By doing typedef to block you can use block reference just by name "CallBackBlock"
typedef void (^CallBackBlock)(double);

//Creating a Protocol to handle call back through delegation.
@protocol GetDataDelegate <NSObject>

//Defines that this function is required.
@required

-(void)getData:(double)fetchedData;

@end

@interface ClientFramworkAutomation : NSObject
{

}

@property(nonatomic,weak)id<GetDataDelegate>delegate;
@property(nonatomic,strong)ServiceDatamodel *dataModelFirst,*dataModelSecond;

//Static function to create a singleton.
+ (id)sharedManager;


-(void)startAutomation;

//With typedef you can call block as simple as this.
-(void)runLoopWithBlock:(CallBackBlock)serviceCallback;

//With out typedef you need to call block this way which is not clear.
//- (void)runLoopWithBlock:(void (^)(double))serviceCallback;
@end
