//
//  PokemonController.m
//  PokemonHybrid
//
//  Created by Daniel Jin on 10/10/17.
//  Copyright © 2017 Daniel Jin. All rights reserved.
//

#import "PokemonController.h"
#import "Pokemon.h"
#import "PokemonHybrid-Swift.h"

static NSString * const baseURLString = @"https://pokeapi.co/api/v2/pokemon/";

@implementation PokemonController

+ (PokemonController *)sharedController
{
    static PokemonController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [PokemonController new];
    });
    return sharedController;
}


- (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(Pokemon * ))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    [NetworkController performRequestFor:searchURL httpMethod:@"GET" urlParameters:nil body:nil completion:^(NSData *data, NSError *error) {
        
        // We can get back 2 things, error || data
        if (error) {
            NSLog(@"Error getting Pokemon from search term: %@", (error.localizedDescription));
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error getting returned data from task");
            completion(nil);
            return;
        }
        
        // Getting the jsonDictionary and serializing a Pokemon
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Could not serialize JSON Data into a NSDictionary %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        Pokemon *pokemon = [[Pokemon alloc] initWithDictionary:jsonDictionary];
        completion(pokemon);
        
    }];
}

@end
