//
//  BaseShip.m
//  tainted_planet
//
//  Created by David Grandes on 10/15/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BaseShip.h"
#import "Box2D.h"

@implementation BaseShip

@synthesize launched;

-(void)launch
{
    launched = TRUE;
}

-(BOOL)hasLaunched
{
    return launched;
}


@end
