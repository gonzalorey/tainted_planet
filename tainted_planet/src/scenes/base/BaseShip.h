//
//  BaseShip.h
//  tainted_planet
//
//  Created by David Grandes on 10/15/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseGameObject.h"
#import "BasePlanetGameObject.h"

@interface BaseShip : BaseGameObject {
 
    BOOL launched;
}

@property (nonatomic, assign) BOOL launched;

-(void)launch;
-(BOOL)hasLaunched;
-(void)takePlanetPosition: (BasePlanetGameObject*)planet;
-(void)layOnSurface: (BasePlanetGameObject*)planet;

@end
