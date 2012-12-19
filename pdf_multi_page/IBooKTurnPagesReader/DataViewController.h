//
//  DataViewController.h
//  IBooKTurnPagesReader
//
//  Created by  on 11-11-8.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdfView.h"

@interface DataViewController : UIViewController
{
    PdfView *pdfView;
}

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;
@property (strong, nonatomic) IBOutlet PdfView *pdfView;
@property NSInteger pageIndex;


@end
