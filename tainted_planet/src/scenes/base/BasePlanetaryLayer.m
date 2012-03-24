//
//  BasePlanetaryLayer.m
//  tainted_planet
//
//  Created by David Grandes on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BasePlanetaryLayer.h"
#import "BasePlanetSprite.h"

@implementation BasePlanetaryLayer

@synthesize planets;

-(id)init{
    self = [super init];
    if(self != nil){
        
        self.planets = [self createPlanets];
        for(BasePlanetSprite* planet in self.planets)
        {
            [self addChild:planet z:0  tag:0];
            
        }
        
    }
    return self;
}

-(void)dealloc
{
    [self.planets release];
}
-(NSMutableArray*)getPlanets
{ 
    return self.planets;
}

-(NSMutableArray*)createPlanets
{
    return nil;
}
@end
