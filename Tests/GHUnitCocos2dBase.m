//
//  GHUnitCocos2dBase.m
//  HelloWorld
//
//  Created by  on 11/08/11.
//  Copyright (c) 2011 Dazzle Inc. All rights reserved.
//
#import "GHUnitCocos2dBase.h"

@implementation GHUnitCocos2dBase

- (BOOL) shouldRunOnMainThread
{
    // By default NO, but if you have a UI test or test dependent on running on the main thread return YES
    return YES;
}

- (void) setUpClass
{
	CC_DIRECTOR_INIT();
}

- (void) tearDownClass
{
	CC_DIRECTOR_END();
	// You have to do this or the test window will not get the focus back
	[window release];
}

@end
