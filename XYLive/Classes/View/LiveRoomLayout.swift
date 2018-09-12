//
//  LiveRoomLayout.swift
//  XYLive
//
//  Created by xiyan on 2018/9/11.
//  Copyright © 2018年 xiyan. All rights reserved.
//

import UIKit

class LiveRoomLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        self.scrollDirection = UICollectionView.ScrollDirection.vertical
        self.itemSize = (self.collectionView?.bounds.size)!
        self.minimumLineSpacing = 0 //间距
        self.minimumInteritemSpacing = 0
        
        //滑动条
        self.collectionView?.showsVerticalScrollIndicator = false
        self.collectionView?.showsHorizontalScrollIndicator = false
    }
}
