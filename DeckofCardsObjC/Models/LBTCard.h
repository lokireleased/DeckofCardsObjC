//
//  LBTCard.h
//  DeckofCardsObjC
//
//  Created by tyson ericksen on 12/3/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LBTCard : NSObject

@property (nonatomic, readonly) NSString *type;
@property (nonatomic, readonly) NSString *suit;
@property (nonatomic, readonly) NSString *cardImage;


-(instancetype)initWithType: (NSString *)type suit: (NSString *)suit cardImage: (NSString *)cardImage;
//-(instancetype)initWithType: (NSString *)type suit: (NSString *)suit;

@end

@interface LBTCard (JSONCovertable)

-(instancetype)initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
