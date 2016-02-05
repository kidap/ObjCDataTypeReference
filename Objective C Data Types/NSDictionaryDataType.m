//
//  NSDictionaryDataType.m
//  Objective C Data Types
//
//  Created by Karlo Pagtakhan on 02/02/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "NSDictionaryDataType.h"

@implementation NSDictionaryDataType
-(void) initNSDictionaryUsage{
    // Literal syntax
    NSDictionary *inventory = @{
                                @"Mercedes-Benz SLK250": [NSNumber numberWithInt:13],
                                @"Mercedes-Benz E350": [NSNumber numberWithInt:22],
                                @"BMW M3 Coupe": [NSNumber numberWithInt:19],
                                @"BMW X6": [NSNumber numberWithInt:16]
                                };
    
    // Values and keys as arguments
    inventory = [NSDictionary dictionaryWithObjectsAndKeys:
                 [NSNumber numberWithInt:13], @"Mercedes-Benz SLK250",
                 [NSNumber numberWithInt:22], @"Mercedes-Benz E350",
                 [NSNumber numberWithInt:19], @"BMW M3 Coupe",
                 [NSNumber numberWithInt:16], @"BMW X6", nil];
    
    // Values and keys as arrays
    NSArray *models = @[@"Mercedes-Benz SLK250", @"Mercedes-Benz E350",
                        @"BMW M3 Coupe", @"BMW X6"];
    NSArray *stock = @[[NSNumber numberWithInt:13],
                       [NSNumber numberWithInt:22],
                       [NSNumber numberWithInt:19],
                       [NSNumber numberWithInt:16]];
    inventory = [NSDictionary dictionaryWithObjects:stock forKeys:models];
    NSLog(@"%@", inventory);
    
    NSLog(@"%@", inventory[@"Mercedes-Benz SLK250"]);
    
    NSLog(@"%@", [inventory objectForKey:@"BMW X6"]);
    
    NSArray *allKeys = [inventory allKeys];
    
    for (id key in allKeys){
        //NSLog(@"%@",key);
        NSLog(@"Model %@, Inventory:%@",key,[inventory objectForKey:key]);
    }
    
    //Get the keys based on a value
    NSLog(@"Showing out of stock");
    NSArray *outOfStock = [inventory allKeysForObject:
                           [NSNumber numberWithInt:16]];
    
    NSLog(@"%@",outOfStock);
    
    //MARK: Enumerating Dictionaries
    //Showing investory using for loop
    NSLog(@"Showing investory using for loop");
    for(id key in inventory){
        NSLog(@"%@-%@",inventory[key],key);
    }
    NSLog(@"Models: %@", [inventory allKeys]);
    NSLog(@"Stock: %@", [inventory allValues]);
    
    //Showing investory using enumerate
    NSLog(@"Showing investory using enumerate");
    [inventory enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@:::%@",key, obj);
    }];
    
    //MARK: Comparing Dictionaries
    NSDictionary *warehouseInventory = @{
                                         @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:13],
                                         @"Mercedes-Benz E350" : [NSNumber numberWithInt:22],
                                         @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
                                         @"BMW X6" : [NSNumber numberWithInt:16],
                                         };
    NSDictionary *showroomInventory = @{
                                        @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:13],
                                        @"Mercedes-Benz E350" : [NSNumber numberWithInt:22],
                                        @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
                                        @"BMW X6" : [NSNumber numberWithInt:16],
                                        };
    
    if ([warehouseInventory isEqualToDictionary:showroomInventory]) {
        NSLog(@"The DICTIONARIES ARE THE SAME");
    }
    
    //MARK: Sorting Dictionary Keys
    
    //NSArray *sortedKeys = [showroomInventory keysSortedByValueUsingComparator:^NSComparisonResult(id  obj1, id  obj2) {
    //    return [obj2 compare:obj1];
    //}];
    //NSLog(@"Sorted keys: %@",sortedKeys);
    NSDictionary *prices = @{
                             @"Mercedes-Benz SLK250" : [NSDecimalNumber decimalNumberWithString:@"42900.00"],
                             @"Mercedes-Benz E350" : [NSDecimalNumber decimalNumberWithString:@"51000.00"],
                             @"BMW M3 Coupe" : [NSDecimalNumber decimalNumberWithString:@"62000.00"],
                             @"BMW X6" : [NSDecimalNumber decimalNumberWithString:@"55015.00"]
                             };
    
    NSArray *sortedKeys = [prices keysSortedByValueUsingComparator:
                           ^NSComparisonResult(id obj1, id obj2) {
                               return [obj2 compare:obj1];
                           }];
    NSLog(@"%@", sortedKeys);
    
    
    //MARK: Filtering Dictionary Keys
    NSDecimalNumber *maximumPrice = [NSDecimalNumber decimalNumberWithString:@"55000.00"];

    NSSet *under55k = [prices keysOfEntriesPassingTest:^BOOL(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj compare:maximumPrice] == NSOrderedAscending) {
            return YES;
        } else {
            return NO;
        }
    }];
    NSLog(@"All under 55k%@", under55k);
}


-(void) NSMutableDictionaryUsage{
    //Creating Mutable Dictionaries
    NSMutableDictionary *jobs = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                @"Audi TT":@"John",
                                                                                @"Audi Quatro(Black)":@"Mary",
                                                                                @"Audi Quatro(Silver)":@"Bill",
                                                                                @"Audi A7":@"Bill",
                                                                                }];
    NSLog(@"%@", jobs);
    
    //Adding and Removing Entries
    [jobs setObject:@"Caug" forKey:@"BMX X5"];
    NSLog(@"%@", jobs);

    [jobs removeObjectForKey:@"Audi TT"];
     NSLog(@"%@", jobs);
    
    //Combining Dictionaries
    NSMutableDictionary *newJobs = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                   @"Hyundai Tucson":@"Mark",
                                                                                   @"Honda Civic":@"Tim"
                                                                                   }];
    
    [jobs addEntriesFromDictionary:newJobs];
    [jobs addEntriesFromDictionary:@{
                                     @"Toyota Prius":@"Arya Stark"
                                     }];
    NSLog(@"%@", jobs);
    
    [jobs enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (key == @"Honda Civic"){
                NSLog(@"%@", obj);
            }
    }];
    //NSLog(@"%@", jobs[@"Honda Civic"]);
    
    //Enumeration Considerations


}
@end
