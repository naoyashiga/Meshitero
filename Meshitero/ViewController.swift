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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        return 14
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let photoCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as PhotoCell
        photoCell.backgroundColor = UIColor.orangeColor()
        
        let photoUrlString = "http://www.torian.jp/img/background4.jpg"
        let url = NSURL(string: photoUrlString)
        var err: NSError?
        var imageData:NSData = NSData(contentsOfURL: url!, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)!
        
//        let photoUrlRequest : NSURLRequest = NSURLRequest(URL: photoUrlString)
//        
//        let imageRequestSuccess = {
//            (request : NSURLRequest!, response : NSHTTPURLResponse!, image : UIImage!) -> Void in
//            photoCell.photoImageView.image = image;
//            photoCell.photoImageView.alpha = 0
//            UIView.animateWithDuration(0.2, animations: {
//                photoCell.photoImageView.alpha = 1.0
//            })
//        }
//        let imageRequestFailure = {
//            (request : NSURLRequest!, response : NSHTTPURLResponse!, error : NSError!) -> Void in
//            NSLog("imageRequrestFailure")
//        }
        photoCell.imageView.image = UIImage(data: imageData)
        photoCell.imageView.alpha = 0
        UIView.animateWithDuration(0.2, animations: {
            photoCell.imageView.alpha = 1.0
        })

//        photoCell.imageView.image = UIImage(named: "meshi.jpg")
        
        return photoCell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

