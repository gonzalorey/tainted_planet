//
//  BaseShip.m
//  tainted_planet
//
//  Created by David Grandes on 10/15/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BaseShip.h"


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

-(CGPoint)getPosition
{
    return CGPointMake(0, 0);
}


-(void)applyLinearImpulse:(CGPoint)impulse
{
    
}
-(CGPoint)getLinearVelocity
{
    b2Vec2 vel = body->GetLinearVelocity();
    return CGPointMake(vel.x, vel.y);
}
@end
