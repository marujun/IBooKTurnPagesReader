//
//  PDFViewTestAppDelegate.h
//  PDFViewTest
//
//  Created by Evan Lynn on 10-6-20.
//  Copyright Tera Age 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFViewTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UIScrollView *scrollView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;


@end

