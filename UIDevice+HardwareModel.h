//
//  UIDevice+HardwareModel.h
//
//  Created by Heiko Dreyer on 05/11/11.
//  Copyright 2011 boxedfolder.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIHardwareModel) {
    UIHardwareModelUnknown = 0,
    
    UIHardwareModelSimulator,
    
    UIHardwareModeliPhone1G,
    UIHardwareModeliPhone3G,
    UIHardwareModeliPhone3GS,
    UIHardwareModeliPhone4,
    UIHardwareModeliPhone4Verizon,
    UIHardwareModeliPhone4S,
    UIHardwareModeliPhone5,
    UIHardwareModeliPhone5Global,
    UIHardwareModeliPhone5c,
    UIHardwareModeliPhone5cGlobal,
    UIHardwareModeliPhone5s,
    UIHardwareModeliPhone5sGlobal,
    UIHardwareModeliPhone6,
    UIHardwareModeliPhone6Plus,
    UIHardwareModeliPhone6s,
    UIHardwareModeliPhone6sPlus,
    UIHardwareModeliPhoneSE,
    
    UIHardwareModeliPodTouch1G,
    UIHardwareModeliPodTouch2G,
    UIHardwareModeliPodTouch3G,
    UIHardwareModeliPodTouch4G,
    UIHardwareModeliPodTouch5G,
    UIHardwareModeliPodTouch6G,
    
    UIHardwareModeliPad,
    UIHardwareModeliPad2WiFi,
    UIHardwareModeliPad2GSM,
    UIHardwareModeliPad2CDMA,
    UIHardwareModeliPad3WiFi,
    UIHardwareModeliPad3GSM,
    UIHardwareModeliPad3CDMA,
    
    UIHardwareModeliPadMiniWiFi,
    UIHardwareModeliPadMiniGSM,
    UIHardwareModeliPadMiniCDMA,
    
    UIHardwareModeliPad4WiFi,
    UIHardwareModeliPad4GSM,
    UIHardwareModeliPad4CDMA,
    
    UIHardwareModeliPadMini2Wifi,
    UIHardwareModeliPadMini2Cellular,
    UIHardwareModeliPadMini2CellularChina ,
    
    UIHardwareModeliPadMini3WiFi,
    UIHardwareModeliPadMini3Cellular,
    UIHardwareModeliPadMini3CellularChina,
    
    UIHardwareModeliPadMini4WiFi,
    UIHardwareModeliPadMini4Cellular,
    
    UIHardwareModeliPadAirWiFi,
    UIHardwareModeliPadAirCellular,
    UIHardwareModeliPadAirCellularChina,
    
    UIHardwareModeliPadAir2WiFi,
    UIHardwareModeliPadAir2Cellular,
    
    UIHardwareModeliPadPro9_7WiFi,
    UIHardwareModeliPadPro9_7Cellular,
    
    UIHardwareModeliPadPro12_9WiFi,
    UIHardwareModeliPadPro12_9Cellular,
};

@interface UIDevice (HardwareModel)

/**
 *	Returns hardware name of device instance
 */
- (NSString *)hardwareName;

/**
 *	Returns hardware id of device instance
 */
- (UIHardwareModel)hardwareModel;

@end
