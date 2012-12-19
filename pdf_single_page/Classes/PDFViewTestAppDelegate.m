//
//  PDFViewTestAppDelegate.m
//  PDFViewTest
//
//  Created by Evan Lynn on 10-6-20.
//  Copyright Tera Age 2010. All rights reserved.
//

#import "PDFViewTestAppDelegate.h"
#import "PDFView.h"

@implementation PDFViewTestAppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	//		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	//		NSString *documentPath = [paths objectAtIndex:0];
	NSString *filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"metro_geo.pdf"];
	
	PDFView *pdfView = [[PDFView alloc] initWithFilePath:filePath];
	scrollView.contentSize = pdfView.frame.size;
	[scrollView addSubview:pdfView];
	[pdfView release];
	
    [window makeKeyAndVisible];
	
	return YES;
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
