//
//  UIDevice+HardwareModel.m
//
//  Created by Heiko Dreyer on 05/11/11.
//  Copyright 2011 boxedfolder.com. All rights reserved.
//

#import "UIDevice+HardwareModel.h"
#import <sys/utsname.h>

@implementation UIDevice (HardwareModel)

+ (NSString *)hardwareName
{
    static NSString *hardwareName = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *hwString = [self hwString];
        if (hwString) {
            NSArray *hwInfo = [self hwModelsMap][hwString];
            if (hwInfo) {
                hardwareName = hwInfo[0];
            }
        }
        
        if (hardwareName == nil) {
            hardwareName = [NSString stringWithFormat:@"Unknown [%@]", hwString];
        }
    });
    
    return hardwareName;
}

- (UIHardwareModel)hardwareModel
{
    static UIHardwareModel hardwareModel;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *hwString = [UIDevice hwString];
        if (hwString) {
            NSArray *hwInfo = [UIDevice hwModelsMap][hwString];
            if (hwInfo) {
                hardwareModel = [hwInfo[1] integerValue];
            }
        }
        
        NSAssert(hardwareModel != UIHardwareModelUnknown, @"Unknown hardware model");
    });
    
    return hardwareModel;
}

#pragma mark - Private

+ (NSString *)hwString
{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    if (systemInfo.machine == NULL) {
        return nil;
    }
    
    return [NSString stringWithUTF8String:systemInfo.machine];
}

