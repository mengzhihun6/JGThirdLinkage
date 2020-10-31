//
//  JGChooseBrandView.swift
//  CarPartMall_Swift
//
//  Created by spring on 2020/10/24.
//  Copyright © 2020 spring. All rights reserved.
//

import UIKit


class JGChooseBrandViewBtn: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.titleLabel?.numberOfLines = 2;
        self.titleLabel?.textAlignment = .left
        self.setTitleColor(UIColor.hex("#FC1E38"), for: .selected)
        self.setImage(UIImage(named: "choose_down_arrow"), for: .normal)
        self.setImage(UIImage(named: "choose_up_arrow"), for: .selected)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.titleLabel?.text == "选择品牌" {
            self.titleLabel?.font = UIFont.fontBold_size(kWidthScale(14))
            self.setTitleColor(UIColor.hex("#343434"), for: .normal)
        }else {
            self.titleLabel?.font = UIFont.font(kWidthScale(14))
            self.setTitleColor(UIColor.hex("#787878"), for: .normal)
        }
        
        
        let h = self.frame.size.height
        
        var titleW = UILabel.GetLabWidth(labelStr: self.titleLabel!.text!, font: self.titleLabel!.font, height: 0)
        let MaxW = kDeviceWidth - kWidthScale(35) - kWidthScale(22)
        
        if titleW > MaxW {
            titleW = MaxW
        }
        
        let y = (h - kWidthScale(22)) / 2.0
        self.titleLabel?.frame = CGRect(x: kWidthScale(17), y: 0, width: titleW, height: h)

        self.imageView?.frame = CGRect(x: self.titleLabel!.JG_rightX, y: y, width: kWidthScale(22), height: kWidthScale(22))
    }
}



class JGChooseBrandView: JGBaseView {

    var BrandBtn : JGChooseBrandViewBtn?
    
    
    override func configUI() {
        
        self.backgroundColor = UIColor.white
        
        BrandBtn = JGChooseBrandViewBtn()
        BrandBtn!.setTitle("选择品牌", for: .normal)
        BrandBtn?.addTarget(self, action: #selector(BrandBtnClick(btn:)), for: .touchUpInside)
        
        self.addSubview(BrandBtn!)
        
        BrandBtn?.snp.makeConstraints({ (make) in
            make.edges.equalTo(self)
        })
        
    }
    
    @objc func BrandBtnClick(btn : UIButton) {
        
        btn.isSelected = true
        
        
        let alert = JGCarBrandAlert(frame: CGRect.zero, relyonView: btn)

        alert.BackInfo = { (模型) in
            btn.setTitle("奔驰汽车-长轴距A型轿车-2016", for: .normal)
        }
        
        
        alert.CloseInfo = { _ in
            btn.isSelected = false
        }

        alert.show()
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
