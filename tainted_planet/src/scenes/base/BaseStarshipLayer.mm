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
        
        self.ship = [self createShip];

        [self addChild:self.ship z:0  tag:0];
        
        
    }
    return self;
}

-(BaseShip*)createShip
{
    return nil;
}

-(BaseShip*)getShip
{
        return ship;
}

-(void)dealloc
{
    [ship release];
}
@end
