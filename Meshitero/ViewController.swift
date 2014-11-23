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
        "http://livedoor.blogimg.jp/ninja532s/imgs/5/7/57325a73.jpg"
//        "http://livedoor.blogimg.jp/ninja532s/imgs/5/7/57325a73.jpg",
//        "http://www.torian.jp/img/background4.jpg",
//        "http://imgcc.naver.jp/kaze/mission/USER/20140614/19/1344409/9/2592x1936x76dbec808706c1d0b066ce.jpg",
//        "http://blog-imgs-37.fc2.com/g/r/e/greeeenhidegendama/2010022808394581e.jpg",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ナビゲーションバー非表示
        self.navigationController?.navigationBarHidden = true
        //レイアウト作成
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right :10)
        layout.itemSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 150)
        
        //コレクションビューのインスタンスを作成
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        
        collectionView!.registerClass(PhotoCell.self, forCellWithReuseIdentifier: "Cell")
//        collectionView!.registerNib(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        collectionView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView!)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let photoCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as PhotoCell
        photoCell.backgroundColor = UIColor.orangeColor()
        
        let photoUrlString = photos[indexPath.item]
        let url = NSURL(string: photoUrlString)
        var err: NSError?
        var imageData:NSData = NSData(contentsOfURL: url!, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)!
        
        println(indexPath.item)
        photoCell.imageView.image = UIImage(data: imageData)
        photoCell.imageView.alpha = 0
        UIView.animateWithDuration(0.2, animations: {
            photoCell.imageView.alpha = 1.0
        })

        return photoCell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("touch")
        println(indexPath.item)
        let photoCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as PhotoCell
        photoCell.imageView.alpha = 0.8
        
        var vc: PhotoView = PhotoView()
        let photoUrlString = photos[indexPath.item]
        let url = NSURL(string: photoUrlString)
        var err: NSError?
        vc.imageData = NSData(contentsOfURL: url!, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)!
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        println("highlight")
        println(indexPath.item)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

