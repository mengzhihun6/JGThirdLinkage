//
//  JGCarAlertThreeMenu.swift
//  CarPartMall_Swift
//
//  Created by spring on 2020/10/26.
//  Copyright © 2020 spring. All rights reserved.
//

import UIKit

class JGCarAlertThreeMenu: JGBaseView {
    
    var BackInfo:ReturnBackInfo? //点击回调
    
    private lazy var tableView:UITableView = {
        let tab = UITableView(frame: CGRect.zero, style: .plain)
        tab.backgroundColor = UIColor.white
        tab.separatorStyle = UITableViewCell.SeparatorStyle.none
        tab.showsVerticalScrollIndicator = false
        tab.tableFooterView = UIView()
        tab.dataSource = self
        tab.delegate = self
        //注册重用
        tab.register(cellType: JGCarAlertThreeMenuTCell.self)
        return tab
    }()
    
    override func configUI() {
        
        self.backgroundColor = UIColor.clear
        
        let VLine = UIView()
        VLine.backgroundColor = UIColor.hex("#E6E6E6")
        
        
        addSubview(tableView)
        addSubview(VLine)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        VLine.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(0.5)
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


// MARK: - UITableViewDelegate, UITableViewDataSource
extension JGCarAlertThreeMenu : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = JGCarAlertThreeMenuTH()
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: JGCarAlertThreeMenuTCell.self)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        
        if self.BackInfo != nil {
            self.BackInfo!("模型")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kWidthScale(29)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kWidthScale(29)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}


