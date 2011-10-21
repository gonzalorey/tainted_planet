//
//  MainMenuLayer.m
//  bk_project
//
//  Created by Gonzalo Rey on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "MainMenuLayer_old.h"

@interface MainMenuLayer_old()
-(void)displayMainMenu;
-(void)displayLvl1;
@end

@implementation MainMenuLayer_old

-(void)playScene:(CCMenuItemFont*)itemPassedIn {
    if ([itemPassedIn tag] == 1) {
        CCLOG(@"Tag 1 found, Scene 1");
        [[GameManager sharedGameManager] runSceneWithID:kGameLevel1];
    } else {
        CCLOG(@"Tag was: %d", [itemPassedIn tag]);
        CCLOG(@"Placeholder for next chapters");
    }
}

-(void)displayMainMenu {
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    // Main Menu
    CCMenuItemImage *playGameButton = [CCMenuItemImage
                                       itemFromNormalImage:@"PlayGameButtonNormal.png"
                                       selectedImage:@"PlayGameButtonSelected.png"
                                       disabledImage:nil
                                       target:self
                                       selector:@selector(displayLvl1)];
    CCMenuItemImage *optionsButton = [CCMenuItemImage
                                      itemFromNormalImage:@"OptionsButtonNormal.png"
                                      selectedImage:@"OptionsButtonSelected.png"
                                      disabledImage:nil
                                      target:self
                                      selector:@selector(showOptions)];
    
    mainMenu = [CCMenu menuWithItems:playGameButton, optionsButton, nil];
    [mainMenu alignItemsVerticallyWithPadding:screenSize.height * 0.059f];
    [mainMenu setPosition: ccp(screenSize.width * 2, screenSize.height / 2)];
    
    // selection animation
    id moveAction = [CCMoveTo actionWithDuration:1.2f 
                                        position:ccp(screenSize.width * 0.85f, 
                                                     screenSize.height/2)];
    id moveEffect = [CCEaseIn actionWithAction:moveAction rate:1.0f];
    [mainMenu runAction:moveEffect];
    
    
    [self addChild:mainMenu z:0 tag:kMainMenuTagValue];
}

-(id)init {

    // always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
    self = [super init];
    if (self != nil) {
        [self displayMainMenu];
    }
    return self;
}

-(void)displayLvl1 {
 	// Run the first level
    [[GameManager sharedGameManager] runSceneWithID:kGameLevel1];
}

-(void)showOptions {
    // do something...
}
@end
