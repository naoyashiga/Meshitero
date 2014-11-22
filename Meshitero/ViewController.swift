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
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right :10)
        layout.itemSize = CGSize(width: 90, height: 120)
        
        //コレクションビューのインスタンスを作成
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        
//        collectionView!.registerClass(PhotoCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView!.registerNib(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        collectionView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView!)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as PhotoCell
        cell.backgroundColor = UIColor.orangeColor()
        cell.imageView.image = UIImage(named: "meshi.jpg")
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

