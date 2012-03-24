//
//  BaseBackgroundLayer.m
//  tainted_planet
//
//  Created by David Grandes on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "BaseBackgroundLayer.h"


@implementation BaseBackgroundLayer

-(id)init{
    self = [super init];
    if(self != nil){
        
        CCSprite * backgroundImage;
        NSString * backgroundImageName = [self getBackgroundImageName];
        if(backgroundImageName != nil){        
            backgroundImage = [CCSprite spriteWithFile:backgroundImageName];
            CGSize screenSize = [[CCDirector sharedDirector] winSize];
            [backgroundImage setPosition:CGPointMake(screenSize.width/2.0f, screenSize.height/2)];
            [self addChild:backgroundImage z:0  tag:0];
        }
    }
    return self;
}

-(NSString*)getBackgroundImageName
{
  //  return @"background1.png";
    return nil;
}
@end
