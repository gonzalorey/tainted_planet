//
//  BaseStarshipLayer.m
//  tainted_planet
//
//  Created by David Grandes on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BaseStarshipLayer.h"
#import "BaseShip.h"

@implementation BaseStarshipLayer

@synthesize ship;

-(id)init{
    self = [super init];
    if(self != nil){
        
        self.ship = [[BaseShip alloc]initWithMass:1.0 scale:1.0 pos:CGPointMake(0,0) file:@"spaceship.png"];

        [self addChild:self.ship z:0  tag:0];
        
        
    }
    return self;
}

-(BaseShip*)getShip
{
    return ship;
}

@end
