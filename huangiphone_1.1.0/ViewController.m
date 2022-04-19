//
//  ViewController.m
//  huangiphone_1.1.0
//
//  Created by huangguangxi on 2022/3/29.
//

#import "ViewController.h"
#import "Calculator.h"

@implementation FCViewController
{
    char op;
    int currentNumber;
    BOOL firstOperand,isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;

}

@synthesize display;

-(void) viewDidLoad{
    
    //覆盖应用程序载入的自定义方法
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc] init];
}
-(void) processDigit:(int)digit
{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:
     [NSString stringWithFormat:@"%i",digit]];
    display.text = displayString;
}
- (IBAction)clickDigit:(id)sender {
}

-(void) processOp:(char)theOp
{
    NSString *opStr;
    op = theOp;
    switch (theOp)
    {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" % ";
            break;
    }
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    [displayString appendString:opStr];
    display.text = displayString;
}
-(void) storeFracPart
{
    if (firstOperand)
    {
        if(isNumerator)
        {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;//例如3 * 4 / 5 =
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }
    else if (isNumerator)
    {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;//例如3 / 2 * 4 =
    }
    else
    {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    currentNumber = 0;
}
-(IBAction) clickOver
{
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    display.text = displayString;
}
//算术操作键
-(IBAction) clickPlus
{
    [self processOp:'+'];
}
-(IBAction) clickMinus
{
    [self processOp:'-'];
}
-(IBAction)clickMultiply
{
    [self processOp:'*'];
}
-(IBAction) clickDivide
{
    [self processOp:'/'];
}
//masc键
-(IBAction)clickEquals
{
    if (firstOperand == NO)
    {
        [self storeFracPart];
        [myCalculator perfromOperation:op];
        
        [displayString appendString:@" = "];
        [displayString appendString:[myCalculator.accumulator
                                     convertToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString:@""];
    }
}
-(IBAction)clickClear
{
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    display.text = displayString;
}
- (IBAction)onClick:(UIButton *)sender {
    
    NSLog(@"点击了:%d", sender.tag);//在这里通过 sender.tag取到是哪个按钮
    int digit = sender.tag;
    [self processDigit:digit];
}
/*- (IBAction)one:(UIButton *)sender {
    NSLog(@"点击了：%d",sender.tag);
    int digit = sender.tag;
    [self processDigit:digit];
}*/
@end
