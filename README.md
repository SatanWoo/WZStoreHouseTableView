# WZStoreHouseTableView
Scalable Table View like Store House app, written in Swift.

Implementation is not challenging, and I guess someone may have implemented similar result with UICollectionViewLayout customization.

Mine is based on UITableView and this is my first Swift project, so please feel free to find bugs and report them.

## Demo
<img src = "http://xuntaimage.qiniudn.com/WZStoreHouseTableView.gif">

## Example 
In WZStoreHouseTableView.swift, you will find there is a protocol with one variable need to be set and one func to be implemented.

    @objc protocol WZStoreHouseTableViewTransform {
        var miniumScale:CGFloat {get};
        func transformCell(forScale scale:CGFloat);
    }


That's all for you to do, you can refer to WZScalableTableViewCell as an example, where I set miniumScale variable and conform to the transformCell method.
  
    var miniumScale:CGFloat = 0.85;
    func transformCell(forScale scale: CGFloat) {
        self.scaleView.transform = CGAffineTransformMakeScale(1.0 - scale, 1.0 - scale);
    }

## License
MIT License
Copyright © 2015 SatanWoo.
