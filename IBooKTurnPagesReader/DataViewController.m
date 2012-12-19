//
//  DataViewController.m
//  IBooKTurnPagesReader
//
//  Created by  on 11-11-8.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "DataViewController.h"

@implementation DataViewController

@synthesize dataLabel = _dataLabel;
@synthesize dataObject = _dataObject;
@synthesize pageIndex = _pageIndex;
@synthesize pdfView = _pdfView;

extern int iOrientation;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // webview load pdf
    //[self loadDocument:@"test" inView:self.pdfView];
     NSLog(@"===========%d", self.pageIndex);
    //竖屏
    CGRect frame;
    //横屏
    if (iOrientation == 0) {
        frame = CGRectMake(20, 49, 650, 850);
    } else {
        frame = CGRectMake(30, 49, 400, 600);
    }
    _pdfView = [[PdfView alloc] initWithFrame:frame];
    [_pdfView initPDF:self.pageIndex];
    _pdfView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_pdfView];

//    [_pdfView release];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [[NSString alloc] initWithFormat:@"%d/%d", self.pageIndex, [_pdfView getNumberOfPages]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
