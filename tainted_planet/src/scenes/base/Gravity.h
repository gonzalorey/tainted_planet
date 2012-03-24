//
//  Gravity.h
//  tainted_planet
//
//  Created by David Grandes on 3/24/12.
//  Copyright (c) 2012 Big King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "BasePlanetaryLayer.h"
#import "BaseGameObject.h"
#import "BasePlanetGameObject.h"


@interface Gravity : NSObject{
    CGFloat G;
}

@property (nonatomic, assign) CGFloat G;

+(Gravity*)getInstance;

-(CGPoint)gravBtwnLayer:(BasePlanetaryLayer*) layer andObj:(BaseGameObject*)obj;
-(CGPoint)gravBtwnPlanet:(BasePlanetGameObject*) planet andObj:(BaseGameObject*)obj;

@end
