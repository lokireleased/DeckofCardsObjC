//
//  LBTCard.m
//  DeckofCardsObjC
//
//  Created by tyson ericksen on 12/3/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import "LBTCard.h"

@implementation LBTCard

- (instancetype)initWithType:(NSString *)type suit:(NSString *)suit cardImage:(NSString *)cardImage
//- (instancetype)initWithType:(NSString *)type suit:(NSString *)suit
{
    self = [super init];
    if (self) {
        _type = type;
        _suit = suit;
        _cardImage = cardImage;
    }
    return self;
}

@end

@implementation LBTCard (JSONCovertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *type = dictionary[@"value"];
    NSString *suit = dictionary[@"suit"];
    NSString *image = dictionary[@"image"];
    
    return [self initWithType:type suit:suit cardImage:image];
}

@end
