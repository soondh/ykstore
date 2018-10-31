//
//  UnderLineLabel.m
//  GamePlatform
//
//  Created by luomz on 2017/10/17.
//  Copyright © 2017年 luomj. All rights reserved.
//

#import "UnderLineLabel.h"

@implementation UnderLineLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)drawRect:(CGRect)rect
{
    if ( self.paragraphstyle) {
        if (self.attributedText) {
            CGFloat textHeight = [self.attributedText boundingRectWithSize:self.frame.size options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
            
            CGFloat star_x = (self.frame.size.height - textHeight)/2;
            
            CGContextRef ctx = UIGraphicsGetCurrentContext();
            float lineHeight = self.font.lineHeight + self.paragraphstyle.lineSpacing;
            
            // Get the fonts color.
            float labelWidth = [self.attributedText boundingRectWithSize:self.frame.size options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.width;
            
            const CGFloat * colors = CGColorGetComponents(self.lineColor.CGColor);
            float labelHeight = [self sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)].height;
            
            NSInteger count = (labelHeight + self.font.lineHeight) / lineHeight;
            // Sets the color to draw the line
            CGContextSetRGBStrokeColor(ctx, colors[0], colors[1], colors[2], 1.0f); // Format : RGBA
            
            // Line Width : make thinner or bigger if you want
            CGContextSetLineWidth(ctx, 0.5f);
            CGFloat lengths[] = {4,4};
            CGContextSetLineDash(ctx, 0, lengths, 2);
            
            for (int i = 0; i <= count + 1; i++) {
                // Calculate the starting point (left) and target (right)
                CGPoint l1 = CGPointMake(0,
                                         i * ( lineHeight) - self.paragraphstyle.lineSpacing/4 + star_x);
                CGPoint l2 = CGPointMake(0,
                                         i * ( lineHeight) - self.paragraphstyle.lineSpacing/4 + star_x);
                
                
                CGPoint r1 = CGPointMake(labelWidth,
                                         i * ( lineHeight) - self.paragraphstyle.lineSpacing/4 + star_x);
                
                CGPoint r2 = CGPointMake(labelWidth,
                                         i * ( lineHeight) - self.paragraphstyle.lineSpacing/4 + star_x) ;
                // Add Move Command to point the draw cursor to the starting point
                CGContextMoveToPoint(ctx, l1.x, l1.y);
                
                // Add Command to draw a Line
                CGContextAddLineToPoint(ctx, r1.x, r1.y);
                
                // Add Move Command to point the draw cursor to the starting point
                CGContextMoveToPoint(ctx, l2.x, l2.y);
                
                // Add Command to draw a Line
                CGContextAddLineToPoint(ctx, r2.x, r2.y);
                
                // Actually draw the line.
                CGContextStrokePath(ctx);
            }

        }
       
   
    }
    // should be nothing, but who knows...
    [super drawRect:rect];

} 
@end
