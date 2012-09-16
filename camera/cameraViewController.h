//
//  cameraViewController.h
//  camera
//
//  Created by David Shapiro on 4/15/12.
//  Copyright (c) 2012 JPMC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface cameraViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    
    UIImagePickerController *imagePicker;
}


@end
