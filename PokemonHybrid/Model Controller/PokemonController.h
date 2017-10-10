//
//  PokemonController.h
//  PokemonHybrid
//
//  Created by Daniel Jin on 10/10/17.
//  Copyright © 2017 Daniel Jin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Pokemon;

NS_ASSUME_NONNULL_BEGIN

@interface PokemonController : NSObject

- (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion: (void (^) (Pokemon *))completion;

+ (PokemonController *)sharedController;

@end

NS_ASSUME_NONNULL_END
