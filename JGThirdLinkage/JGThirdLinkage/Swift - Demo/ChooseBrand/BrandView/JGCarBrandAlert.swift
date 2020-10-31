//
//  JGCarBrandAlert.swift
//  CarPartMall_Swift
//
//  Created by spring on 2020/10/24.
//  Copyright © 2020 spring. All rights reserved.
//

import UIKit

class JGCarBrandAlert: JGBaseView {
    
    var BackInfo:ReturnBackInfo? //点击回调
    var CloseInfo:ReturnBackInfo? //关闭回调
    
    private  lazy var alertView:UIView = {
        let alert = UIView();
        alert.backgroundColor = UIColor.white
        return alert;
    }()
    
    var OneMenu:JGCarAlertOneMenu? //一级分类
    var TwoMenu:JGCarAlertTwoMenu? //二级分类
    var ThreeMenu:JGCarAlertThreeMenu? //三级分类
    
    var ReSetBtn:UIButton? //三级分类
    var SureBtn:UIButton? //三级分类
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public convenience init(frame: CGRect, relyonView:UIView) {
        self.init(frame: frame)
        
        self.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor.clear
        
        let Rect = relyonView.convert(relyonView.bounds, to: UIApplication.shared.keyWindow)
        
        let CoverView = UIView()
        CoverView.backgroundColor = UIColor.init(white: 0.01, alpha: 0.4)
        
        
        let TopLine = UIView()
        TopLine.backgroundColor = UIColor.hex("#E6E6E6")
        
        
        OneMenu = JGCarAlertOneMenu()
        OneMenu?.BackInfo = { [weak self] (data) in
            self!.CarAlertOneMenuCellWithModel()
        }
        
        TwoMenu = JGCarAlertTwoMenu()
        TwoMenu?.isHidden = true
        TwoMenu?.BackInfo = { [weak self] (data) in
            self!.CarAlertTwoMenuCellWithModel()
        }
        
        ThreeMenu = JGCarAlertThreeMenu()
        ThreeMenu?.isHidden = true
        ThreeMenu?.BackInfo = { [weak self] (data) in
            self!.CarAlertThreeMenuCellWithModel()
        }
        
        ReSetBtn = UIButton()
        ReSetBtn?.titleLabel?.font = UIFont.fontMedium_size(kWidthScale(16))
        ReSetBtn?.setTitle("重置", for: .normal)
        ReSetBtn?.setTitleColor(UIColor.hex("#343434"), for: .normal)
        ReSetBtn?.backgroundColor = UIColor.white
        ReSetBtn?.layer.shadowColor = UIColor.init(r: 13, g: 2, b: 2, a: 0.06).cgColor
        ReSetBtn?.layer.shadowOffset = CGSize.zero
        ReSetBtn?.layer.shadowOpacity = 1
        ReSetBtn?.layer.shadowRadius = 12
        
        SureBtn = UIButton()
        SureBtn?.titleLabel?.font = UIFont.fontMedium_size(kWidthScale(16))
        SureBtn?.backgroundColor = UIColor.hex("#FC1E38")
        SureBtn?.setTitle("完成", for: .normal)
        SureBtn?.addTarget(self, action: #selector(SureBtnClick), for: .touchUpInside)
        
        addSubview(CoverView)
        addSubview(alertView)
        alertView.addSubview(TopLine)
        alertView.addSubview(OneMenu!)
        alertView.addSubview(TwoMenu!)
        alertView.addSubview(ThreeMenu!)
        alertView.addSubview(ReSetBtn!)
        alertView.addSubview(SureBtn!)
        
        
        let TopY = Rect.origin.y + Rect.size.height
        alertView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(TopY)
            make.left.equalToSuperview()
            make.size.equalTo(CGSize(width: kDeviceWidth, height: kWidthScale(400)))
        }
        
        CoverView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(alertView.snp_top)
        }
        
        TopLine.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        OneMenu?.snp.makeConstraints({ (make) in
            make.left.equalToSuperview()
            make.top.equalTo(TopLine.snp_bottom)
            make.bottom.equalTo(ReSetBtn!.snp_top)
            make.width.equalTo(kWidthScale(97))
        })
        
        TwoMenu?.snp.makeConstraints({ (make) in
            make.top.bottom.equalTo(OneMenu!)
            make.left.equalTo(OneMenu!.snp_right)
            make.width.equalTo(kWidthScale(278))
        })
        
        ThreeMenu?.snp.makeConstraints({ (make) in
            make.top.bottom.equalTo(OneMenu!)
            make.right.equalToSuperview().inset(7)
            make.width.equalTo(kWidthScale(129))
        })
        
        let btnW = kDeviceWidth / 2.0
        
        ReSetBtn?.snp.makeConstraints({ (make) in
            make.left.bottom.equalToSuperview()
            make.size.equalTo(CGSize(width: btnW, height: kWidthScale(44)))
        })
        
        SureBtn?.snp.makeConstraints({ (make) in
            make.right.bottom.equalToSuperview()
            make.size.equalTo(CGSize(width: btnW, height: kWidthScale(44)))
        })
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapClick(tap:)))
        tap.delegate = self
        tap.numberOfTouchesRequired = 1
        addGestureRecognizer(tap)
    }
    
    
    @objc func tapClick(tap:UITapGestureRecognizer) {
        if alertView.frame.contains(tap.location(in: self)) {
        }else {
            self.remove()
        }
    }    
    
    
    /// 一级类目 Cell 点击
    func CarAlertOneMenuCellWithModel() {
        
        self.TwoMenu?.isHidden = false;
        self.ThreeMenu?.isHidden = true;
        
        self.TwoMenu?.snp.updateConstraints({ (make) in
            make.width.equalTo(kWidthScale(278))
        })
        
    }
    
    /// 二级类目 Cell 点击
    func CarAlertTwoMenuCellWithModel() {
        
        self.ThreeMenu?.isHidden = false;
        
        self.TwoMenu?.snp.updateConstraints({ (make) in
            make.width.equalTo(kWidthScale(135))
        })
    }
    
    /// 三级类目 Cell 点击
    func CarAlertThreeMenuCellWithModel() {
        
    }
    
    @objc func SureBtnClick() {
        
        if self.BackInfo != nil {
            remove()
            self.BackInfo!("传模型")
        }
        
    }
    
    
    
    ///MARK - 显示
    func show() {
        UIApplication.shared.keyWindow?.addSubview(self)
    }
    
    ///MARK - 移除
    func remove()  {
        
        if self.CloseInfo != nil {
            self.CloseInfo!("关闭")
        }
        
        self.removeFromSuperview()
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
}

//针对弹窗里面的tableview的点击cell事件和弹窗遮蔽层点击事件冲突
extension JGCarBrandAlert  : UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        //获取点击视图类型的字符串
        let touchClass = NSStringFromClass((touch.view?.classForCoder)!)
        //判断点击视图是不是当前的弹框，如果不是，则表明点击的是背景隐藏弹框，如果是表明点击的UITableview的cell；
        //self.classForCoder返回的是uiview，touchClass也是返回uiview
        if touchClass == "UITableViewCellContentView" {
            return false
        }
        return true
    }
}
