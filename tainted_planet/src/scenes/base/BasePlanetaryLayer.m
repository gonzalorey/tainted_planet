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
        
        self.planets = [self getPlanets];
        for(BasePlanetSprite* planet in self.planets)
        {
            [self addChild:planet z:0  tag:0];
        }
        
    }
    return self;
}

-(NSMutableArray*)getPlanets
{ 
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    NSMutableArray* myplanets= [[NSMutableArray alloc]init];
    [myplanets addObject:[[BasePlanetSprite alloc] initWithMass:10 Radius:0.5f pos: CGPointMake(screenSize.width/2.0f, screenSize.height/2)file:@"planet.png"]];

     return [myplanets autorelease];
}
@end
