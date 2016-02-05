//
//  NSDecimalNumberDataType.m
//  Objective C Data Types
//
//  Created by Karlo Pagtakhan on 02/01/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "NSDecimalNumberDataType.h"

@implementation NSDecimalNumberDataType

-(void) NSDecimalNumberUsage{
    NSDecimalNumber *price;
    price = [NSDecimalNumber decimalNumberWithMantissa:1599
                                              exponent:-2
                                            isNegative:NO];
    price = [NSDecimalNumber decimalNumberWithString:@"15.99"];
    
    //Arithmetic
    NSDecimalNumber *price1 = [NSDecimalNumber decimalNumberWithString:@"15.99"];
    NSDecimalNumber *price2 = [NSDecimalNumber decimalNumberWithString:@"29.99"];
    NSDecimalNumber *coupon = [NSDecimalNumber decimalNumberWithString:@"5.00"];
    NSDecimalNumber *discount = [NSDecimalNumber decimalNumberWithString:@".90"];
    NSDecimalNumber *numProducts = [NSDecimalNumber decimalNumberWithString:@"2.0"];
    
    //Add
    NSDecimalNumber *subtotal = [price1 decimalNumberByAdding:price2];
    
    //Subtract
    NSDecimalNumber *afterCoupon = [subtotal decimalNumberBySubtracting:coupon];
    
    //Mutiple
    NSDecimalNumber *afterDiscount = [afterCoupon decimalNumberByMultiplyingBy:discount];
    
    //Divide
    NSDecimalNumber *average = [afterDiscount decimalNumberByDividingBy:numProducts];
    
    //Power
    NSDecimalNumber *averageSquared = [average decimalNumberByRaisingToPower:2];
    
    
    NSLog(@"Subtotal: %@", subtotal);                    // 45.98
    NSLog(@"After coupon: %@", afterCoupon);           // 40.98
    NSLog((@"After discount: %@"), afterDiscount);       // 36.882
    NSLog(@"Average price per product: %@", average);    // 18.441
    NSLog(@"Average price squared: %@", averageSquared); // 340.070481
    
    
    //Rounding Behavior
    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                       decimalNumberHandlerWithRoundingMode:NSRoundUp
                                       scale:2
                                       raiseOnExactness:NO
                                       raiseOnOverflow:NO
                                       raiseOnUnderflow:NO
                                       raiseOnDivideByZero:YES];
    
    NSDecimalNumber *subtotal2 = [NSDecimalNumber decimalNumberWithString:@"40.98"];
    NSDecimalNumber *discount2 = [NSDecimalNumber decimalNumberWithString:@".90"];
    
    NSDecimalNumber *total2 = [subtotal2 decimalNumberByMultiplyingBy:discount2
                                                       withBehavior:roundUp];
    NSLog(@"Rounded total: %@", total2);
    
    //Comparing
    NSDecimalNumber *discountA = [NSDecimalNumber decimalNumberWithString:@".85"];
    NSDecimalNumber *discountB = [NSDecimalNumber decimalNumberWithString:@".9"];
    NSComparisonResult result = [discountA compare:discountB];
    if (result == NSOrderedAscending) {
        NSLog(@"85%% < 90%%");
    } else if (result == NSOrderedSame) {
        NSLog(@"85%% == 90%%");
    } else if (result == NSOrderedDescending) {
        NSLog(@"85%% > 90%%");
    }
    
}

//Mark: NSDecimalUsage
-(void) NSDecimalUsage{
    NSDecimalNumber *price = [NSDecimalNumber decimalNumberWithString:@"15.99"];
    NSDecimal asStruct = [price decimalValue];
    NSDecimalNumber *asNewObject = [NSDecimalNumber decimalNumberWithDecimal:asStruct];
    
    //Arithmetic
    NSDecimal price1 = [[NSDecimalNumber decimalNumberWithString:@"15.99"] decimalValue];
    NSDecimal price2 = [[NSDecimalNumber decimalNumberWithString:@"29.99"] decimalValue];
    NSDecimal coupon = [[NSDecimalNumber decimalNumberWithString:@"5.00"] decimalValue];
    NSDecimal discount = [[NSDecimalNumber decimalNumberWithString:@".90"] decimalValue];
    NSDecimal numProducts = [[NSDecimalNumber decimalNumberWithString:@"2.0"] decimalValue];
    NSLocale *locale = [NSLocale currentLocale];
    NSDecimal result;
    
    //Add
    NSDecimalAdd(&result, &price1, &price2, NSRoundUp);
    NSLog(@"Subtotal: %@", NSDecimalString(&result, locale));
    
    //Subtract
    NSDecimalSubtract(&result, &result, &coupon, NSRoundUp);
    NSLog(@"After coupon: %@", NSDecimalString(&result, locale));
    
    //Multiple
    NSDecimalMultiply(&result, &result, &discount, NSRoundUp);
    NSLog(@"After discount: %@", NSDecimalString(&result, locale));
    
    //Division
    NSDecimalDivide(&result, &result, &numProducts, NSRoundUp);
    NSLog(@"Average price per product: %@", NSDecimalString(&result, locale));
    
    //Power
    NSDecimalPower(&result, &result, 2, NSRoundUp);
    NSLog(@"Average price squared: %@", NSDecimalString(&result, locale));
    
    //Comparing
    NSDecimal discount1 = [[NSDecimalNumber decimalNumberWithString:@".85"] decimalValue];
    NSDecimal discount2 = [[NSDecimalNumber decimalNumberWithString:@".9"] decimalValue];
    NSComparisonResult resultA = NSDecimalCompare(&discount1, &discount2);
    if (resultA == NSOrderedAscending) {
        NSLog(@"85%% < 90%%");
    } else if (resultA == NSOrderedSame) {
        NSLog(@"85%% == 90%%");
    } else if (resultA == NSOrderedDescending) {
        NSLog(@"85%% > 90%%");
    }
}

//Mark: Error Checking
-(void) errorChecking{
    NSDecimal a = [[NSDecimalNumber decimalNumberWithString:@"1.0"] decimalValue];
    NSDecimal b = [[NSDecimalNumber decimalNumberWithString:@"0.0"] decimalValue];
    NSDecimal result;
    NSCalculationError success = NSDecimalDivide(&result, &a, &b, NSRoundPlain);
    switch (success) {
        case NSCalculationNoError:
            NSLog(@"Operation successful");
            break;
        case NSCalculationLossOfPrecision:
            NSLog(@"Error: Operation resulted in loss of precision");
            break;
        case NSCalculationUnderflow:
            NSLog(@"Error: Operation resulted in underflow");
            break;
        case NSCalculationOverflow:
            NSLog(@"Error: Operation resulted in overflow");
            break;
        case NSCalculationDivideByZero:
            NSLog(@"Error: Tried to divide by zero");
            break;
        default:
            break;
    }
}

@end
