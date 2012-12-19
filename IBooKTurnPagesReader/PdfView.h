//
//  PdfView.h
//  IBooKTurnPagesReader
//
//  Created by  on 11-11-9.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PdfView : UIView { 
    CGPDFDocumentRef pdf;
    int pIndex;
}

@property int pIndex;
-(void)drawInContext:(CGContextRef)context;
-(void)initPDF:(NSInteger)pageIndex;
-(NSInteger) getNumberOfPages;

@end