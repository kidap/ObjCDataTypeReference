//
//  NSNumber.m
//  Objective C Data Types
//
//  Created by Karlo Pagtakhan on 02/01/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "NSNumber.h"

@implementation NSNumberReference

-(void) initNSNumber{
    NSNumber *aBool = [NSNumber numberWithBool:NO];
    NSNumber *aChar = [NSNumber numberWithChar:'z'];
    NSNumber *aUChar = [NSNumber numberWithUnsignedChar:255];
    NSNumber *aShort = [NSNumber numberWithShort:32767];
    NSNumber *aUShort = [NSNumber numberWithUnsignedShort:65535];
    NSNumber *anInt = [NSNumber numberWithInt:2147483647];
    NSNumber *aUInt = [NSNumber numberWithUnsignedInt:4294967295];
    NSNumber *aLong = [NSNumber numberWithLong:9223372036854775807];
    NSNumber *aULong = [NSNumber numberWithUnsignedLong:18446744073709551615];
    NSNumber *aFloat = [NSNumber numberWithFloat:26.99f];
    NSNumber *aDouble = [NSNumber numberWithDouble:26.99];
    
    NSLog(@"%@", [aBool boolValue] ? @"YES" : @"NO");
    NSLog(@"%c", [aChar charValue]);
    NSLog(@"%hhu", [aUChar unsignedCharValue]);
    NSLog(@"%hi", [aShort shortValue]);
    NSLog(@"%hu", [aUShort unsignedShortValue]);
    NSLog(@"%i", [anInt intValue]);
    NSLog(@"%u", [aUInt unsignedIntValue]);
    NSLog(@"%li", [aLong longValue]);
    NSLog(@"%lu", [aULong unsignedLongValue]);
    NSLog(@"%f", [aFloat floatValue]);
    NSLog(@"%f", [aDouble doubleValue]);
    
    /* It may seem redundant to have an object-oriented version of all the C primitives, but it’s necessary if you want to store numeric values in an NSArray, NSDictionary, or any of the other Foundation Framework collections. These classes require all of their elements to be objects—they do not know how to interact with primitive values. In addition, NSNumber makes it possible to pass numbers to methods like performSelector:withObject:, as discussed in Selectors.
     */

    /* But, aside from the object-oriented interface, there are a few perks to using NSNumber. For one, it provides a straightforward way to convert between primitive data types or get an NSString representation of the value:
    */
    
    NSLog(@"This is an NSNumber but displayed with different formatting.");
    NSNumber *anInt2 = [NSNumber numberWithInt:42];
    float asFloat = [anInt2 floatValue];
    NSLog(@"%.2f", asFloat);
    NSString *asString = [anInt2 stringValue];
    NSLog(@"%@", asString);
    
    NSNumber *aUChar2 = [NSNumber numberWithUnsignedChar:255];
    NSNumber *anInt3 = [NSNumber numberWithInt:2147483647];
    NSNumber *aFloat2 = [NSNumber numberWithFloat:26.99f];
    NSLog(@"%@", aUChar2);
    NSLog(@"%@", anInt3);
    NSLog(@"%@", aFloat2);
}
-(void) numericLiterals{

    /*The NSNumber version of BOOL’s, char’s, int’s and double’s can all be created by simply prefixing the corresponding primitive type with the @ symbol; however, unsigned int’s, long’s, and float’s must be appended with the U, L, or F modifiers, as shown below.
     */
    
    NSNumber *aBool = @NO;
    NSNumber *aChar = @'z';
    NSNumber *anInt = @2147483647;
    NSNumber *aUInt = @4294967295U;
    NSNumber *aLong = @9223372036854775807L;
    NSNumber *aFloat = @26.99F;
    NSNumber *aDouble = @26.99;
 
    
    
    // @() syntax
    double x = 24.0;
    NSNumber *result = @(x * .15);
    NSLog(@"%.2f", [result doubleValue]);
}

-(void) immutability{
    NSNumber *counter = @0;
    for (int i=0; i<10; i++) {
        //counter = @([counter intValue] + 1);
        counter = @(i);
        NSLog(@"%@", counter);
    }
}

-(void) comparingNumbers{
    NSNumber *anInt = @27;
    NSNumber *sameInt = @27U;
    // Pointer comparison (fails)
    if (anInt == sameInt) {
        NSLog(@"Comparing pointers: They are the same object");
    }
    // Value comparison (succeeds)
    if ([anInt isEqualToNumber:sameInt]) {
        NSLog(@"Comparing values: They are the same value");
    }
    
    NSNumber *anInt2 = @27;
    NSNumber *anotherInt = @42;
    NSComparisonResult result = [anInt2 compare:anotherInt];
    if (result == NSOrderedAscending) {
        NSLog(@"NSOrderedAscending: 27 < 42");
    } else if (result == NSOrderedSame) {
        NSLog(@"NSOrderedSame:27 == 42");
    } else if (result == NSOrderedDescending) {
        NSLog(@"NSOrderedDescending: 27 > 42");
    }
}

@end
