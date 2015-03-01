//
//  WZScalableTableViewCell.swift
//  WZStoreHouseTableView
//
//  Created by z on 15-2-28.
//  Copyright (c) 2015年 SatanWoo. All rights reserved.
//

import UIKit

class WZScalableTableViewCell:UITableViewCell, WZStoreHouseTableViewTransform {
    let miniumScale:CGFloat = 0.85;
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var scaleView: UIView!
    override func prepareForReuse() {
        super.prepareForReuse();
        self.scaleView.transform = CGAffineTransformMakeScale(self.miniumScale, self.miniumScale);
    }
    
    func transformCell(forScale scale: CGFloat) {
        self.scaleView.transform = CGAffineTransformMakeScale(1.0 - scale, 1.0 - scale);
    }
}