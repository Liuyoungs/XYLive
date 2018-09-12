//
//  PlayerViewController.swift
//  XYLive
//
//  Created by xiyan on 2018/9/10.
//  Copyright © 2018年 xiyan. All rights reserved.
//

import UIKit
import IJKMediaFramework

class PlayerViewController: UIViewController {
    
    var currentIndex : Int = 0 // 当前点击第几个
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 原点从（0，0）开始
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.clear
        
        self.collectionView.reloadData()
    }
    
    
    //完成消失
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //发送通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "kNotificationClickUser"), object: nil)
        //移除通知
        NotificationCenter.default.removeObserver(self)
    }
    
    deinit {
        print("释放播放controller")
    }
    
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: LiveRoomLayout.init())
        collection.register(LiveCollectionViewCell.self, forCellWithReuseIdentifier: "LiveCollectionViewCell")
        collection.delegate = self
        collection.dataSource = self
        
        self.view.addSubview(collection)
        
        collection.backgroundColor = UIColor.clear
        return collection
    }()
   
}

extension PlayerViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveCollectionViewCell", for: indexPath) as! LiveCollectionViewCell
        cell.controller = self
        
        cell._flv = "rtmp://live.hkstv.hk.lxdns.com/live/hks"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
