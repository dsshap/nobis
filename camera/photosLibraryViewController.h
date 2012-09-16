//
//  photosLibraryViewController.h
//  camera
//
//  Created by David Shapiro on 4/21/12.
//  Copyright (c) 2012 JPMC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface photosLibraryViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    
    UIImagePickerController *imagePicker;
}
@end
