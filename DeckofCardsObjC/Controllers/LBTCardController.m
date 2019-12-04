//
//  LBTCardController.m
//  DeckofCardsObjC
//
//  Created by tyson ericksen on 12/3/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import "LBTCardController.h"
#import "LBTCard.h"

static NSString *const baseURLAsString = @"https://deckofcardsapi.com/api/deck/new/draw";

@implementation LBTCardController

- (void)drawNewCard:(NSInteger)numberOfCards completion:(void (^)(NSArray<LBTCard *> * _Nonnull, NSError * _Nonnull))completion
{
    NSString *cardCount = [@(numberOfCards) stringValue];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURLAsString];
    
    NSURLQueryItem *count = [NSURLQueryItem queryItemWithName:@"count" value:@"1"];
    
    urlComponents.queryItems = @[count];
    NSURL *requestURL = urlComponents.URL;
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
          if (error)
          {
              NSLog(@"%@", error);
              completion([NSArray new], error);
              return;
          }
          if (response)
          {
              NSLog(@"%@", response);
          }
          if (data)
          {
              NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
              
              if (!topLevelDictionary)
              {
                  NSLog(@"%@", error);
                  completion([NSArray new], error);
                  return;
              }
              NSArray *cardArray = topLevelDictionary[@"card"];
              
              NSMutableArray *cardPlaceHolder = [NSMutableArray array];
              
              for (NSDictionary *cardDictionary in cardArray)
              {
                  LBTCard *card = [[LBTCard alloc]initWithDictionary:cardDictionary];
                  
                  [cardPlaceHolder addObject: card];
              }
              completion(cardPlaceHolder, error);
          }
      }] resume];
}

- (void)fetchCardImage:(id)LBTCard
{
    NSURL *imageURL = [NSURL URLWithString: card.image];
    
    [[NSURLSession sharedSession] dataTaskWithURL: imageURL completionHandler:^(NSData * data, NSURLResponse * response, NSError * error)
    {
    

    if (error)
    {
        NSLog(@"error", error);
        completion(error, nil);
        return;
    }
    if (response)
    {
        NSLog(@"response", response);
    }
    
    
}] resume;
}
@end
