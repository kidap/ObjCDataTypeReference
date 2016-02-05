//
//  NSStringDataType.m
//  Objective C Data Types
//
//  Created by Karlo Pagtakhan on 02/01/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "NSStringDataType.h"

@implementation NSStringDataType

-(void) initStringUsage{
    NSString *make = @"Porsche";
    NSString *model = @"911";
    int year = 1968;
    
    NSString *message = [NSString stringWithFormat:@"%@-%@, %d",make, model, year];
    
    NSLog(@"%@", message);
    
    
    for (int x = 0; x < [make length]; x++){
        unichar letter = [make characterAtIndex:x];
        NSLog(@"%c", letter);
    }
    
    NSString *car = @"APorsche Boxtr";
    
    if ([car isEqualToString:@"Porsche Boxter"]){
        NSLog(@"model is the same");
    }
    if ([car hasPrefix:@"Porsche"]){
        NSLog(@"Prefix is that same");
    }
    
    if ([car hasSuffix:@"Boxter"]){
        NSLog(@"Suffix is that same");
    }
    
    
    //Comparison will sort the strings
    NSComparisonResult result = [make compare:car];
    
    if (result == NSOrderedSame){
        NSLog(@"Ordered same");
    }
    if (result == NSOrderedAscending){
        NSLog(@"Ascending");
    }
    if (result == NSOrderedDescending){
        NSLog(@"Descending");
    }
    
    //Appending strings
    NSString *string1 = @"Hello";
    NSString *string2 = @"World";
    
    NSString *appendedString = [string1 stringByAppendingString:string2];
    
    NSLog(@"%@",appendedString);
    
    
    NSString *carSearch = @"Maserati GranCarbio";
    NSRange searchResult = [carSearch rangeOfString:@"Gran" ];
    
    if (searchResult.location == NSNotFound){
        NSLog(@"String was not found in main string");
    } else {
        NSLog(@"Location:%lu \nLength:%lu", searchResult.location, searchResult.length);
    }
    
    //Subdividing Strings
    NSString *car3 = @"Maserati GranTurismo";
    NSLog(@"%@", [car3 substringToIndex:8]);               // Maserati
    NSLog(@"%@", [car3 substringFromIndex:9]);             // GranTurismo
    NSRange range = NSMakeRange(9, 4);
    NSLog(@"%@", [car3 substringWithRange:range]);         // Gran
    
    //Replacing Substrings
    NSString *elise = @"Lotus Elise";
    NSRange range2 = NSMakeRange(6, 5);
    NSString *exige = [elise stringByReplacingCharactersInRange:range2
                                                     withString:@"Exige"];
    NSLog(@"%@", exige);          // Lotus Exige
    NSString *evora = [exige stringByReplacingOccurrencesOfString:@"Exige"
                                                       withString:@"Evora"];
    NSLog(@"%@", evora);          // Lotus Evora

    //Changing Case
    NSString *car4 = @"lotUs beSpoKE";
    NSLog(@"%@", [car4 lowercaseString]);      // lotus bespoke
    NSLog(@"%@", [car4 uppercaseString]);      // LOTUS BESPOKE
    NSLog(@"%@", [car4 capitalizedString]);    // Lotus Bespoke
    
    //Numerical conversion
    NSString *year2 = @"2012";
    BOOL asBool = [year2 boolValue];
    int asInt = [year2 intValue];
    NSInteger asInteger = [year2 integerValue];
    long long asLongLong = [year2 longLongValue];
    float asFloat = [year2 floatValue];
    double asDouble = [year2 doubleValue];
}

-(void) NSMutableStringUsage{
    NSMutableString *mutableStringVar = [NSMutableString stringWithString:@"San Antonio Spurs"];
    
    NSLog(@"%@",mutableStringVar);
    
    [mutableStringVar setString:@"Chicago Bulls"];
    
    NSLog(@"%@",mutableStringVar);
    
    NSMutableString *favoriteNBAteam = [NSMutableString stringWithString:@"San"];
    
    [favoriteNBAteam appendString:@"Antontio"];
    
    NSLog(@"%@", favoriteNBAteam);
    
    [favoriteNBAteam insertString:@"Spurs" atIndex:11];
    NSLog(@"%@", favoriteNBAteam);

    NSLog(@"%lu", [favoriteNBAteam length]);
    
    //replaceCharactersInRange:NSMakeRange(<starting>,<offset>
    [favoriteNBAteam replaceCharactersInRange:NSMakeRange(11, 5) withString:@"Stars"];
    NSLog(@"%@", favoriteNBAteam);
}
/*
 The two examples presented in this section demonstrate the advantages of mutable strings. First, let’s take a look at an anti-pattern for immutable strings. The following loop generates a string containing all of the numbers between 0 and 999 using NSString.
 
 // DO NOT DO THIS. EVER.
 NSString *indices = @"";
 for (int i=0; i<1000; i++) {
 indices = [indices stringByAppendingFormat:@"%d", i];
 }
 Remember that stringByAppendingFormat: creates a new NSString instance, which means that in each iteration, the entire string gets copied to a new block of memory. The above code allocates 999 string objects that serve only as intermediary values, resulting in an application that requires a whopping 1.76 MB of memory. Needless to say, this is incredibly inefficient.
 
 Now, let’s take a look at the mutable version of this snippet:
 
 NSMutableString *indices = [NSMutableString stringWithCapacity:1];
 for (int i=0; i<1000; i++) {
 [indices appendFormat:@"%d", i];
 }
 Since mutable strings manipulate their contents in place, no copying is involved, and we completely avoid the 999 unnecessary allocations. Internally, the mutable string’s storage dynamically expands to accommodate longer values. This reduces the memory footprint to around 19 KB, which is much more reasonable.
 
 So, a good rule of thumb is to use a mutable string whenever you’re running any kind of algorithm that edits or assembles a string in several passes and to use an immutable string for everything else. This also applies to sets, arrays, and dictionaries.
*/
@end
