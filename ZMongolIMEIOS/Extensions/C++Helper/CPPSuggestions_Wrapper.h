//
//  CPPSuggestions_Wrapper.h
//  ZMongolIMEIOS
//
//  Created by Nataliia Hudzeliak on 11.04.2021.
//

#import <Foundation/Foundation.h>

@interface CPPSuggestions_Wrapper : NSObject 
- (NSArray *) excuteCPPEx: (NSString*) text;
- (NSArray *) excuteCPPPhrase: (NSString*) text;
@end
