//
//  JGCommonConst.swift
//  JGThirdLinkage
//
//  Created by spring on 2020/10/31.
//  Copyright © 2020 spring. All rights reserved.
//

import UIKit
import Foundation
import SnapKit

typealias ReturnBackInfo = (_ data:Any) -> Void


var isIphoneX: Bool {
    return UIDevice.current.userInterfaceIdiom == .phone
        && (max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) == 812
            || max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) == 896)
}


/// 尺寸相关
let kDeviceWidth = UIScreen.main.bounds.width
let kDeviceHight = UIScreen.main.bounds.height
let SJHeight = isIphoneX ? 86 : 64 //导航栏高度

//这里的375我是针对6为标准适配的,如果需要其他标准可以修改
func kWidthScale(_ R:CGFloat) -> CGFloat {
    return ((R)*(kDeviceWidth/375.0))
}
