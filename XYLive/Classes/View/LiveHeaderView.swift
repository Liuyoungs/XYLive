//
//  LiveHeaderView.swift
//  XYLive
//
//  Created by xiyan on 2018/9/11.
//  Copyright © 2018年 xiyan. All rights reserved.
//

import UIKit

class LiveHeaderView: UIView {

    class func instanceFromNib() -> LiveHeaderView {
        
        return Bundle.main.loadNibNamed("LiveHeaderView", owner: nil, options: nil)?[0] as! LiveHeaderView
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

}
