//
//  ViewController.h
//  huangiphone_1.1.0
//
//  Created by huangguangxi on 2022/3/29.
//
#import <UIKit/UIKit.h>

@interface FCViewController : UIViewController

@property (strong,nonatomic) IBOutlet UILabel *display;

-(void) processDigit:(int)digit;
-(void) processOp:(char)theop;
-(void) storeFracPart;

//数字键

- (IBAction)onClick:(UIButton *)sender;

//算术操作符

-(IBAction)clickPlus;
-(IBAction)clickMinus;
-(IBAction)clickMultiply;
-(IBAction)clickDivide;

//Misc键

-(IBAction)clickOver;
-(IBAction)clickEquals;
-(IBAction)clickClear;

@end

