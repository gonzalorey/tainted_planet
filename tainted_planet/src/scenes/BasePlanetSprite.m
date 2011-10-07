//
//  BasePlanetSprite.m
//  tainted_planet
//
//  Created by David Grandes on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BasePlanetSprite.h"


@implementation BasePlanetSprite

@synthesize mass, radius, filename;

-(id)initWithMass:(float)m Radius:(float)r pos:(CGPoint)p file:(NSString *)afilename
{
    [super initWithFile:afilename];
    self.mass = m;
    self.radius = r;
    self.position =  p;
    self.scale = r;
    return self;
    
}


@end
