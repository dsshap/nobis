//
//  photosLibraryViewController.m
//  camera
//
//  Created by David Shapiro on 4/21/12.
//  Copyright (c) 2012 JPMC. All rights reserved.
//

#import "photosLibraryViewController.h"

@interface photosLibraryViewController ()

@end

@implementation photosLibraryViewController

- (id)init
{
    self = [super init];
    
    if ( self ) {
        
        imagePicker = [[UIImagePickerController alloc] init];
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self.view addSubview:imagePicker.view];
    
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
