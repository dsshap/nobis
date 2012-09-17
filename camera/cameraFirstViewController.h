//
//  cameraFirstViewController.h
//  camera
//
//  Created by David Shapiro on 4/14/12.
//  Copyright (c) 2012 JPMC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface cameraFirstViewController : UIViewController <UINavigationControllerDelegate> {
    ADBannerView *adView;
    BOOL bannerIsVisible;
    UIButton *button;
    
}

@property (nonatomic,assign) BOOL bannerIsVisible;

@end
