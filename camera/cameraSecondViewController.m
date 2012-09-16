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
        self.title = NSLocalizedString(@"Images", @"Images");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        
        self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        self.view.backgroundColor = [UIColor grayColor];
        
        //photosLibraryViewController *photos = [[photosLibraryViewController alloc] init];
        
//        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
//        
//        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//        
//        [self.view addSubview:imagePicker.view];
        
        
        // Button to activate camera
//        button = [[UIButton alloc] initWithFrame:CGRectMake(80, 55, 162, 53)];    
//        [button setBackgroundImage:[UIImage imageNamed:@"Camera.png"] forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(buttonPressed:) forControlEvents: UIControlEventTouchUpInside];      
//        [self.view addSubview:button];
        
        
        
        
        
    }

    
    
    return self;
}

- (void)buttonPressed
{
    photosLibraryViewController *photos = [[photosLibraryViewController alloc] init];
    [self presentModalViewController:photos animated:YES];	
    
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
