//
//  BaseShip.m
//  tainted_planet
//
//  Created by David Grandes on 10/15/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BaseShip.h"
#import "Box2D.h"
#import "CoordManager.h"

@implementation BaseShip

@synthesize launched;

-(void)launch
{
    launched = TRUE;
    [self applyLinearImpulse:CGPointMake(5,5)];
}

-(BOOL)hasLaunched
{
    return launched;
}

-(void)takePlanetPosition: (BasePlanetGameObject*)planet
{
    [self setPosition: [planet getPosition]];
}

-(void)layOnSurface: (BasePlanetGameObject*)planet
{
    CGPoint planetPosition = [planet getPosition];
    
    // initialy, we set just the x distance to the center
    [self setPosition: CGPointMake(planetPosition.x + [planet getRadius], planetPosition.y)];
}

-(void)setShape:(b2FixtureDef*)fixture
{
    // Create circle shape
    
    myshape = new b2CircleShape();
    myshape->m_radius = [[CoordManager getInstance] box2Dradius:self];
    
    fixture->shape = myshape;
    return;
}

@end
