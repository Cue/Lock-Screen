//
//  LCYLockDigitView.m
//  LockScreen
//
//  Created by Krishna Kotecha on 28/11/2010.
//  Copyright 2010 Logic Colony Ltd. All rights reserved.
//

#import "LCYLockDigitView.h"

const CGFloat kDigitViewWidth = 80.0f;
const CGFloat kDigitViewHeight = 80.0f;

@implementation LCYLockDigitView

@synthesize isFilled = isFilled_;


- (CGSize) sizeThatFits: (CGSize) size;
{
	return CGSizeMake(kDigitViewWidth, kDigitViewHeight);
}

- (void) drawRect: (CGRect) dirtyRect
{	
	// Drawing code generated by Opacity.
	
	if (!isFilled_)
	{
		CGRect imageBounds = CGRectMake(0.0f, 0.0f, kDigitViewWidth, kDigitViewHeight);
		CGRect bounds = [self bounds];
		CGContextRef context = UIGraphicsGetCurrentContext();
		UIColor *color;
		CGFloat resolution;
		CGFloat alignStroke;
		CGFloat stroke;
		CGMutablePathRef path;
		CGRect drawRect;
		resolution = 0.5f * (bounds.size.width / imageBounds.size.width + bounds.size.height / imageBounds.size.height);
		
		CGContextSaveGState(context);
		CGContextTranslateCTM(context, bounds.origin.x, bounds.origin.y);
		CGContextScaleCTM(context, (bounds.size.width / imageBounds.size.width), (bounds.size.height / imageBounds.size.height));
		
		// Setup for Shadow Effect
		color = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f];
		CGContextSaveGState(context);
		CGContextSetShadowWithColor(context, CGSizeMake(0.0f * resolution, 3.0f * resolution), 3.0f * resolution, [color CGColor]);
		CGContextBeginTransparencyLayer(context, NULL);
		
		// Layer 1
		
		stroke = 1.0f;
		stroke *= resolution;
		if (stroke < 1.0f) {
			stroke = ceilf(stroke);
		} else {
			stroke = roundf(stroke);
		}
		stroke /= resolution;
		alignStroke = fmodf(0.5f * stroke * resolution, 1.0f);
		path = CGPathCreateMutable();
		drawRect = CGRectMake(6.5f, 8.5f, 66.0f, 64.0f);
		drawRect.origin.x = (roundf(resolution * drawRect.origin.x + alignStroke) - alignStroke) / resolution;
		drawRect.origin.y = (roundf(resolution * drawRect.origin.y + alignStroke) - alignStroke) / resolution;
		drawRect.size.width = roundf(resolution * drawRect.size.width) / resolution;
		drawRect.size.height = roundf(resolution * drawRect.size.height) / resolution;
		CGPathAddRect(path, NULL, drawRect);
		color = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f];
		[color setFill];
		CGContextAddPath(context, path);
		CGContextFillPath(context);
		color = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
		[color setStroke];
		CGContextSetLineWidth(context, stroke);
		CGContextSetLineCap(context, kCGLineCapSquare);
		CGContextAddPath(context, path);
		CGContextStrokePath(context);
		CGPathRelease(path);
		
		// Shadow Effect
		CGContextEndTransparencyLayer(context);
		CGContextRestoreGState(context);
		
		CGContextRestoreGState(context);
	}
	else 
	{
		CGRect imageBounds = CGRectMake(0.0f, 0.0f, kDigitViewWidth, kDigitViewHeight);
		CGRect bounds = [self bounds];
		CGContextRef context = UIGraphicsGetCurrentContext();
		UIColor *color;
		CGFloat resolution;
		CGFloat alignStroke;
		CGFloat stroke;
		CGMutablePathRef path;
		CGRect drawRect;
		resolution = 0.5f * (bounds.size.width / imageBounds.size.width + bounds.size.height / imageBounds.size.height);
		
		CGContextSaveGState(context);
		CGContextTranslateCTM(context, bounds.origin.x, bounds.origin.y);
		CGContextScaleCTM(context, (bounds.size.width / imageBounds.size.width), (bounds.size.height / imageBounds.size.height));
		
		// Setup for Shadow Effect
		color = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f];
		CGContextSaveGState(context);
		CGContextSetShadowWithColor(context, CGSizeMake(0.0f * resolution, 3.0f * resolution), 3.0f * resolution, [color CGColor]);
		CGContextBeginTransparencyLayer(context, NULL);
		
		// Layer 1
		
		stroke = 1.0f;
		stroke *= resolution;
		if (stroke < 1.0f) {
			stroke = ceilf(stroke);
		} else {
			stroke = roundf(stroke);
		}
		stroke /= resolution;
		alignStroke = fmodf(0.5f * stroke * resolution, 1.0f);
		path = CGPathCreateMutable();
		drawRect = CGRectMake(6.5f, 8.5f, 66.0f, 64.0f);
		drawRect.origin.x = (roundf(resolution * drawRect.origin.x + alignStroke) - alignStroke) / resolution;
		drawRect.origin.y = (roundf(resolution * drawRect.origin.y + alignStroke) - alignStroke) / resolution;
		drawRect.size.width = roundf(resolution * drawRect.size.width) / resolution;
		drawRect.size.height = roundf(resolution * drawRect.size.height) / resolution;
		CGPathAddRect(path, NULL, drawRect);
		color = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f];
		[color setFill];
		CGContextAddPath(context, path);
		CGContextFillPath(context);
		color = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
		[color setStroke];
		CGContextSetLineWidth(context, stroke);
		CGContextSetLineCap(context, kCGLineCapSquare);
		CGContextAddPath(context, path);
		CGContextStrokePath(context);
		CGPathRelease(path);
		
		stroke = 1.0f;
		stroke *= resolution;
		if (stroke < 1.0f) {
			stroke = ceilf(stroke);
		} else {
			stroke = roundf(stroke);
		}
		stroke /= resolution;
		alignStroke = fmodf(0.5f * stroke * resolution, 1.0f);
		path = CGPathCreateMutable();
		drawRect = CGRectMake(29.5f, 30.564f, 20.5f, 20.936f);
		drawRect.origin.x = (roundf(resolution * drawRect.origin.x + alignStroke) - alignStroke) / resolution;
		drawRect.origin.y = (roundf(resolution * drawRect.origin.y + alignStroke) - alignStroke) / resolution;
		drawRect.size.width = roundf(resolution * drawRect.size.width) / resolution;
		drawRect.size.height = roundf(resolution * drawRect.size.height) / resolution;
		CGPathAddEllipseInRect(path, NULL, drawRect);
		color = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
		[color setFill];
		CGContextAddPath(context, path);
		CGContextFillPath(context);
		color = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
		[color setStroke];
		CGContextAddPath(context, path);
		CGContextStrokePath(context);
		CGPathRelease(path);
		
		// Shadow Effect
		CGContextEndTransparencyLayer(context);
		CGContextRestoreGState(context);
		
		CGContextRestoreGState(context);		
	}
}



@end