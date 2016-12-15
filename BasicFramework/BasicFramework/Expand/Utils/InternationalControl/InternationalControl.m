//
//  InternationalControl.m
//  CommonMacro
//
//  Created by txp on 15/11/2.
//  Copyright (c) 2015年 JiuMu. All rights reserved.
//

#import "InternationalControl.h"
//用户语言
static  NSString  *kUserLanguageKey = @"useLanguage";
static  NSString  *kAppleLanguages = @"AppleLanguages";

@interface InternationalControl()


@end

@implementation InternationalControl
singleton_implementation(InternationalControl);

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self loadDefault];
    }
    return self;
}

- (void) loadDefault
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userLanguageString = [userDefaults objectForKey:kUserLanguageKey];
    if (userLanguageString == nil ||
        userLanguageString.length == 0)
    {//如果为空,获取当前系统语言(中文简体 zh-Hans,中文繁体zh-Hant,英文 en)
        NSArray *languages = [userDefaults objectForKey:kAppleLanguages];
        NSString *currentLanguage = languages.firstObject;
        userLanguageString = currentLanguage;
        [userDefaults setValue:currentLanguage forKey:kUserLanguageKey];
        [userDefaults synchronize];
    }
    
    userLanguageString = [self adapterAllIOSSystemWithCurrentLanguage:userLanguageString];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:userLanguageString ofType:@"lproj"];
    _languageBundle = [NSBundle bundleWithPath:path];
    _currentLanguage = userLanguageString;
}

//适配所有的iOS 系统
- (NSString *) adapterAllIOSSystemWithCurrentLanguage:(NSString *) currentLanguage
{
    NSString *string = currentLanguage;
    if ([string hasPrefix:@"en"])
    {
        string = @"en";
    }
    if ([string hasPrefix:@"zh-Hans"])
    {
        string = @"zh-Hans";
    }
    if ([string hasPrefix:@"zh-Hant"])
    {
        string = @"zh-Hant";
    }
    return string;
}

- (void)setCurrentLanguage:(NSString *)currentLanguage
{
    if (currentLanguage == nil ||
        currentLanguage.length == 0||
        [_currentLanguage isEqualToString:currentLanguage])
    {
        return;
    }
    
    _currentLanguage = currentLanguage;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *path = [[NSBundle mainBundle] pathForResource:_currentLanguage
                                                     ofType:@"lproj"];
    _languageBundle = [NSBundle bundleWithPath:path];
    [userDefaults setValue:_currentLanguage forKey:kUserLanguageKey];
    [userDefaults synchronize];
}

/**
 * @brief 获取字符串
 */
- (NSString *) locatizedStringForkey:(NSString *) stringKey
{
    return [self.languageBundle localizedStringForKey:stringKey
                                                value:nil
                                                table:@"Localizable"];
}

/**
 * @brief 获取storyboard
 */
- (UIStoryboard *) locatizedStoryboardWithName:(NSString *) storyboardName
{
    return [UIStoryboard storyboardWithName:storyboardName bundle:self.languageBundle];
}

/**
 * @brief 获取xib
 */
- (UINib *) locatizedNibWithName:(NSString *) nibNameOrNil
{
    return [UINib nibWithNibName:nibNameOrNil bundle:self.languageBundle];
}

- (void)dealloc
{
    _currentLanguage = nil;
    _languageBundle = nil;
}




@end
