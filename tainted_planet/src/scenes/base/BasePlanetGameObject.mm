//
//  BasePlanetGameObject.m
//  tainted_planet
//
//  Created by David Grandes on 10/27/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BasePlanetGameObject.h"


@implementation BasePlanetGameObject


-(b2Shape*)getShape
{
    // Create circle shape
    b2CircleShape* circle;
    circle->m_radius = 26.0/PTM_RATIO;
    
    return circle;    
}

-(float)getRadius
{  
    return 2.0f;
}

@end
