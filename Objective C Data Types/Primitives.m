//
//  Primitives.m
//  Objective C Data Types
//
//  Created by Karlo Pagtakhan on 02/01/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "Primitives.h"

@implementation Primitives
-(void) objectInit{
    //Objects
    NSNumber *twentySeven = [[NSNumber alloc] init];
    twentySeven = @27;
    
    //allocates NSNumber and autoreleases it
    NSNumber *twentySeven2 = [NSNumber  numberWithInt:27];
    
    //Comparing pointers
    if (twentySeven == twentySeven2){
        NSLog(@"Pointers are the same");
    }
    //Comparing values
    if ([twentySeven isEqualToValue:twentySeven2]){
        NSLog(@"Values are the same");
    }
}

//MARK: Primitives
-(void) primitiveDataType{
    
    
    //******************************************
    // Integer Types
    //******************************************
    BOOL isBool = YES;
    NSLog(@"%d", isBool);
    NSLog(@"%@", isBool ? @"YES" : @"NO");
    
    char aChar = 'a';
    unsigned char anUnsignedChar = 255;
    NSLog(@"The letter %c is ASCII number %hhd", aChar, aChar);
    NSLog(@"%hhu", anUnsignedChar);
    
    short aShort = -32768;
    unsigned short anUnsignedShort = 65535;
    NSLog(@"%hd", aShort);
    NSLog(@"%hu", anUnsignedShort);
    
    int anInt = -2147483648;
    unsigned int anUnsignedInt = 4294967295;
    NSLog(@"%d", anInt);
    NSLog(@"%u", anUnsignedInt);
    
    long aLong = -9223372036854775808;
    unsigned long anUnsignedLong = 18446744073709551615;
    NSLog(@"%ld", aLong);
    NSLog(@"%lu", anUnsignedLong);
    
    long long aLongLong = -9223372036854775808;
    unsigned long long anUnsignedLongLong = 18446744073709551615;
    NSLog(@"%lld", aLongLong);
    NSLog(@"%llu", anUnsignedLongLong);
    
    // Exact integer types
    int8_t aOneByteInt = 127;
    uint8_t aOneByteUnsignedInt = 255;
    int16_t aTwoByteInt = 32767;
    uint16_t aTwoByteUnsignedInt = 65535;
    int32_t aFourByteInt = 2147483647;
    uint32_t aFourByteUnsignedInt = 4294967295;
    int64_t anEightByteInt = 9223372036854775807;
    uint64_t anEightByteUnsignedInt = 18446744073709551615;
    
    // Minimum integer types
    int_least8_t aTinyInt = 127;
    uint_least8_t aTinyUnsignedInt = 255;
    int_least16_t aMediumInt = 32767;
    uint_least16_t aMediumUnsignedInt = 65535;
    int_least32_t aNormalInt = 2147483647;
    uint_least32_t aNormalUnsignedInt = 4294967295;
    int_least64_t aBigInt = 9223372036854775807;
    uint_least64_t aBigUnsignedInt = 18446744073709551615;
    
    // The largest supported integer type
    intmax_t theBiggestInt = 9223372036854775807;
    uintmax_t theBiggestUnsignedInt = 18446744073709551615;
    
    
    //******************************************
    // Floating-Point Types
    //******************************************
    // Single precision floating-point
    float aFloat = -21.09f;
    NSLog(@"%f", aFloat);
    NSLog(@"%8.2f", aFloat);
    
    // Double precision floating-point
    double aDouble = -21.09;
    NSLog(@"%8.2f", aDouble);
    NSLog(@"%e", aDouble);
    
    // Extended precision floating-point
    long double aLongDouble = -21.09e8L;
    NSLog(@"%Lf", aLongDouble);
    NSLog(@"%Le", aLongDouble);
    
    
    //******************************************
    // Determining Type Sizes
    //******************************************
    NSLog(@"Size of char: %zu", sizeof(char));   // This will always be 1
    NSLog(@"Size of short: %zu", sizeof(short));
    NSLog(@"Size of int: %zu", sizeof(int));
    NSLog(@"Size of long: %zu", sizeof(long));
    NSLog(@"Size of long long: %zu", sizeof(long long));
    NSLog(@"Size of float: %zu", sizeof(float));
    NSLog(@"Size of double: %zu", sizeof(double));
    NSLog(@"Size of size_t: %zu", sizeof(size_t));
    
    
    //Limit macros
    NSLog(@"Smallest signed char: %d", SCHAR_MIN);
    NSLog(@"Largest signed char: %d", SCHAR_MAX);
    NSLog(@"Largest unsigned char: %u", UCHAR_MAX);
    
    NSLog(@"Smallest signed short: %d", SHRT_MIN);
    NSLog(@"Largest signed short: %d", SHRT_MAX);
    NSLog(@"Largest unsigned short: %u", USHRT_MAX);
    
    NSLog(@"Smallest signed int: %d", INT_MIN);
    NSLog(@"Largest signed int: %d", INT_MAX);
    NSLog(@"Largest unsigned int: %u", UINT_MAX);
    
    NSLog(@"Smallest signed long: %ld", LONG_MIN);
    NSLog(@"Largest signed long: %ld", LONG_MAX);
    NSLog(@"Largest unsigned long: %lu", ULONG_MAX);
    
    NSLog(@"Smallest signed long long: %lld", LLONG_MIN);
    NSLog(@"Largest signed long long: %lld", LLONG_MAX);
    NSLog(@"Largest unsigned long long: %llu", ULLONG_MAX);
    
    NSLog(@"Smallest float: %e", FLT_MIN);
    NSLog(@"Largest float: %e", FLT_MAX);
    NSLog(@"Smallest double: %e", DBL_MIN);
    NSLog(@"Largest double: %e", DBL_MAX);
    
    NSLog(@"Largest possible array index: %llu", SIZE_MAX);
}

//MARK: Integer division
-(void) intergerDivision{
    int integerResult = 5/4;
    NSLog(@"Integer division %d", integerResult );
    float integerResultFloat = 5.0 /4;
    NSLog(@"Integer division %1.3f", integerResultFloat );
    
    //Floating-Point Equality
    NSLog(@"%.17f", .1);        // 0.10000000000000001
    
    //That extra 1 in the 17th digit occurs because converting 1/10 to binary results in a repeating decimal
    
    
    NSLog(@"%.17f", 4.2 - 4.1); // 0.10000000000000053
    if (4.2 - 4.1 == .1) {
        NSLog(@"This math is perfect!");
    } else {
        // You'll see this message
        NSLog(@"This math is just a tiny bit off...");
    }
}

-(void) objCPrimitives{
    id mysteryObject = @"An NSString object";
    NSLog(@"%@", [mysteryObject description]);
    mysteryObject = @{@"model": @"Ford", @"year": @1967};
    NSLog(@"%@", [mysteryObject description]);
    
    Class targetClass = [NSString class];
    id mysteryObject2 = @"An NSString object";
    if ([mysteryObject2 isKindOfClass:targetClass]) {
        NSLog(@"Yup! That's an instance of the target class");
    }
    
    SEL someMethod = @selector(sayHello);
}

//Mark: NSInteger and NSUInteger
-(void) signedUnsignedIntegers{
    /* A sensible convention is to use NSInteger and NSUInteger when interacting with Apple’s APIs and use the standard C types for everything else.
     */
}

@end
