//
//  cameraSecondViewController.m
//  camera
//
//  Created by David Shapiro on 4/14/12.
//  Copyright (c) 2012 JPMC. All rights reserved.
//

#import "cameraSecondViewController.h"
#import "photosLibraryViewController.h"

@interface cameraSecondViewController ()

-(void)buttonPressed;


@end

@implementation cameraSecondViewController

- (id)init
{
    if (self = [super init]) {
        self.title = NSLocalizedString(@"Info", @"Info");
        self.tabBarItem.image = [UIImage imageNamed:@"star"];
        //[self.tabBarItem setTitlePositionAdjustment: UIOffsetMake(0, -5.0)];
        
        [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleBlackOpaque];

        
        self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        self.view.backgroundColor = [UIColor blackColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 40)];
        label.text = @"Thank You";
        label.textColor = [UIColor orangeColor];
        label.backgroundColor = [UIColor blackColor];
        
        [self.view addSubview:label];
        
        UITextView *text = [[UITextView alloc] initWithFrame:CGRectMake(20, 35, 300, 445)];
        text.text = @"Thank you for trying out my first app store submitted application. It may not be much in the way of functionality but i have had a fun time learning objective-c, creating this app and using it to take pictures of my friends.\n\nThe background is a compilation of some of the pictures i have taken. If you would like to share some of these images post them to twitter using #nobispictures\n\nThank you to Olivia Ifergan for coming up with this idea. Look for more fun images to come in the future.\n\nDave Shapiro developed this app\n\nnobis : there'll be no one as happy as us.\n";

        
        text.backgroundColor = [UIColor blackColor];
        text.textColor = [UIColor whiteColor];
        text.font = [UIFont fontWithName:@"Arial" size:13];
        text.editable = false;
        
        [self.view addSubview:text];
        
        adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
        CGRect adFrame = adView.frame;
        adFrame.origin.y = 410;
        adView.frame = adFrame;
        adView.requiredContentSizeIdentifiers = adView.requiredContentSizeIdentifiers = [NSSet setWithObjects:ADBannerContentSizeIdentifierPortrait,ADBannerContentSizeIdentifierLandscape,nil];
        adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
        [self.view addSubview:adView];
        adView.delegate=self;
        self.bannerIsVisible=NO;
        
    }

    
    
    return self;
}

- (void)buttonPressed
{
    photosLibraryViewController *photos = [[photosLibraryViewController alloc] init];
    [self presentModalViewController:photos animated:YES];	
    
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
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return !UIInterfaceOrientationIsLandscape(interfaceOrientation);
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
    }
}


@end
