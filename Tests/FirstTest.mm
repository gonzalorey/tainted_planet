//
//  FirstTest.m
//  tainted_planet
//
//  Created by David Grandes on 11/28/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h> 
#import "Box2D.h"
#import "BaseShip.h"

@interface FirstTest : GHTestCase { }
@end



@implementation FirstTest

- (void)testStrings {       
    NSString *string1 = @"a string";
    GHTestLog(@"I can log to the GHUnit test console: %@", string1);
    
    // Assert string1 is not NULL, with no custom error description
    GHAssertNotNULL(string1, nil);
    
    BaseShip* bgo = [[BaseShip alloc]init];
    
    GHAssertNotNULL(bgo, nil);    
    // Assert equal objects, add custom error description
    NSString *string2 = @"a string";
    GHAssertEqualObjects(string1, string2, @"A custom error message. string1 should be equal to: %@.", string2);
}


@end