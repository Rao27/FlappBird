//
//  MainScene.m
//  Flappy Bird
//
//  Created by Sentio on 1/20/14.
//  Copyright 2014 Sentio Ltd . All rights reserved.
//

#import "MainScene.h"
#import "Global.h"
#import "AppDelegate.h"

@implementation MainScene
- (id) init{
    if((self=[super init]))
    {
        self.touchEnabled = YES;
        [self createBackground];
        [self initVariable];
    }
    g_lMainLayer = self;
    return self;
}

- (void) initVariable{
    [m_sBirdSprite runAction: [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: g_frmBird]]];
    [m_sBirdSprite runAction: [CCRepeatForever actionWithAction:[CCSequence actionOne:[CCMoveBy actionWithDuration:0.5f position:ccp(0, 20 * G_SCALEY / g_fScaleR)] two:[CCMoveBy actionWithDuration:0.5f position:ccp(0, -20 * G_SCALEY / g_fScaleR)]]]];
    [m_sLogoSprite runAction: [CCRepeatForever actionWithAction:[CCSequence actionOne:[CCMoveBy actionWithDuration:0.5f position:ccp(0, 20 * G_SCALEY / g_fScaleR)] two:[CCMoveBy actionWithDuration:0.5f position:ccp(0, -20 * G_SCALEY / g_fScaleR)]]]];
    
    [self schedule:@selector(Update:) interval:0.1f];

}

