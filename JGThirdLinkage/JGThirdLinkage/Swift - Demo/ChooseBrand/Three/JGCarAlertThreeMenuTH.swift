//
//  JGCarAlertThreeMenuTH.swift
//  CarPartMall_Swift
//
//  Created by spring on 2020/10/26.
//  Copyright © 2020 spring. All rights reserved.
//

import UIKit

class JGCarAlertThreeMenuTH: JGBaseView {
    
    lazy var TitleLbl:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.font(kWidthScale(13))
        lbl.textColor = UIColor.hex("#343434")
        lbl.text = "全部"
        return lbl
    }()
    
    lazy var Line : UIView = {
        let line = UIView();
        line.backgroundColor = UIColor.hex("#E6E6E6")
        return line
    }()
    
    
    override func configUI() {
        
        self.backgroundColor = UIColor.white
        
        addSubview(TitleLbl)
        addSubview(Line)
        
        TitleLbl.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        Line.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
