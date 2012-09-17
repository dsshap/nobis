//
//  cameraFirstViewController.m
//  camera
//
//  Created by David Shapiro on 4/14/12.
//  Copyright (c) 2012 JPMC. All rights reserved.
//

#import "cameraFirstViewController.h"
#import "CameraCustOverlayView.h"
#import "cameraViewController.h"

@interface cameraFirstViewController ()

@end

@implementation cameraFirstViewController



- (id)init {
    
    if (self = [super init]) {
        
        self.tabBarItem.image = [UIImage imageNamed:@"camera-icon"];
        
        

        self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        self.view.backgroundColor = [UIColor blackColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 200, 60)];
        label.text = @"nobis";
        label.font = [UIFont fontWithName:@"Arial" size:22];
        label.textColor = [UIColor orangeColor];
        label.backgroundColor = [UIColor blackColor];
        
        [self.view addSubview:label];
        
        UIImageView *compilation = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"compilation-background.jpg"]];
        compilation.frame = CGRectMake(10, 47, 300, 300);
        
        [self.view addSubview:compilation];
        
        // Button to activate camera
        UIImage *buttonImage = [UIImage imageNamed:@"take_photo"];
        
        button = [[UIButton alloc] initWithFrame:CGRectMake(35, 175, 250, 45)];
        [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [button setTitle:@"take a photo" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents: UIControlEventTouchUpInside];      
        [self.view addSubview:button];
        
        adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
        CGRect adFrame = adView.frame;
        adFrame.origin.y = 410;
        adView.frame = adFrame;
        adView.requiredContentSizeIdentifiers = adView.requiredContentSizeIdentifiers = [NSSet setWithObjects:ADBannerContentSizeIdentifierPortrait,ADBannerContentSizeIdentifierLandscape,nil];
        adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
        [self.view addSubview:adView];
        adView.delegate = self;
        self.bannerIsVisible=NO;
    }

    return self;
}


- (void)viewDidLoad {

    [super viewDidLoad];
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        banner.frame = CGRectOffset(banner.frame, 0, -50);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        banner.frame = CGRectOffset(banner.frame, 0, 50);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }
    
}

- (void)buttonPressed:(UIButton *)button
{
    cameraViewController *camera = [[cameraViewController alloc] init];
    camera.wantsFullScreenLayout = YES;
    [self presentModalViewController:camera animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    adView.delegate = nil;
    adView = nil;

}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)){
        adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
        if (self.bannerIsVisible){
            CGRect adFrame;
            adFrame.origin.y = 220;
            adView.frame = adFrame;
        }else{
            CGRect adFrame;
            adFrame.origin.y = 270;
            adView.frame = adFrame;
        }
        
        [button setFrame:CGRectMake(120, 75, 250, 45)];
    }else{
        adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
        if (self.bannerIsVisible){
            CGRect adFrame;
            adFrame.origin.y = 360;
            adView.frame = adFrame;
        }else{
            CGRect adFrame;
            adFrame.origin.y = 410;
            adView.frame = adFrame;
        }
        [button setFrame:CGRectMake(40, 175, 250, 45)];
    }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return true;
}

@end
