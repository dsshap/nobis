//
//  cameraViewController.m
//  camera
//
//  Created by David Shapiro on 4/15/12.
//  Copyright (c) 2012 JPMC. All rights reserved.
//

#import "cameraViewController.h"
#import "CameraCustOverlayView.h"

@interface cameraViewController ()

@end

@implementation cameraViewController


//#define SCREEN_WIDTH  320 
//#define SCREEN_HEIGTH 480

#define CAMERA_TRANSFORM_X 1
//#define CAMERA_TRANSFORM_Y 1.12412 //use this is for iOS 3.x
#define CAMERA_TRANSFORM_Y 1 // 1.24299 // use this is for iOS 4.x

- (id)init{
    
    self = [super init];
    
    if ( self ) {
        
        [[self view] setFrame:CGRectMake(0.0, 0.0, 320.0, 480.0)]; 
                
        imagePicker = [[UIImagePickerController alloc] init];
        
        imagePicker.view.frame = self.view.bounds;
    
        // Set source to the camera
        imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
        
        imagePicker.delegate = self;
        
        // Allow editing of image ?
        imagePicker.allowsEditing = NO;
        
        imagePicker.wantsFullScreenLayout = YES;
        
        //imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        
        //imagePicker.showsCameraControls = NO;
        
        CameraCustOverlayView *overlay = [[CameraCustOverlayView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        
        imagePicker.cameraOverlayView = overlay;
        
        //imagePicker.cameraViewTransform = CGAffineTransformMakeScale(1.0, 1.03);
        
        imagePicker.cameraViewTransform = CGAffineTransformScale(imagePicker.cameraViewTransform, CAMERA_TRANSFORM_X, CAMERA_TRANSFORM_Y);
        
        [self.view addSubview:imagePicker.view];
        
    }
    return self;
}

- (void) alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
	// After saving iamge, dismiss camera
	[self dismissModalViewControllerAnimated:YES];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    UIAlertView *alert;
    
	// Unable to save the image  
    if (error){
        alert = [[UIAlertView alloc] initWithTitle:@"Error" 
                                           message:@"Unable to save image to Photo Album." 
                                          delegate:self cancelButtonTitle:@"Ok" 
                                 otherButtonTitles:nil];
    }else{ // All is well
        alert = [[UIAlertView alloc] initWithTitle:@"Congrats!" 
                                           message:@"Image saved to Photo Album." 
                                          delegate:self cancelButtonTitle:@"Ok" 
                                 otherButtonTitles:nil];
    }
    
    
    [alert show];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    NSLog(@"which camera %u", picker.cameraDevice);
	// Access the uncropped image from info dictionary
	UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    UIImage *newimage = nil;
    
    if(0 == picker.cameraDevice){
        newimage = [self mergeImage:image withImage:[UIImage imageNamed:@"mustacheRear.png"] offset:155];
    }else{
        newimage = [self mergeImage:image withImage:[UIImage imageNamed:@"mustacheFront.png"] offset:30]; 
    }

	// Save image
    UIImageWriteToSavedPhotosAlbum(newimage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	[self dismissModalViewControllerAnimated:YES];
}

- (UIImage*)mergeImage:(UIImage*)first withImage:(UIImage*)second offset:(int)offset
{
    //    // get size of the first image
    //    CGImageRef firstImageRef = first.CGImage;
    //    CGFloat firstWidth = CGImageGetWidth(firstImageRef);
    //    CGFloat firstHeight = CGImageGetHeight(firstImageRef);
    //    
    //    // get size of the second image
    //    CGImageRef secondImageRef = second.CGImage;
    //    CGFloat secondWidth = CGImageGetWidth(secondImageRef);
    //    CGFloat secondHeight = CGImageGetHeight(secondImageRef);
    //    
    //    //NSLog(@"sizes: width:%f height:%f",first.size.width, first.size.height);
    //    
    //    // build merged size
    //    CGSize mergedSize = CGSizeMake(MAX(firstWidth, secondWidth), MAX(firstHeight, secondHeight));
    
    //CGSize mergedSize = CGSizeMake(MAX(first.size.width, second.size.width), MAX(first.size.height, second.size.height));
    
    // capture image context ref
    UIGraphicsBeginImageContext(first.size);
    
    NSLog(@"first sizes: width:%f height:%f",first.size.width, first.size.height);
    NSLog(@"second sizes: width:%f height:%f",second.size.width, second.size.height);
    
    
    //Draw images onto the context
    [first drawInRect:CGRectMake(0, 0, first.size.width, first.size.height)];
    [second drawInRect:CGRectMake(0, offset, second.size.width, second.size.height)]; 
    
    // assign context to new UIImage
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    
    // end context
    UIGraphicsEndImageContext();
    
    return newImage;
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
