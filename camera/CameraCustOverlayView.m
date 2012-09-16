//
//  cameraOverlay.m
//  camera
//
//  Created by David Shapiro on 4/14/12.
//  Copyright (c) 2012 JPMC. All rights reserved.
//

#import "CameraCustOverlayView.h"

@implementation CameraCustOverlayView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // Clear the background of the overlay:
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        
        // Load the image to show in the overlay:
        UIImage *overlayGraphic = [UIImage imageNamed:@"mustache.png"];
        UIImageView *overlayGraphicView = [[UIImageView alloc] initWithImage:overlayGraphic];
        NSLog(@"screen size:%f, %f", [[UIScreen mainScreen] applicationFrame].size.width, [[UIScreen mainScreen] applicationFrame].size.height);
        overlayGraphicView.frame = frame;
        [self addSubview:overlayGraphicView];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
