//
//  MainMenuLayer.m
//  tainted_planet
//
//  Created by David Grandes on 10/13/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "MainMenuLayer.h"


@implementation MainMenuLayer

-(CCMenu*)allocMenu
{

    CCMenu* mymenu;
    // Main Menu
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

-(void)initMenu
{
    CGSize screenSize = [CCDirector sharedDirector].winSize;

    [self.menu alignItemsVerticallyWithPadding:screenSize.height * 0.059f];
    [self.menu setPosition: ccp(screenSize.width / 2, screenSize.height / 2)];
    
    // selection animation
    id moveAction = [CCMoveTo actionWithDuration:1.2f 
                                        position:ccp(screenSize.width * 0.85f, 
                                                     screenSize.height/2)];
    id moveEffect = [CCEaseIn actionWithAction:moveAction rate:1.0f];
    [self.menu runAction:moveEffect];
    
    
}


-(void)startGame{
    NSLog(@"Start Game");
}
-(void)credits{
    NSLog(@"Credits");
}
@end
