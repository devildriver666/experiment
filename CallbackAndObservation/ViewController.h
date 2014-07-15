//
//  ViewController.h
//  CallbackAndObservation
//
//  Created by abhijeet on 14/07/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClientFramworkAutomation.h"

@interface ViewController : UIViewController<GetDataDelegate>{

    
}
//-(void)callService;
@property (weak, nonatomic) IBOutlet UILabel *blockValueLevel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@end
