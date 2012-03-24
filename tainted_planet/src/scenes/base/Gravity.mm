//
//  Gravity.m
//  tainted_planet
//
//  Created by David Grandes on 3/24/12.
//  Copyright (c) 2012 Big King. All rights reserved.
//

#import "Gravity.h"

@implementation Gravity

@synthesize G;

static Gravity* _instance = nil;

+(Gravity*)getInstance
{
    @synchronized([Gravity class])
    {
        if(!_instance){
            [[self alloc]init];
            _instance.G = GRAVITIC_DRIVE;
        }
        return _instance;
    }
    return nil;
}

+(id) alloc{
    @synchronized([Gravity class])
    {
        NSAssert(_instance == nil, @"Attempted to allocate a second instance of Gravity");
        _instance = [super alloc];
        return _instance;
    }
    return nil;
    
}


-(CGPoint)gravBtwnLayer:(BasePlanetaryLayer*) layer andObj:(BaseGameObject*)obj{
    CGPoint force = CGPointMake(0, 0);
    NSMutableArray* planets = [layer getPlanets];
    for (BasePlanetGameObject * planet in planets) {
        CGPoint thisForce = [self gravBtwnPlanet:planet andObj:obj];
        force.x += thisForce.x;
        force.y += thisForce.y;
    }
    return force;
}

-(CGPoint)gravBtwnPlanet:(BasePlanetGameObject*) planet andObj:(BaseGameObject*)obj{
    CGPoint force = CGPointMake(0, 0);
    force = CGPOINT_SUB(obj.position, planet.position);
    CGFloat power = force.x*force.x + force.y*force.y;
    CGFloat powsqrt = sqrtf(power);
    force = CGPointMake(force.x / powsqrt, force.y / powsqrt);
    CGFloat GraviticForce = (self.G*planet.mass)/(power);
    return CGPointMake(force.x * GraviticForce, force.y * GraviticForce);
}
@end
