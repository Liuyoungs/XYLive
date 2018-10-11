//
//  ViewController.swift
//  XYLive
//
//  Created by xiyan on 2018/9/10.
//  Copyright © 2018年 xiyan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        let liveBtn = UIButton(frame: CGRect(x: 80, y: 200, width: kScreenWidth-160, height: 60))
        liveBtn.backgroundColor = UIColor.orange
        liveBtn.setTitle("开始直播", for: .normal)
        liveBtn.addTarget(self, action: #selector(liveBtnAction), for: .touchUpInside)
        
        let playBtn = UIButton(frame: CGRect(x: 80, y: 300, width: kScreenWidth-160, height: 60))
        playBtn.backgroundColor = UIColor.purple
        playBtn.setTitle("观看直播", for: .normal)
        playBtn.addTarget(self, action: #selector(playBtnAction), for: .touchUpInside)
        
        view.addSubview(liveBtn)
        view.addSubview(playBtn)
    }
    
    @objc func liveBtnAction() {
        present(LiveCaptureViewController(), animated: true, completion: nil)
    }
    
    @objc func playBtnAction() {
        present(PlayerViewController(), animated: true, completion: nil)
    }
}

