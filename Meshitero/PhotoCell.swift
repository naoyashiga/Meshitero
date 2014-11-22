//
//  PhotoCell.swift
//  Meshitero
//
//  Created by naoyashiga on 2014/11/22.
//  Copyright (c) 2014年 naoyashiga. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    let imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*2/3))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        contentView.addSubview(imageView)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
