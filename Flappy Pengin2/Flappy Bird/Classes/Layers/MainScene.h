//
//  MainScene.h
//  Flappy Bird
//
//  Created by Sentio on 1/20/14.
//  Copyright 2014 Sentio Ltd . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MainScene : CCLayer {
    CCMenu *menu;
    CCMenuItemImage *m_mStart, *m_mScore, *m_mRate, *m_mMore;
    CCSprite *m_sBirdSprite;
    CCSprite *back;
    CCSprite *m_sLogoSprite;
    CCSprite *m_sGroundSprite[18];
    CCSprite *m_sTopSprite[18];
}

- (void) updateRateButton;

@end
