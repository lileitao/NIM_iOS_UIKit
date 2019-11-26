//
//  NIMKitSetting.m
//  NIMKit
//
//  Created by chris on 2017/10/30.
//  Copyright © 2017年 NetEase. All rights reserved.
//

#import "NIMKitSetting.h"
#import "UIImage+NIMKit.h"

@implementation NIMKitSetting

- (instancetype)init:(BOOL)isRight
{
    self = [super init];
    if (self)
    {
        if (isRight)
        {
            _normalBackgroundImage    =  [[UIImage nim_imageInKit:@"icon_sender_text_node_normal"] resizableImageWithCapInsets:UIEdgeInsetsFromString(@"{26,10,15,15}") resizingMode:UIImageResizingModeStretch];
            _highLightBackgroundImage =  [[UIImage nim_imageInKit:@"icon_sender_text_node_pressed"] resizableImageWithCapInsets:UIEdgeInsetsFromString(@"{26,10,15,15}") resizingMode:UIImageResizingModeStretch];
            
        }
        else
        {
            _normalBackgroundImage    =  [[UIImage nim_imageInKit:@"icon_receiver_node_normal"] resizableImageWithCapInsets:UIEdgeInsetsFromString(@"{26,10,15,15}") resizingMode:UIImageResizingModeStretch];
            _highLightBackgroundImage =  [[UIImage nim_imageInKit:@"icon_receiver_node_pressed"] resizableImageWithCapInsets:UIEdgeInsetsFromString(@"{26,10,15,15}") resizingMode:UIImageResizingModeStretch];
        }
    }
    return self;
}

@end

