//
//  main.m
//  Tests
//
//  Created by David Grandes on 11/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"GHUnitIPhoneAppDelegate");
    [pool release];
    return retVal;
}
