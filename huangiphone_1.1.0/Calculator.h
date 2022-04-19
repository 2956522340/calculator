//
//  Header.h
//  huangiphone_1.1.0
//
//  Created by huangguangxi on 2022/3/29.
//
#import <UIKit/UIKit.h>
#import "Fraction.h"

@interface Calculator :NSObject

@property (strong,nonatomic) Fraction *operand1;
@property (strong,nonatomic) Fraction *operand2;
@property (strong,nonatomic) Fraction *accumulator;

-(Fraction *) perfromOperation:(char)op;
-(void)  clear;
@end
