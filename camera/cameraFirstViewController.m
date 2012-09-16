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
        
        self.title = NSLocalizedString(@"Camera", @"Camera");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];

        self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        self.view.backgroundColor = [UIColor grayColor];
        
        // Button to activate camera
        button = [[UIButton alloc] initWithFrame:CGRectMake(80, 55, 162, 53)];    
        [button setBackgroundImage:[UIImage imageNamed:@"Camera.png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents: UIControlEventTouchUpInside];      
        [self.view addSubview:button];
    }

    return self;
}

- (void)buttonPressed:(UIButton *)button
{
    cameraViewController *camera = [[cameraViewController alloc] init];
    camera.wantsFullScreenLayout = YES;
    [self presentModalViewController:camera animated:YES];	
    
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
