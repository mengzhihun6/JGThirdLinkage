//
//  JGUILabelExtension.swift
//  ShoesMall_Swift
//
//  Created by spring on 2020/4/15.
//  Copyright © 2020 spring. All rights reserved.
//

import UIKit

extension UILabel {
    
    // Label行间距的高度
    class func GetLabHeight(lineSpacing:CGFloat, font:UIFont, widthLabel:CGFloat, title:String) -> CGFloat {
        
        if title.count == 0 {
            return 0
        }
        
        var attrButes:[NSAttributedString.Key : Any]! = nil;
        let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = lineSpacing
        attrButes = [NSAttributedString.Key.font:font,NSAttributedString.Key.paragraphStyle:paraph]
        
        let size:CGRect = title.boundingRect(with: CGSize(width: widthLabel, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attrButes, context: nil)
        
        return size.height
    }
    
    
    /// 动态计算Label宽度
    class func GetLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        
        if labelStr.count == 0 {
            return 0
        }
        
        let size = CGSize(width: CGFloat(MAXFLOAT), height: height)
        
        let strSize = labelStr.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil).size

        return strSize.width
    }
    
    
}


