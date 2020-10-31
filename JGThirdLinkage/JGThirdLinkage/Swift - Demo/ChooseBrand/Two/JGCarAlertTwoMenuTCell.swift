//
//  JGCarAlertTwoMenuTCell.swift
//  CarPartMall_Swift
//
//  Created by spring on 2020/10/26.
//  Copyright © 2020 spring. All rights reserved.
//

import UIKit

class JGCarAlertTwoMenuTCell: JGBaseTableViewCell {

    lazy var TitleLbl:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.font(kWidthScale(13))
        lbl.textColor = UIColor.hex("#343434")
        lbl.numberOfLines = 2;
        lbl.text = "长轴距A型轿车"
        return lbl
    }()
    
    lazy var Arrow : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "choose_arrow_right")
        return img
    }()
    
    lazy var Line : UIView = {
        let line = UIView();
        line.backgroundColor = UIColor.hex("#E6E6E6")
        return line
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func configUI() {

        self.selectionStyle = UITableViewCell.SelectionStyle.none

        self.contentView.addSubview(TitleLbl)
        self.contentView.addSubview(Arrow)
        self.contentView.addSubview(Line)

        
        TitleLbl.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(Arrow.snp_left)
            make.centerY.equalToSuperview()
        }
        
        Arrow.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(4)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(kWidthScale(22))
        }
        
        Line.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        TitleLbl.textColor = selected ? UIColor.hex("#FC1E38") : UIColor.hex("#343434")
    }

}
