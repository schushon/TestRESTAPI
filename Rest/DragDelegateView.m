//
//  EZPDFDragDelegateView.m
//  ezPDF Player
//
//  Created by puttana on 2016. 2. 17..
//  Copyright © 2016년 Unidocs. All rights reserved.
//

#import "EZPDFDragDelegateView.h"

@implementation EZPDFDragDelegateView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    [self.delegateController touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved");
    [self.delegateController touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded");
    [self.delegateController touchesEnded:touches withEvent:event];
}

@end
