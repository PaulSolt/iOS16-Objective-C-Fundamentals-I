//
//  SyntaxBasics.m
//  iOS16-Objective-C-Fundamentals-I
//
//  Created by Paul Solt on 6/8/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

// an import statement is like a copy/paste
#import "SyntaxBasics.h"

// .m = implementation file (all logic and code)

@implementation SyntaxBasics

// initializers use "boiler plate code" - redundant, but required code

- (instancetype)initWithLargeNumber:(NSNumber *)largeNumber smallNumber:(int)smallNumber
{
    self = [super init];
    if (self != nil) {
        // do our setup
        
        // Always use _instanceVariableName when doing assignments, not
        // self.largeNumber -> we don't want side effects
        _largeNumber = largeNumber;
        _smallNumber = smallNumber;
    }
    return self;
}

- (void)explorePrimitives
{
    //
    // Primitives - number types
    //
    NSLog(@"---------------Primitives---------------");
    // Integer
    // 4 bytes wide, -2,147,483,648 through 2,147,483,647
    int age = 34;
    NSLog(@"Hello! You are %d years old.", age);
    
    // Long integer
    // 8 bytes wide, -9,223,372,036,854,775,808 through 9,223,372,036,854,775,807
    long aLong = 9223372036854;
    NSLog(@"%ld", aLong);
    
    // Single precision floating-point, 32-bit number
    float aFloat = -21.09f;
    NSLog(@"%f", aFloat);
    NSLog(@"%.2f", aFloat);
    
    // Double precision floating-point, 64-bit number
    double aDouble = -21.09;
    NSLog(@"%.2f", aDouble);
    NSLog(@"%e", aDouble);  // %e = scientific notation
    
    // Boolean
    // only two value choices, YES for true, NO for false
    BOOL isOn = NO;
    NSLog(@"%d", isOn);  // prints 1 for YES, 0 for NO
    NSLog(@"%@", isOn ? @"YES" : @"NO");
    
    //
    // Math
    //
    
    // All standard arithmetic operators apply: +, -, *, /, %
    
    // Integer division, result is always a whole number and not rounded
    int integerResult = 5 / 4;
    NSLog(@"Integer division: %d", integerResult);
    
    // Double division, 1 double and 1 int operand, result is promoted to double
    double doubleResult = 5.0 / 4;
    NSLog(@"Floating-point division: %f", doubleResult);
    
    // Floating point imprecision
    // Print statements show floating point numbers aren't as precise as they appear
    NSLog(@"%.17f", .1);
    NSLog(@"%.17f", 4.2 - 4.1); // actual answer: 0.10000000000000053
    
    //
    // NSInteger
    //
    
    // autosizes itself based on current platform
    NSInteger anInteger = -6;
    NSUInteger aPositiveInteger = 8;
    NSLog(@"anInteger: %ld", (long)anInteger);
    NSLog(@"aPositiveInteger: %ld", (long)aPositiveInteger);
    
    NSLog(@"---------------End Primitives---------------\n\n");
}

- (void)exploreObjects
{
    //
    // Objects (class-based types)
    //
    NSLog(@"---------------Objects---------------");
    // NSString = object
    // Swift String = struct
    
    NSString *lambda = @"Lambda School";
    NSLog(@"%@", lambda);
    
    // String concatenation/interpolation
    
    // Swift
    //let width = 94
    //let label = "The width is \(width)"
    
    NSString *label = @"The width is";
    int width = 94;
    NSString *widthLabel = [NSString stringWithFormat:@"%@ %d", label, width];
    NSLog(@"%@", widthLabel);
    
    // id type used to store an object of any type
    // Swift
    // let anyObject: AnyObject = "Hello"
    
    id mysteryObject = @"An NSString object";
    NSLog(@"%@", [mysteryObject description]);
    mysteryObject = @{@"model": @"Ford", @"year": @1967}; // Swift ["key" : "value"]
    NSLog(@"%@", [mysteryObject description]);
    
    NSLog(@"---------------End Objects---------------");
}

