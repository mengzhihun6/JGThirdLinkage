//
//  JGThirdLinkageSwift.swift
//  JGThirdLinkage
//
//  Created by spring on 2020/10/31.
//  Copyright © 2020 spring. All rights reserved.
//

import UIKit

class JGThirdLinkageSwift: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let BrandV = JGChooseBrandView()
        
        view.addSubview(BrandV)
        
        BrandV.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().inset(SJHeight)
            make.height.equalTo(kWidthScale(40))
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
