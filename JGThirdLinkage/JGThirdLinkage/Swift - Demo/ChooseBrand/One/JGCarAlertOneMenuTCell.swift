//
//  JGCarAlertOneMenuTCell.swift
//  CarPartMall_Swift
//
//  Created by spring on 2020/10/26.
//  Copyright © 2020 spring. All rights reserved.
//

import UIKit

class JGCarAlertOneMenuTCell: JGBaseTableViewCell {

    lazy var TitleLbl:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.fontMedium_size(kWidthScale(16))
        lbl.textColor = UIColor.hex("#343434")
        lbl.textAlignment = .center
        lbl.numberOfLines = 2;
        lbl.text = "雪佛兰"
        return lbl
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func configUI() {
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.backgroundColor = UIColor.white
        
        
        self.contentView.addSubview(TitleLbl)
        
        TitleLbl.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        TitleLbl.textColor = selected ? UIColor.hex("#FC1E38") : UIColor.hex("#343434")
        self.backgroundColor = selected ? UIColor.white : UIColor.hex("#F5F5F5")

    }

}
