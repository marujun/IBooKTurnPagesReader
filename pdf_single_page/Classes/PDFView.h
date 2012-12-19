//
//  PDFView.h
//  PDFViewTest
//
//  Created by Evan Lynn on 10-6-20.
//  Copyright 2010 Tera Age. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PDFView : UIView {
	CGPDFDocumentRef pdfRef;
	CGPDFPageRef page;
}

- (id)initWithFilePath:(NSString *)filePath;
-(void)reloadView;
- (CGPDFDocumentRef)createPDFFromExistFile:(NSString *)aFilePath;

@end
