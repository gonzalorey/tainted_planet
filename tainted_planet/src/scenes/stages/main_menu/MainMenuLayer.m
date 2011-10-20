//
//  MainMenuLayer.m
//  tainted_planet
//
//  Created by David Grandes on 10/13/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "MainMenuLayer.h"
#import "GameManager.h"


@implementation MainMenuLayer

-(CCMenu*)allocHUD
{

    CCMenu* mymenu;
    
    CCMenuItemImage *playGameButton = [CCMenuItemImage
                                       itemFromNormalImage:@"PlayGameButtonNormal.png"
                                       selectedImage:@"PlayGameButtonSelected.png"
                                       disabledImage:nil
                                       target:self
                                       selector:@selector(startGame)];
    
    CCMenuItemImage *optionsButton = [CCMenuItemImage
                                      itemFromNormalImage:@"OptionsButtonNormal.png"
                                      selectedImage:@"OptionsButtonSelected.png"
                                      disabledImage:nil
                                      target:self
                                      selector:@selector(credits)];
    
    mymenu = [CCMenu menuWithItems:playGameButton,optionsButton, nil];
    return [mymenu autorelease];
    

}

-(void)initHUD
{
    CGSize screenSize = [CCDirector sharedDirector].winSize;

    [self.HUD alignItemsVerticallyWithPadding:screenSize.height * 0.059f];
    [self.HUD setPosition: ccp(screenSize.width / 2, screenSize.height / 2)];
    
    // selection animation
    id moveAction = [CCMoveTo actionWithDuration:1.2f 
                                        position:ccp(screenSize.width * 0.85f, 
                                                     screenSize.height/2)];
    id moveEffect = [CCEaseIn actionWithAction:moveAction rate:1.0f];
    [self.HUD runAction:moveEffect];
    
    
}


-(void)startGame{
    NSLog(@"Start Game");
    
    // Load the Lvl1
    [[GameManager sharedGameManager] runSceneWithID:kGameLevel1];
}
-(void)credits{
    NSLog(@"Credits");
}
@end
