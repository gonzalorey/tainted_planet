//
//  MainMenuScene.m
//  tainted_planet
//
//  Created by David Grandes on 10/13/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "MainMenuScene.h"
#import "MainMenuLayer.h"
#import "MainMenuBackgroundLayer.h"

@implementation MainMenuScene

-(BaseBackgroundLayer*)getBackgroundLayer
{
    MainMenuBackgroundLayer * layer = [MainMenuBackgroundLayer node]; 
    return [layer autorelease];
}

-(BaseHUDLayer*)getHUDLayer
{
    return [MainMenuLayer node];
}

@end