+ (NSDictionary *)hwModelsMap
{
    return
    @{
      @"i386"    : @[@"Simulator", @(UIHardwareModelSimulator)],
      @"x86_64"  : @[@"Simulator", @(UIHardwareModelSimulator)],
      
      @"iPhone1,1" : @[@"iPhone 1G",         @(UIHardwareModeliPhone1G)],
      @"iPhone1,2" : @[@"iPhone 3G",         @(UIHardwareModeliPhone3G)],
      @"iPhone2,1" : @[@"iPhone 3GS",        @(UIHardwareModeliPhone3GS)],
      @"iPhone3,1" : @[@"iPhone 4",          @(UIHardwareModeliPhone4)],
      @"iPhone3,2" : @[@"iPhone 4 Verizon",  @(UIHardwareModeliPhone4Verizon)],
      @"iPhone3,3" : @[@"iPhone 4 Verizon",  @(UIHardwareModeliPhone4Verizon)],
      @"iPhone4,1" : @[@"iPhone 4S",         @(UIHardwareModeliPhone4S)],
      @"iPhone5,1" : @[@"iPhone 5",          @(UIHardwareModeliPhone5)],
      @"iPhone5,2" : @[@"iPhone 5",          @(UIHardwareModeliPhone5Global)],
      @"iPhone5,3" : @[@"iPhone 5C",         @(UIHardwareModeliPhone5c)],
      @"iPhone5,4" : @[@"iPhone 5C",         @(UIHardwareModeliPhone5cGlobal)],
      @"iPhone6,1" : @[@"iPhone 5S",         @(UIHardwareModeliPhone5s)],
      @"iPhone6,2" : @[@"iPhone 5S",         @(UIHardwareModeliPhone5sGlobal)],
      @"iPhone7,1" : @[@"iPhone 6 Plus",     @(UIHardwareModeliPhone6Plus)],
      @"iPhone7,2" : @[@"iPhone 6",          @(UIHardwareModeliPhone6)],
      @"iPhone8,1" : @[@"iPhone 6S",         @(UIHardwareModeliPhone6s)],
      @"iPhone8,2" : @[@"iPhone 6S Plus",    @(UIHardwareModeliPhone6sPlus)],
      @"iPhone8,4" : @[@"iPhone SE",         @(UIHardwareModeliPhoneSE)],
      
      @"iPhone9,1" : @[@"iPhone 7",         @(UIHardwareModeliPhone7)],
      @"iPhone9,3" : @[@"iPhone 7",         @(UIHardwareModeliPhone7)],
      @"iPhone9,2" : @[@"iPhone 7 Plus",    @(UIHardwareModeliPhone7Plus)],
      @"iPhone9,4" : @[@"iPhone 7 Plus",    @(UIHardwareModeliPhone7Plus)],
      
      @"iPhone10,1" : @[@"iPhone 8",    @(UIHardwareModeliPhone8)],
      @"iPhone10,4" : @[@"iPhone 8",    @(UIHardwareModeliPhone8)],
      @"iPhone10,5" : @[@"iPhone 8 Plus",    @(UIHardwareModeliPhone8Plus)],
      @"iPhone9,4" : @[@"iPhone 8 Plus",    @(UIHardwareModeliPhone8Plus)],
      @"iPhone10,3" : @[@"iPhone X",    @(UIHardwareModeliPhoneX)],
      @"iPhone10,6" : @[@"iPhone X",    @(UIHardwareModeliPhoneX)],
        
      @"iPod1,1" : @[@"iPod 1G", @(UIHardwareModeliPodTouch1G)],
      @"iPod2,1" : @[@"iPod 2G", @(UIHardwareModeliPodTouch2G)],
      @"iPod3,1" : @[@"iPod 3G", @(UIHardwareModeliPodTouch3G)],
      @"iPod4,1" : @[@"iPod 4G", @(UIHardwareModeliPodTouch4G)],
      @"iPod5,1" : @[@"iPod 5G", @(UIHardwareModeliPodTouch5G)],
      @"iPod7,1" : @[@"iPod 6G", @(UIHardwareModeliPodTouch6G)],
      
      @"iPad1,1" : @[@"iPad",          @(UIHardwareModeliPad)],
      @"iPad2,1" : @[@"iPad 2 WiFi",   @(UIHardwareModeliPad2WiFi)],
      @"iPad2,2" : @[@"iPad 2 GSM",    @(UIHardwareModeliPad2GSM)],
      @"iPad2,3" : @[@"iPad 2 CDMA",   @(UIHardwareModeliPad2CDMA)],
      @"iPad2,4" : @[@"iPad 2 WiFi",   @(UIHardwareModeliPad2WiFi)],
      @"iPad3,1" : @[@"iPad 3 WiFi",   @(UIHardwareModeliPad3WiFi)],
      @"iPad3,2" : @[@"iPad 3 GSM",    @(UIHardwareModeliPad3GSM)],
      @"iPad3,3" : @[@"iPad 3 CDMA",   @(UIHardwareModeliPad3CDMA)],
      
      @"iPad2,5" : @[@"iPad mini WiFi",  @(UIHardwareModeliPadMiniWiFi)],
      @"iPad2,6" : @[@"iPad mini GSM",   @(UIHardwareModeliPadMiniGSM)],
      @"iPad2,7" : @[@"iPad mini CDMA",  @(UIHardwareModeliPadMiniCDMA)],
      
      @"iPad3,4" : @[@"iPad 4 WiFi", @(UIHardwareModeliPad4WiFi)],
      @"iPad3,5" : @[@"iPad 4 GSM",  @(UIHardwareModeliPad4GSM)],
      @"iPad3,6" : @[@"iPad 4 CDMA", @(UIHardwareModeliPad4CDMA)],
      
      @"iPad4,1" : @[@"iPad Air WiFi",           @(UIHardwareModeliPadAirWiFi)],
      @"iPad4,2" : @[@"iPad Air Cellular",       @(UIHardwareModeliPadAirCellular)],
      @"iPad4,3" : @[@"iPad Air Cellular China", @(UIHardwareModeliPadAirCellularChina)],
      
      @"iPad4,4" : @[@"iPad mini 2 WiFi",            @(UIHardwareModeliPadMini2Wifi)],
      @"iPad4,5" : @[@"iPad mini 2 Cellular",        @(UIHardwareModeliPadMini2Cellular)],
      @"iPad4,6" : @[@"iPad mini 2 Cellular China",  @(UIHardwareModeliPadMini2CellularChina)],
      @"iPad4,7" : @[@"iPad mini 3 WiFi",            @(UIHardwareModeliPadMini3WiFi)],
      @"iPad4,8" : @[@"iPad mini 3 Cellular",        @(UIHardwareModeliPadMini3Cellular)],
      @"iPad4,9" : @[@"iPad mini 3 Cellular China",  @(UIHardwareModeliPadMini3CellularChina)],
      @"iPad5,1" : @[@"iPad mini 4 WiFi",            @(UIHardwareModeliPadMini4WiFi)],
      @"iPad5,2" : @[@"iPad mini 4 Cellular",        @(UIHardwareModeliPadMini4Cellular)],
      
      @"iPad5,3" : @[@"iPad Air 2 WiFi",     @(UIHardwareModeliPadAir2WiFi)],
      @"iPad5,4" : @[@"iPad Air 2 Cellular", @(UIHardwareModeliPadAir2Cellular)],
      
      @"iPad6,3" : @[@"iPad Pro (9.7 inch) WiFi",        @(UIHardwareModeliPadPro9_7WiFi)],
      @"iPad6,4" : @[@"iPad Pro (9.7 inch) Cellular",    @(UIHardwareModeliPadPro9_7Cellular)],
      
      @"iPad6,7" : @[@"iPad Pro (12.9 inch) WiFi",       @(UIHardwareModeliPadPro12_9WiFi)],
      @"iPad6,8" : @[@"iPad Pro (12.9 inch) Cellular",   @(UIHardwareModeliPadPro12_9Cellular)],
      };
}

@end
