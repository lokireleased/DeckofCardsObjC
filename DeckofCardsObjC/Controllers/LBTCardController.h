//
//  LBTCardController.h
//  DeckofCardsObjC
//
//  Created by tyson ericksen on 12/3/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBTCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface LBTCardController : NSObject

+(LBTCardController *) shared;

//func drawNewCard(int, completion()) {}
-(void)drawNewCard: (NSInteger)numberOfCards completion:(void(^) (NSArray<LBTCard *> *cards, NSError *error))completion;

-(void)fetchCardImage: LBTCard    ;

@end

NS_ASSUME_NONNULL_END
