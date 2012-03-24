//
//  BasePlanetGameObject.m
//  tainted_planet
//
//  Created by David Grandes on 10/27/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BasePlanetGameObject.h"
#import "CoordManager.h"


@implementation BasePlanetGameObject

-(void)setShape:(b2FixtureDef*)fixture
{
    // Create circle shape

    myshape = new b2CircleShape();
    CoordManager *coord = [CoordManager getInstance];
    myshape->m_radius = [coord box2Dradius:self];
    
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
