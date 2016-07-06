//
//  RDPBeautifulLabel.m
//  RDPBeautifulLabel
//
//  Created by Allan Liu on 16/7/6.
//  Copyright © 2016年 GO. All rights reserved.
//

#import "RDPBeautifulLabel.h"

@implementation RDPBeautifulLabel


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (UIFont *)font {
    if (!_font) {
        _font = [UIFont systemFontOfSize:16];
    }
    return _font;
}

- (UIColor *)textColor {
    if (!_textColor) {
        _textColor = [UIColor blackColor];
    }
    return _textColor;
}

- (void)setText:(NSString *)text {
    _text = text;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
//    CGFloat lineHeight = self.font.lineHeight;
//    NSLog(@"lineHeight:%@", @(lineHeight));
//    CGFloat pointSize = self.font.pointSize;
//    NSLog(@"pointSize:%@", @(pointSize));
    
    //NSDate *date = [NSDate date];
    
    if (_text.length == 0) {
        return;
    }
    
    NSInteger length = _text.length;
    NSInteger cCount = 0;
    BOOL notAllChinese = NO;
    for(NSInteger i = 0; i < length; i++){
        NSInteger a = [_text characterAtIndex:i];
        if(a >= 0x4e00 && a <= 0x9fff) {
            cCount++;
        } else {
            notAllChinese = YES;
        }
    }
    
    if (notAllChinese) {
        NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
        [attribute setObject:self.font forKey:NSFontAttributeName];
        [attribute setObject:self.textColor forKey:NSForegroundColorAttributeName];
        [_text drawInRect:rect withAttributes:attribute];
    } else {
        NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
        [attribute setObject:self.font forKey:NSFontAttributeName];
        [attribute setObject:self.textColor forKey:NSForegroundColorAttributeName];
        CGRect stringRect = [_text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.font.lineHeight) options:(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin) attributes:attribute context:NULL];
        //NSLog(@"pointSize:%@", [NSValue valueWithCGRect:stringRect]);
        CGFloat width = stringRect.size.width;
        CGFloat onceFontWidth = width/cCount;
        CGFloat distanceWidthBetweentFont = (self.frame.size.width - width)/(cCount - 1);
        NSString *tempStr = nil;
        CGFloat left = 0;
        for(NSInteger i = 0; i < length; i++){
            tempStr = [_text substringWithRange:NSMakeRange(i, 1)];
            if (tempStr) {
                [tempStr drawInRect:CGRectMake(left, 0, onceFontWidth, self.font.lineHeight) withAttributes:attribute];
                left += onceFontWidth + distanceWidthBetweentFont;
            }
        }
    }
    
    //NSLog(@"use time:%@", @([[NSDate date] timeIntervalSinceDate:date]));
}

@end
