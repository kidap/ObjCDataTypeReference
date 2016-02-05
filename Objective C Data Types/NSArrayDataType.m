//
//  NSArrayDataType.m
//  Objective C Data Types
//
//  Created by Karlo Pagtakhan on 02/03/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "NSArrayDataType.h"

@implementation NSArrayDataType
-(void) initNSArrayUsage{
    //Creating Arrays
    NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche",
                             @"Opel", @"Volkswagen", @"Audi"];
    NSArray *ukMakes = [NSArray arrayWithObjects:@"Aston Martin",
                        @"Lotus", @"Jaguar", @"Bentley", nil];
    
    NSLog(@"%@",germanMakes[0]);
    NSLog(@"%@",[ukMakes objectAtIndex:1]);
    
    //Enumerating Arrays
    
    for (int x =0; x<germanMakes.count; x++){
    //    NSLog(@"German make #%d: %@", x+1, germanMakes[x]);
    }
    
    for (NSString *model in ukMakes){
    //    NSLog(@"UK make:%@",model);
    }
    
    [ukMakes enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"Enumerate using Blocks #%d - %@",idx, obj);
    }];
    

    //Comparing Arrays
    if ([germanMakes isEqualToArray:ukMakes]){
        NSLog(@"Comparison: array contents are the same");
    } else {
        NSLog(@"Comparison: array contents are NOT the same");
    }
    
    NSArray *newArray = [NSArray arrayWithArray:ukMakes];
    if ([newArray isEqualToArray:ukMakes]){
        NSLog(@"Comparison: array contents are the same");
    } else {
        NSLog(@"Comparison: array contents are NOT the same");
    }
    
    
    //Membership Checking
    if ([germanMakes indexOfObject:@"BMW"] == NSNotFound){
        NSLog(@"BMW is NOT an item in the array");
    } else {
        NSLog(@"BMW is an item in the array");
    }
    
    if ([germanMakes indexOfObject:@"Jaguar"] == NSNotFound){
        NSLog(@"Audi is NOT an item in the array");
    } else{
        NSLog(@"Jaguar is an item in the array");
    }
    
    //Sorting Arrays by length of array
    NSArray *sortedArray = [germanMakes sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if([obj1 length] == [obj2 length]){
            return NSOrderedSame;
        } else if ([obj1 length] < [obj2 length]){
            return NSOrderedAscending;
        } else {
            // ([obj1 length] > [obj2 length])
            return NSOrderedDescending;
        }
    }];
    
    NSLog(@"Sorted Array: %@", sortedArray);
    
    //Filtering Arrays
    NSPredicate *filter = [NSPredicate predicateWithBlock:^BOOL(id  evaluatedObject, NSDictionary *bindings) {
        NSComparisonResult result = [@"N" compare:evaluatedObject];
        if (result == NSOrderedAscending){
            return true;
        } else {
            return false;
        }
    }];
    
    NSArray *filteredArray = [germanMakes filteredArrayUsingPredicate:filter];
    NSLog(@"Filterd Array: %@", filteredArray);
    
    //Subdividing Arrays
    NSArray *lastTwo = [germanMakes subarrayWithRange:NSMakeRange([germanMakes count] - 2, 2)];
    NSLog(@"Subdiviede array: %@", lastTwo);
    
    //Combining Arrays
    NSArray *allMakes = [germanMakes arrayByAddingObjectsFromArray:ukMakes];
    
    
    //String Conversion
    
    NSLog(@"%@", [ukMakes componentsJoinedByString:@"-"]);
    
    
}
-(void) initNSMutableArrayUsage{
    //Creating Mutable Arrays
    NSMutableArray *groceryList = [NSMutableArray arrayWithObjects:@"milk", @"cereals", @"wine", nil];
    NSLog(@"%@", groceryList);
    
    //Adding and Removing Objects
    [groceryList addObject:@"rice"];
    NSLog(@"%@", groceryList);
    
    [groceryList removeObject:@"milk"];
    NSLog(@"%@", groceryList);
    
    
    [groceryList replaceObjectAtIndex:1 withObject:@"white wine"];
    NSLog(@"%@", groceryList);
    
    
    //Sorting With Descriptors
    
    NSDictionary *tony = @{ @"name":@"Tony",
                            @"pts":[NSDecimalNumber decimalNumberWithString:@"12.2"],
                            @"reb":[NSDecimalNumber decimalNumberWithString:@"2.6"],
                            @"ast":[NSDecimalNumber decimalNumberWithString:@"5.2"]};
    NSDictionary *kawhi = @{ @"name":@"Kawhi",
                            @"pts":[NSDecimalNumber decimalNumberWithString:@"19.9"],
                            @"reb":[NSDecimalNumber decimalNumberWithString:@"6.6"],
                            @"ast":[NSDecimalNumber decimalNumberWithString:@"2.5"]};
    NSDictionary *lma = @{ @"name":@"LaMarcus",
                            @"pts":[NSDecimalNumber decimalNumberWithString:@"16.6"],
                            @"reb":[NSDecimalNumber decimalNumberWithString:@"8.4"],
                            @"ast":[NSDecimalNumber decimalNumberWithString:@"1.3"]};
    
    NSMutableArray *spurs = [NSMutableArray arrayWithObjects: tony, kawhi, lma, nil];
    
    NSSortDescriptor *points = [NSSortDescriptor sortDescriptorWithKey:@"reb" ascending:NO selector:@selector(compare:)];
    
    NSArray *descriptors = @[points];
    
    [spurs sortUsingDescriptors:descriptors];
    
    NSLog(@"%@", spurs);
    
    
    //Filtering Mutable Arrays
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        if ([evaluatedObject containsString:@"wine"]){
            return  true;
        } else{
            return false;
        }
    }];
    
    NSMutableArray *filteredArray = [groceryList filteredArrayUsingPredicate:(predicate)];
    NSLog(@"%@", groceryList);
    NSLog(@"%@", filteredArray);
}
@end