- (void)exploreCollectionsWithArray:(NSArray *)shipCaptains
{
    NSLog(@"---------------Collections---------------");
    
    // Array - ordered collection of objects, immutable
    NSLog(@"Serenity: %@", shipCaptains[0]);
    
    // Array comparison
    NSArray *sameCaptains = @[@"Malcolm Reynolds", @"JJJean-Luc Picard", @"James T. Kirk", @"Kathryn Janeway"];
    if ([shipCaptains isEqualToArray:sameCaptains]) {
        NSLog(@"Arrays are equal!");
    } else {
        NSLog(@"Arrays are not equal!");
    }
    
    // for loop syntax for iterating a collection
    // for (initial condition; end condition; increment/decrement)
    // i++
    // i = i + 1
    // i--
    // i = i - 1
    // C++ = C + 1
    for (int i=0; i<shipCaptains.count; i++) {
        NSLog(@"Captain on the bridge: %@", shipCaptains[i]);
    }
    
    // for in loop
    for (NSString *name in shipCaptains) {
        NSLog(@"%@", name);
    }
    
    // Check element for membership
    if ([shipCaptains containsObject:@"Kathryn Janeway"]) {
        NSLog(@"U.S.S. Voyager reporting for duty.");
    }
    
    // Find index of object
    NSUInteger index = [shipCaptains indexOfObject:@"James T. Kirk"];
    if (index == NSNotFound) {
        NSLog(@"Captain not found!");
    } else {
        NSLog(@"Captain %@ was found at index %lu", shipCaptains[index], (unsigned long)index);
    }
    
    // Swift
    // let = constant = NSArray
    //let pi = 3.14
    // var = variable = NSMutableArray
    //var myArray = [1, 2, 3]  // mutable Array in Swift
    
    // NSArray = set once, and constant
    // NSMutableArray = can add or remove elements
    
    // Same as above NSArray type, except can be mutated
    // note: array literal syntax can't be used for NSMutableArray
    NSMutableArray *mutableShipCaptains = [[NSMutableArray alloc] initWithObjects:@"Malcolm Reynolds", @"James T. Kirk", nil];
    [mutableShipCaptains addObject:@"Han Solo"];
    [mutableShipCaptains addObjectsFromArray:@[@"Jean-Luc Picard", @"Kathryn Janeway"]];
    
    NSLog(@"%@", mutableShipCaptains);
    
    // Dictionary - unordered collection of key-value pairs, immutable
    
    NSDictionary *occupations = @{@"Malcolm": @"Captain", @"Kaylee": @"Mechanic"};
    NSLog(@"%@", [occupations objectForKey:@"Malcolm"]);
    NSLog(@"%@", occupations[@"Kaylee"]);
    
    // NSMutableDictionary - same as above, but can be mutated
    // note: dictionary literal syntax can't be used for NSMutableDictionary
    NSMutableDictionary *mutableOccupations = [occupations mutableCopy];
    [mutableOccupations setObject:@"Public Relations" forKey:@"Jayne"];
    mutableOccupations[@"Jean-Luc Picard"] = @"Captain";
    
    NSLog(@"%@", mutableOccupations);
    
    NSLog(@"---------------End Collections---------------");
}

- (void)exploreNumbers
{
    //
    // NSNumber, a lightweight wrapper around the number primitives
    //
    NSLog(@"---------------NSNumber---------------");
    
    // Once converted to NSNumber, value can be converted back
    // to a primitive with methods shown below
    
    NSNumber *aBool = [NSNumber numberWithBool:NO];
    NSLog(@"%@", [aBool boolValue] ? @"YES" : @"NO");
    
    NSNumber *intAsNumber = [NSNumber numberWithInt:2147483647];
    NSLog(@"%i", [intAsNumber intValue]);
    
    NSNumber *longAsNumber = [NSNumber numberWithLong:9223372036854775807];
    NSLog(@"%li", [longAsNumber longValue]);
    
    NSNumber *floatAsNumber = [NSNumber numberWithFloat:26.99f];
    NSLog(@"%f", [floatAsNumber floatValue]);
    
    NSNumber *doubleAsNumber = [NSNumber numberWithDouble:26.99];
    NSLog(@"%f", [doubleAsNumber doubleValue]);
    
    // It's also possible to convert an NSNumber to a string
    NSString *asString = [self.largeNumber stringValue];
    NSLog(@"%@", asString);
    
    // The following literal shortcuts allow for easier NSNumber
    // initialization compared to the above methods
    NSNumber *boolLiteral = @NO;
    NSNumber *intLiteral = @42;
    NSNumber *longLiteral = @9223372036854775807L;
    NSNumber *floatLiteral = @26.99F;
    NSNumber *doubleLiteral = @26.99;
    NSLog(@"bool: %@, int: %@, long: %@, float: %@, double: %@", boolLiteral, intLiteral, longLiteral, floatLiteral, doubleLiteral);
    
    NSNumber *aNumber = @12.5;
    NSNumber *anotherNumber = @12.5;
    
    // Because both values are objects, == doesn't work in the usual way
    if (aNumber == anotherNumber) {
        NSLog(@"Numbers are equal");
    }
    else {
        NSLog(@"Numbers are not equal");
    }
    
    // NSNumber has a method for equating two number objects instead
    if ([anotherNumber isEqualToNumber:aNumber]) {
        NSLog(@"Numbers are equal");
    }
    else {
        NSLog(@"Numbers are not equal");
    }
    
    NSLog(@"---------------End NSNumber---------------");
}

@end
