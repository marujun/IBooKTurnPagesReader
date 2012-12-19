//
//  PDFView.m
//  PDFViewTest
//
//  Created by Evan Lynn on 10-6-20.
//  Copyright 2010 Tera Age. All rights reserved.
//

#import "PDFView.h"


@implementation PDFView

- (id)initWithFilePath:(NSString *)filePath{
	pdfRef = [self createPDFFromExistFile:filePath];
	CGPDFPageRef pdfPage = CGPDFDocumentGetPage(pdfRef, 1);
	CGRect mediaRect = CGPDFPageGetBoxRect(pdfPage, kCGPDFMediaBox);
	self = [super initWithFrame:mediaRect];
	return self;
}

- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	[[UIColor whiteColor] set];
	CGContextFillRect(context, rect);
	
	CGContextGetCTM(context);
	CGContextScaleCTM(context, 1, -1);
	CGContextTranslateCTM(context, 0, -rect.size.height);
	
	page = CGPDFDocumentGetPage(pdfRef, 1);
	
	CGRect mediaRect = CGPDFPageGetBoxRect(page, kCGPDFCropBox);
	CGContextScaleCTM(context, rect.size.width / mediaRect.size.width, rect.size.height / mediaRect.size.height);
	CGContextTranslateCTM(context, -mediaRect.origin.x, -mediaRect.origin.y);
	
	CGContextDrawPDFPage(context, page);
}

- (CGPDFDocumentRef)createPDFFromExistFile:(NSString *)aFilePath{
	CFStringRef path;
	CFURLRef url;
	CGPDFDocumentRef document;
	path = CFStringCreateWithCString(NULL, [aFilePath UTF8String], kCFStringEncodingUTF8);
	url = CFURLCreateWithFileSystemPath(NULL, path, kCFURLPOSIXPathStyle, NO);
	CFRelease(path);
	document = CGPDFDocumentCreateWithURL(url);
	CFRelease(url);
	int count = CGPDFDocumentGetNumberOfPages (document);
    if (count == 0) {
		return NULL;
    }
	return document;
}

- (void)dealloc {
    [super dealloc];
}

-(void)reloadView{
	[self setNeedsDisplay];
}


@end
