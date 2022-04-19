//
//  Fraction.h
//  huangiphone_1.1.0
//
//  Created by huangguangxi on 2022/3/29.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Fraction: NSObject
@property int numerator,denominator;
-(void) print;
-(void) setTo:(int) n over:(int)d;
-(Fraction *) add:(Fraction *)f;
-(Fraction *) subtract:(Fraction *)f;
-(Fraction *) multiply:(Fraction *)f;
-(Fraction *) divide:(Fraction *)f;
-(void) reduce;
-(double) convertToNum;
-(NSString *) convertToString;

@end
