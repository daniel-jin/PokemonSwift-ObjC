//
//  Pokemon.h
//  PokemonHybrid
//
//  Created by Daniel Jin on 10/10/17.
//  Copyright © 2017 Daniel Jin. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface Pokemon : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;
// The copy operation makes a copy of an object and then changes the pointer to refer to its copy.

-(instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities NS_DESIGNATED_INITIALIZER;
// NS_DESIGNATED_INITIALIZER helps the compiler out
// The highest amount of arguments will take the Designated INIT

@end

@interface Pokemon (JSONConvertible)
-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;
@end

NS_ASSUME_NONNULL_END
