//
//  BasePlanetGameObject.m
//  tainted_planet
//
//  Created by David Grandes on 10/27/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BasePlanetGameObject.h"


@implementation BasePlanetGameObject




-(void)setShape:(b2FixtureDef*)fixture
{
    // Create circle shape

    myshape = new b2CircleShape();
    myshape->m_radius = 26.0/PTM_RATIO;
    
    fixture->shape = myshape;
    return;
}
-(float)getRadius
{  
    return 2.0f;
}

-(void)dealloc
{
    delete myshape;
    [super dealloc];
}

@end
