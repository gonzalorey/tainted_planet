//
//  Lvl1HUDLayer.m
//  tainted_planet
//
//  Created by Gonzalo Rey on 10/15/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "Lvl1HUDLayer.h"


@implementation Lvl1HUDLayer

-(CCMenu *)allocHUD
{
    CCMenuItemImage* launchButton = [CCMenuItemImage 
                                     itemFromNormalImage:@"PlayGameButtonNormal.png" 
                                     selectedImage:@"PlayGameButtonSelected.png"
                                     disabledImage:nil 
                                     target:self 
                                     selector:@selector(launch)];
    
    CCMenu* myHUD;
    myHUD = [CCMenu menuWithItems:launchButton, nil];
    return [myHUD autorelease];
}

-(void)initHUD
{
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    [self.HUD setPosition: ccp(screenSize.width / 8.0f * 7, screenSize.height / 8.0 * 7)];
}

-(void)launch
{
    NSLog(@"Launch Ship!");
}

@end
