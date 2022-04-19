//
//  Calculator.m
//  huangiphone_1.1.0
//
//  Created by huangguangxi on 2022/3/29.
//

#import "Calculator.h"

@implementation Calculator

@synthesize operand1,operand2,accumulator;

-(id) init
{
    self = [super init];
    
    if (self)
    {
        operand1 = [[Fraction alloc]init];
        operand2 = [[Fraction alloc]init];
        accumulator = [[Fraction alloc]init];
    }
    return self;
}
-(void) clear
{
    accumulator.numerator = 0;
    accumulator.denominator = 0;
}
-(Fraction *)perfromOperation:(char)op
{
    Fraction *result;
    
    switch (op)
    {
        case '+':
            result = [operand1 add:operand2];
            break;
        case '-':
            result = [operand1 subtract:operand2];
            break;
        case '*':
            result = [operand1 multiply:operand2];
            break;
        case '/':
            result = [operand1 divide:operand2];
            break;
    }
    accumulator.numerator = result.numerator;
    accumulator.denominator = result.denominator;
    
    return accumulator;
}
@end
