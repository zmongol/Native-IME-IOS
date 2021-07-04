//
//  CPPSuggestions_Wrapper.m
//  ZMongolIMEIOS
//
//  Created by Nataliia Hudzeliak on 11.04.2021.
//

#import "CPPSuggestions_Wrapper.h"
#import "CPPSuggestions.hpp"
#include <algorithm>
#include <string>
#include <vector>

@implementation CPPSuggestions_Wrapper

- (NSArray *) excuteCPPEx: (NSString*) text {
    NSArray *arr;
    
    ZCode zcode = ZCode();
    __block std::vector<wstring> vectorList;
    
    vectorList.reserve([arr count]);
    [arr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        vectorList.push_back(NSStringToStringW(obj));
    }];
    
    zcode.ExcuteEx(NSStringToStringW(text), vectorList);
    std::vector<std::wstring> strings = vectorList;
    id nsstrings = [NSMutableArray new];
    for (int i = 0; i < vectorList.size() ; i++)
    {
        wstring wstring = vectorList[i];
        NSString *string = StringWToNSString(wstring);
        [nsstrings addObject:string];
    }
    return nsstrings;
}

- (NSArray *) excuteCPPPhrase: (NSString*) text {
    NSArray *arr;
    
    ZCode zcode = ZCode();
    __block std::vector<wstring> vectorList;
    
    vectorList.reserve([arr count]);
    [arr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        vectorList.push_back(NSStringToStringW(obj));
    }];
    
    zcode.ExeutePhrase(NSStringToStringW(text), vectorList);
    std::vector<std::wstring> strings = vectorList;
    id nsstrings = [NSMutableArray new];
    for (int i = 0; i < vectorList.size() ; i++)
    {
        wstring wstring = vectorList[i];
        NSString *string = StringWToNSString(wstring);
        [nsstrings addObject:string];
    }
    return nsstrings;
}

std::wstring NSStringToStringW ( NSString* Str )
{
    NSStringEncoding pEncode    =   CFStringConvertEncodingToNSStringEncoding ( kCFStringEncodingUTF32LE );
    NSData*pSData = [ Str dataUsingEncoding : pEncode ];
    
    return std::wstring ( (wchar_t*) [ pSData bytes ], [ pSData length] / sizeof ( wchar_t ) );
}

NSString* StringWToNSString ( const std::wstring& Str )
{
    NSString* pString = [ [ NSString alloc ]
                         initWithBytes : (char*)Str.data()
                           length : Str.size() * sizeof(wchar_t)
                         encoding : CFStringConvertEncodingToNSStringEncoding ( kCFStringEncodingUTF32LE ) ];
        return pString;
}

@end