- (void) createBackground{
    
    back=newSprite(@"vawes_loop_background", G_SWIDTH / 2, G_SHEIGHT / 2, self, -1, RATIO_XY);
   
    m_sBirdSprite = newSprite(@"bat0", getX(250), getY(200), self, 1, RATIO_X);
    m_sLogoSprite = newSprite(@"flappy bird", getX(120), getY(200), self, 1, RATIO_X);
    
 //   m_sGroundSprite[0] = newSprite(@"tunnel_bottom_01", getX(10), getY(400), self, 0, RATIO_XY);
 //   m_sGroundSprite[1] = newSprite(@"tunnel_bottom_02", getX(55), getY(400), self, 0, RATIO_XY);
    
    
    m_sGroundSprite[0] = newSprite(@"tunnel_bottom_01", getX(10), getY(400), self, 0, RATIO_XY);
    m_sGroundSprite[1] = newSprite(@"tunnel_bottom_02", getX(60), getY(410), self, 0, RATIO_XY);
    m_sGroundSprite[2] = newSprite(@"tunnel_bottom_03", getX(100), getY(410), self, 0, RATIO_XY);
    m_sGroundSprite[3] = newSprite(@"tunnel_bottom_04", getX(145), getY(410), self, 0, RATIO_XY);
    m_sGroundSprite[4] = newSprite(@"tunnel_bottom_05", getX(190), getY(410), self, 0, RATIO_XY);
    m_sGroundSprite[5] = newSprite(@"tunnel_bottom_06", getX(234), getY(410), self, 0, RATIO_XY);
    m_sGroundSprite[6] = newSprite(@"tunnel_bottom_07", getX(276), getY(410), self, 0, RATIO_XY);
    m_sGroundSprite[7] = newSprite(@"tunnel_bottom_08", getX(316), getY(382), self, 0, RATIO_XY);
    m_sGroundSprite[8] = newSprite(@"tunnel_bottom_09", getX(360), getY(420), self, 0, RATIO_XY);
   
    
    m_sGroundSprite[9] = newSprite(@"tunnel_bottom_01", m_sGroundSprite[8].position.x+50, getY(400), self, 0, RATIO_XY);
    m_sGroundSprite[10] = newSprite(@"tunnel_bottom_02", m_sGroundSprite[9].position.x+45, getY(410), self, 0, RATIO_XY);
    m_sGroundSprite[11] = newSprite(@"tunnel_bottom_03", m_sGroundSprite[10].position.x+45, getY(410), self, 0, RATIO_XY);
    m_sGroundSprite[12] = newSprite(@"tunnel_bottom_04", m_sGroundSprite[11].position.x+45, getY(410), self, 0, RATIO_XY);
    m_sGroundSprite[13] = newSprite(@"tunnel_bottom_05", m_sGroundSprite[12].position.x+45, getY(410), self, 0, RATIO_XY);
    m_sGroundSprite[14] = newSprite(@"tunnel_bottom_06", m_sGroundSprite[13].position.x+45, getY(410), self, 0, RATIO_XY);
    m_sGroundSprite[15] = newSprite(@"tunnel_bottom_07", m_sGroundSprite[14].position.x+45, getY(410), self, 0, RATIO_XY);
    m_sGroundSprite[16] = newSprite(@"tunnel_bottom_08", m_sGroundSprite[15].position.x+45, getY(382), self, 0, RATIO_XY);
    m_sGroundSprite[17] = newSprite(@"tunnel_bottom_09", m_sGroundSprite[16].position.x+45, getY(420), self, 0, RATIO_XY);
    
    
    ////////////////////////////////////Top/////////////////////
    m_sTopSprite[0] = newSprite(@"tunnel_top_01", getX(10), getY(110), self, 0, RATIO_XY);
    m_sTopSprite[1] = newSprite(@"tunnel_top_02", getX(60), getY(100), self, 0, RATIO_XY);
    m_sTopSprite[2] = newSprite(@"tunnel_top_03", getX(100), getY(100), self, 0, RATIO_XY);
    m_sTopSprite[3] = newSprite(@"tunnel_top_04", getX(145), getY(100), self, 0, RATIO_XY);
    m_sTopSprite[4] = newSprite(@"tunnel_top_05", getX(190), getY(100), self, 0, RATIO_XY);
    m_sTopSprite[5] = newSprite(@"tunnel_top_06", getX(234), getY(100), self, 0, RATIO_XY);
    m_sTopSprite[6] = newSprite(@"tunnel_top_07", getX(276), getY(100), self, 0, RATIO_XY);
    m_sTopSprite[7] = newSprite(@"tunnel_top_08", getX(316), getY(130), self, 0, RATIO_XY);
    m_sTopSprite[8] = newSprite(@"tunnel_top_09", getX(360), getY(90), self, 0, RATIO_XY);
    
    
    m_sTopSprite[9] = newSprite(@"tunnel_top_01", m_sTopSprite[8].position.x+50, getY(110), self, 0, RATIO_XY);
    m_sTopSprite[10] = newSprite(@"tunnel_top_02", m_sTopSprite[9].position.x+45, getY(100), self, 0, RATIO_XY);
    m_sTopSprite[11] = newSprite(@"tunnel_top_03", m_sTopSprite[10].position.x+45, getY(100), self, 0, RATIO_XY);
    m_sTopSprite[12] = newSprite(@"tunnel_top_04", m_sTopSprite[11].position.x+45, getY(100), self, 0, RATIO_XY);
    m_sTopSprite[13] = newSprite(@"tunnel_top_05", m_sTopSprite[12].position.x+45, getY(100), self, 0, RATIO_XY);
    m_sTopSprite[14] = newSprite(@"tunnel_top_06", m_sTopSprite[13].position.x+45, getY(100), self, 0, RATIO_XY);
    m_sTopSprite[15] = newSprite(@"tunnel_top_07", m_sTopSprite[14].position.x+45, getY(100), self, 0, RATIO_XY);
    m_sTopSprite[16] = newSprite(@"tunnel_top_08", m_sTopSprite[15].position.x+45, getY(130), self, 0, RATIO_XY);
    m_sTopSprite[17] = newSprite(@"tunnel_top_09", m_sTopSprite[16].position.x+45, getY(90), self, 0, RATIO_XY);

    
    m_mStart = newButton(@"start", getX(88), getY(330), self, @selector(onClickStart), false,RATIO_X);
    m_mScore = newButton(@"score", getX(207), getY(330), self, @selector(onClickScore), false,RATIO_X);
    m_mRate = newButton(@"rate", getX(207), getY(270), self, @selector(onClickRate), false,RATIO_X);
    m_mMore = newButton(@"more", getX(207), getY(400), self, @selector(onClickMore), false,RATIO_X);
    
    menu = [CCMenu menuWithItems: m_mStart, m_mScore, m_mMore, nil];
    menu.position = ccp(0, 0);
    [self addChild: menu z:10];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if(![userDefaults boolForKey:@"Rated"])
       [menu addChild: m_mRate];

}

