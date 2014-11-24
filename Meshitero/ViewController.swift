//
//  ViewController.swift
//  Meshitero
//
//  Created by naoyashiga on 2014/11/22.
//  Copyright (c) 2014年 naoyashiga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    var collectionView: UICollectionView?
    let photos:[String] = [
        "http://imgc.appbank.net/c/wp-content/uploads/2013/05/jirou-shinjuku-15.jpg",
        "http://livedoor.blogimg.jp/netaatoz/imgs/7/4/74b81ff7.jpg",
        "http://www.beautynewstokyo.jp/wp/wp-content/uploads/2013/05/aaaaaaBODY_nikusyoku-449x300.jpg",
        "http://imgc.appbank.net/c/wp-content/uploads/2013/05/jirou-shinjuku-15.jpg",
        "http://livedoor.blogimg.jp/netaatoz/imgs/7/4/74b81ff7.jpg",
        "http://www.beautynewstokyo.jp/wp/wp-content/uploads/2013/05/aaaaaaBODY_nikusyoku-449x300.jpg"
//        "http://livedoor.blogimg.jp/ninja532s/imgs/5/7/57325a73.jpg",
//        "http://www.torian.jp/img/background4.jpg",
//        "http://imgcc.naver.jp/kaze/mission/USER/20140614/19/1344409/9/2592x1936x76dbec808706c1d0b066ce.jpg",
//        "http://blog-imgs-37.fc2.com/g/r/e/greeeenhidegendama/2010022808394581e.jpg",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        //ナビゲーションバーのスタイル
        self.navigationController?.navigationBar.barTintColor = UIColor.hexStr("000000", alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.hexStr("fefefe", alpha: 1)
        // タイトルを表示するラベルを作成
        let navigationLabel = UILabel()
        navigationLabel.text = "Food Porn"
        navigationLabel.textColor  = UIColor.hexStr("fefefe", alpha: 1)
        navigationLabel.sizeToFit()
        navigationItem.titleView = navigationLabel
        
        //レイアウト作成
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right :10)
//        layout.itemSize = CGSize(width: UIScreen.mainScreen().bounds.width / 4, height: 100)
        var imgSize = UIScreen.mainScreen().bounds.width
        println(UIScreen.mainScreen().bounds.width)
        layout.itemSize = CGSize(width: imgSize, height: UIScreen.mainScreen().bounds.height / 2.3)
        //背景
       
        //コレクションビューのインスタンスを作成
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        
        collectionView!.registerClass(PhotoCell.self, forCellWithReuseIdentifier: "Cell")
//        collectionView!.registerNib(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        collectionView!.backgroundColor = UIColor.hexStr("080808", alpha: 1)
        self.view.addSubview(collectionView!)
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let photoCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as PhotoCell
        photoCell.backgroundColor = UIColor.blackColor()
//        photoCell.layer.borderWidth = 1
//        photoCell.layer.borderColor = UIColor.hexStr("212121", alpha: 1).CGColor
//        photoCell.layer.shadowColor = UIColor.grayColor().CGColor
//        photoCell.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        
        let photoUrlString = photos[indexPath.item]
        let url = NSURL(string: photoUrlString)
        
        println(indexPath.item)
        photoCell.imageView.sd_setImageWithURL(url)

        return photoCell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("touch")
        println(indexPath.item)
        let photoCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as PhotoCell
        
        var vc: PhotoView = PhotoView()
        let photoUrlString = photos[indexPath.item]
        
        vc.photoUrlString = photoUrlString
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension UIColor {
    class func hexStr (var hexStr : NSString, var alpha : CGFloat) -> UIColor {
        hexStr = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: hexStr)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.whiteColor();
        }
    }
}

