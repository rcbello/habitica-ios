//
//  HRPGApprevNumberLabel.m
//  Habitica
//
//  Created by Phillip Thelen on 15/06/15.
//  Copyright © 2017 HabitRPG Inc. All rights reserved.
//

#import "HRPGAbbrevNumberLabel.h"
#import "Habitica-Swift.h"

@implementation HRPGAbbrevNumberLabel

- (void)setText:(NSString *)text {
    double value = [text doubleValue];
    int counter = 0;
    while (value >= 1000) {
        counter++;
        value = value / 1000;
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.roundingIncrement = @0.01;
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    text = [NSString stringWithFormat:@"%@%@", [formatter stringFromNumber:@(value)],
                                      [self abbreviationForCounter:counter]];
    super.text = text;
}

- (NSString *)abbreviationForCounter:(int)counter {
    switch (counter) {
        case 1:
            return @"k";
        case 2:
            return @"m";
        case 3:
            return @"b";
        case 4:
            return @"t";
        default:
            return @"";
    }
}

@end