- (void) updateRateButton{
    [menu removeChild: m_mRate];
}

- (void) onClickStart{
    FX_BTN();
    [[CCDirector sharedDirector] replaceScene: [GameScene node]];
}

- (void) onClickScore{
    FX_BTN();
    AppController *delegate = (AppController *)[[UIApplication sharedApplication] delegate];
    [delegate showLeaderboard];
}

- (void) onClickRate{
    FX_BTN();
    AppController *delegate = (AppController *)[[UIApplication sharedApplication] delegate];
    [delegate showRate];

}

- (void) onClickMore{
    FX_BTN();
    [[Chartboost sharedChartboost] showMoreApps];
}

- (void) Update:(float) dt{
    
    m_sGroundSprite[0].position = ccp(m_sGroundSprite[0].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[0].position.y);
    m_sGroundSprite[1].position = ccp(m_sGroundSprite[1].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[1].position.y);
    m_sGroundSprite[2].position = ccp(m_sGroundSprite[2].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[2].position.y);
    m_sGroundSprite[3].position = ccp(m_sGroundSprite[3].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[3].position.y);
    m_sGroundSprite[4].position = ccp(m_sGroundSprite[4].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[4].position.y);
    m_sGroundSprite[5].position = ccp(m_sGroundSprite[5].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[5].position.y);
    m_sGroundSprite[6].position = ccp(m_sGroundSprite[6].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[6].position.y);
    m_sGroundSprite[7].position = ccp(m_sGroundSprite[7].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[7].position.y);
    m_sGroundSprite[8].position = ccp(m_sGroundSprite[8].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[8].position.y);
    
    m_sGroundSprite[9].position = ccp(m_sGroundSprite[9].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[9].position.y);
    m_sGroundSprite[10].position = ccp(m_sGroundSprite[10].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[10].position.y);
    m_sGroundSprite[11].position = ccp(m_sGroundSprite[11].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[11].position.y);
    m_sGroundSprite[12].position = ccp(m_sGroundSprite[12].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[12].position.y);
    m_sGroundSprite[13].position = ccp(m_sGroundSprite[13].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[13].position.y);
    m_sGroundSprite[14].position = ccp(m_sGroundSprite[14].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[14].position.y);
    m_sGroundSprite[15].position = ccp(m_sGroundSprite[15].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[15].position.y);
    m_sGroundSprite[16].position = ccp(m_sGroundSprite[16].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[16].position.y);
    m_sGroundSprite[17].position = ccp(m_sGroundSprite[17].position.x - 8 * G_SCALEX / g_fScaleR, m_sGroundSprite[17].position.y);

    m_sTopSprite[0].position = ccp(m_sTopSprite[0].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[0].position.y);
    m_sTopSprite[1].position = ccp(m_sTopSprite[1].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[1].position.y);
    m_sTopSprite[2].position = ccp(m_sTopSprite[2].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[2].position.y);
    m_sTopSprite[3].position = ccp(m_sTopSprite[3].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[3].position.y);
    m_sTopSprite[4].position = ccp(m_sTopSprite[4].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[4].position.y);
    m_sTopSprite[5].position = ccp(m_sTopSprite[5].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[5].position.y);
    m_sTopSprite[6].position = ccp(m_sTopSprite[6].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[6].position.y);
    m_sTopSprite[7].position = ccp(m_sTopSprite[7].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[7].position.y);
    m_sTopSprite[8].position = ccp(m_sTopSprite[8].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[8].position.y);
    
    m_sTopSprite[9].position = ccp(m_sTopSprite[9].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[9].position.y);
    m_sTopSprite[10].position = ccp(m_sTopSprite[10].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[10].position.y);
    m_sTopSprite[11].position = ccp(m_sTopSprite[11].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[11].position.y);
    m_sTopSprite[12].position = ccp(m_sTopSprite[12].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[12].position.y);
    m_sTopSprite[13].position = ccp(m_sTopSprite[13].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[13].position.y);
    m_sTopSprite[14].position = ccp(m_sTopSprite[14].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[14].position.y);
    m_sTopSprite[15].position = ccp(m_sTopSprite[15].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[15].position.y);
    m_sTopSprite[16].position = ccp(m_sTopSprite[16].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[16].position.y);
    m_sTopSprite[17].position = ccp(m_sTopSprite[17].position.x - 8 * G_SCALEX / g_fScaleR, m_sTopSprite[17].position.y);
    
    
    if(m_sGroundSprite[0].position.x < -55)
        m_sGroundSprite[0].position = ccp(m_sGroundSprite[17].position.x+50,m_sGroundSprite[0].position.y);
    if(m_sGroundSprite[1].position.x < -55)
        m_sGroundSprite[1].position = ccp(m_sGroundSprite[0].position.x+45,m_sGroundSprite[1].position.y);
    if(m_sGroundSprite[2].position.x < -55)
        m_sGroundSprite[2].position = ccp(m_sGroundSprite[1].position.x+45,m_sGroundSprite[2].position.y);
    if(m_sGroundSprite[3].position.x < -55)
        m_sGroundSprite[3].position = ccp(m_sGroundSprite[2].position.x+45,m_sGroundSprite[3].position.y);
    if(m_sGroundSprite[4].position.x < -55)
        m_sGroundSprite[4].position = ccp(m_sGroundSprite[3].position.x+45,m_sGroundSprite[4].position.y);
    if(m_sGroundSprite[5].position.x < -55)
        m_sGroundSprite[5].position = ccp(m_sGroundSprite[4].position.x+45,m_sGroundSprite[5].position.y);
    if(m_sGroundSprite[6].position.x < -55)
        m_sGroundSprite[6].position = ccp(m_sGroundSprite[5].position.x+45,m_sGroundSprite[6].position.y);
    if(m_sGroundSprite[7].position.x < -55)
        m_sGroundSprite[7].position = ccp(m_sGroundSprite[6].position.x+45,m_sGroundSprite[7].position.y);
    if(m_sGroundSprite[8].position.x < -55)
        m_sGroundSprite[8].position = ccp(m_sGroundSprite[7].position.x+45,m_sGroundSprite[8].position.y);
    
    
    if(m_sGroundSprite[9].position.x < -55)
        m_sGroundSprite[9].position = ccp(m_sGroundSprite[8].position.x+45,m_sGroundSprite[0].position.y);
    if(m_sGroundSprite[10].position.x < -55)
        m_sGroundSprite[10].position = ccp(m_sGroundSprite[9].position.x+45,m_sGroundSprite[1].position.y);
    if(m_sGroundSprite[11].position.x < -55)
        m_sGroundSprite[11].position = ccp(m_sGroundSprite[10].position.x+45,m_sGroundSprite[2].position.y);
    if(m_sGroundSprite[12].position.x < -55)
        m_sGroundSprite[12].position = ccp(m_sGroundSprite[11].position.x+45,m_sGroundSprite[3].position.y);
    if(m_sGroundSprite[13].position.x < -55)
        m_sGroundSprite[13].position = ccp(m_sGroundSprite[12].position.x+45,m_sGroundSprite[4].position.y);
    if(m_sGroundSprite[14].position.x < -55)
        m_sGroundSprite[14].position = ccp(m_sGroundSprite[13].position.x+45,m_sGroundSprite[5].position.y);
    if(m_sGroundSprite[15].position.x < -55)
        m_sGroundSprite[15].position = ccp(m_sGroundSprite[14].position.x+45,m_sGroundSprite[6].position.y);
    if(m_sGroundSprite[16].position.x < -55)
        m_sGroundSprite[16].position = ccp(m_sGroundSprite[15].position.x+45,m_sGroundSprite[7].position.y);
    if(m_sGroundSprite[17].position.x < -55)
        m_sGroundSprite[17].position = ccp(m_sGroundSprite[16].position.x+45,m_sGroundSprite[8].position.y);
    
    
    ////////////Top
    if(m_sTopSprite[0].position.x < -55)
        m_sTopSprite[0].position = ccp(m_sTopSprite[17].position.x+50,m_sTopSprite[0].position.y);
    if(m_sTopSprite[1].position.x < -55)
        m_sTopSprite[1].position = ccp(m_sTopSprite[0].position.x+45,m_sTopSprite[1].position.y);
    if(m_sTopSprite[2].position.x < -55)
        m_sTopSprite[2].position = ccp(m_sTopSprite[1].position.x+45,m_sTopSprite[2].position.y);
    if(m_sTopSprite[3].position.x < -55)
        m_sTopSprite[3].position = ccp(m_sTopSprite[2].position.x+45,m_sTopSprite[3].position.y);
    if(m_sTopSprite[4].position.x < -55)
        m_sTopSprite[4].position = ccp(m_sTopSprite[3].position.x+45,m_sTopSprite[4].position.y);
    if(m_sTopSprite[5].position.x < -55)
        m_sTopSprite[5].position = ccp(m_sTopSprite[4].position.x+45,m_sTopSprite[5].position.y);
    if(m_sTopSprite[6].position.x < -55)
        m_sTopSprite[6].position = ccp(m_sTopSprite[5].position.x+45,m_sTopSprite[6].position.y);
    if(m_sTopSprite[7].position.x < -55)
        m_sTopSprite[7].position = ccp(m_sTopSprite[6].position.x+45,m_sTopSprite[7].position.y);
    if(m_sTopSprite[8].position.x < -55)
        m_sTopSprite[8].position = ccp(m_sTopSprite[7].position.x+45,m_sTopSprite[8].position.y);
    
    
    if(m_sTopSprite[9].position.x < -55)
        m_sTopSprite[9].position = ccp(m_sTopSprite[8].position.x+45,m_sTopSprite[0].position.y);
    if(m_sTopSprite[10].position.x < -55)
        m_sTopSprite[10].position = ccp(m_sTopSprite[9].position.x+45,m_sTopSprite[1].position.y);
    if(m_sTopSprite[11].position.x < -55)
        m_sTopSprite[11].position = ccp(m_sTopSprite[10].position.x+45,m_sTopSprite[2].position.y);
    if(m_sTopSprite[12].position.x < -55)
        m_sTopSprite[12].position = ccp(m_sTopSprite[11].position.x+45,m_sTopSprite[3].position.y);
    if(m_sTopSprite[13].position.x < -55)
        m_sTopSprite[13].position = ccp(m_sTopSprite[12].position.x+45,m_sTopSprite[4].position.y);
    if(m_sTopSprite[14].position.x < -55)
        m_sTopSprite[14].position = ccp(m_sTopSprite[13].position.x+45,m_sTopSprite[5].position.y);
    if(m_sTopSprite[15].position.x < -55)
        m_sTopSprite[15].position = ccp(m_sTopSprite[14].position.x+45,m_sTopSprite[6].position.y);
    if(m_sTopSprite[16].position.x < -55)
        m_sTopSprite[16].position = ccp(m_sTopSprite[15].position.x+45,m_sTopSprite[7].position.y);
    if(m_sTopSprite[17].position.x < -55)
        m_sTopSprite[17].position = ccp(m_sTopSprite[16].position.x+45,m_sTopSprite[8].position.y);

    
//    if(m_sGroundSprite[0].position.x < -154 * G_SCALEX / g_fScaleR){
//        m_sGroundSprite[0].position=ccp(413,400);
//        
////        m_sGroundSprite[0].position=ccp(m_sGroundSprite[0].position.x+20,m_sGroundSprite[0].position.y);
//        
//        m_sGroundSprite[0].position = ccp(getX(50), getY(456));
//        m_sGroundSprite[1].position = ccp(getX(150), getY(456));
//    }
}
@end
