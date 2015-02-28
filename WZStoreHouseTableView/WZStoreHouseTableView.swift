//
//  WZStoreHouseTableView.swift
//  WZStoreHouseTableView
//
//  Created by z on 15-2-28.
//  Copyright (c) 2015年 SatanWoo. All rights reserved.
//

import UIKit

@objc protocol WZStoreHouseTableViewTransform {
    var miniumScale:CGFloat {get};
    func transformCell(forScale scale:CGFloat);
}

class WZStoreHouseTableView:UITableView {
    override func layoutSubviews() {
        super.layoutSubviews();
        self.transform();
    }
    
    private func transform()->Void {
       
        for indexPath in self.indexPathsForVisibleRows() as [NSIndexPath] {
            if let cell = self.cellForRowAtIndexPath(indexPath) as? WZStoreHouseTableViewTransform {
                let distanceFromCenter = self.computeDistanceFromCenter(indexPath);
                cell.transformCell(forScale: self.computeScale(distanceFromCenter, minScale: cell.miniumScale));
            }
        }
    }
    
    private func computeDistanceFromCenter(indexPath:NSIndexPath) -> CGFloat {
        let cellRect = self.rectForRowAtIndexPath(indexPath);
        let cellCenter = cellRect.origin.y + cellRect.size.height/2;
        let contentCenter = self.contentOffset.y + self.bounds.size.height/2;
        
        return fabs(cellCenter - contentCenter);
    }
    
    private func computeScale(distanceFromCenter:CGFloat, minScale:CGFloat)->CGFloat {
        return  (1.0 - minScale) * distanceFromCenter / self.bounds.size.height;
    }
}
