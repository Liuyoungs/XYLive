//
//  LiveBottomView.swift
//  XYLive
//
//  Created by xiyan on 2018/9/11.
//  Copyright © 2018年 xiyan. All rights reserved.
//

import UIKit

class LiveBottomView: UIView {

    @IBOutlet weak var chatBtn: UIButton!
    
    @IBOutlet weak var msgBtn: UIButton!
    
    @IBOutlet weak var giftBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!

    @IBOutlet weak var shutdownBtn: UIButton!
    
    /// 闭包
    public var bottomViewBtnClickBlock: ((LivingBottomViewBtnClickType) -> Void)?
    
    enum LivingBottomViewBtnClickType {
        case chat
        case msg
        case gift
        case share
        case shutdown
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func instanceFromNib() -> LiveBottomView {
        return Bundle.main.loadNibNamed("LiveBottomView", owner: nil, options: nil)?[0] as! LiveBottomView
    }
    @IBAction func chatBtnAction(_ sender: Any) {
        
    }
    
    @IBAction func msgBtnAction(_ sender: Any) {
    }
    
    @IBAction func gitBtnAction(_ sender: Any) {
    }
    
    @IBAction func shareBtnAction(_ sender: Any) {
    }
    
    @IBAction func shutdownBtnAction(_ sender: Any) {
        if (self.bottomViewBtnClickBlock != nil) {
            self.bottomViewBtnClickBlock?(LivingBottomViewBtnClickType.shutdown)
        }
    }
    
}
