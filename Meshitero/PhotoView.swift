//
//  PhotoView.swift
//  Meshitero
//
//  Created by naoyashiga on 2014/11/23.
//  Copyright (c) 2014年 naoyashiga. All rights reserved.
//

import UIKit
import Social

class PhotoView: UIViewController {
//    var imageData:NSData!
    var photoUrlString:NSString!
    var meshiPhoto:UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ビューの位置、大きさ
        var centerX: CGFloat = self.view.bounds.size.width / 2
        var centerY: CGFloat = self.view.bounds.size.height / 2
        var screenWidth: CGFloat = self.view.bounds.size.width
        
        //ボタンサイズ
        var shareBtnWidth: CGFloat = self.view.bounds.size.width * 0.2
        var shareBtnMargin: CGFloat = 30
        
        //背景色
        self.view.backgroundColor = UIColor.blackColor()
        // タイトルを表示するラベルを作成
        let navigationLabel = UILabel()
        navigationLabel.text = "Share this image"
        navigationLabel.textColor  = UIColor.hexStr("fefefe", alpha: 1)
        navigationLabel.sizeToFit()
        navigationItem.titleView = navigationLabel
        
        
        //UIImageViewのサイズと位置を決めます
        var imgSize:CGFloat = 250;
        let url = NSURL(string: photoUrlString)
        var err: NSError?
        var imageData:NSData = NSData(contentsOfURL: url!, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)!
        meshiPhoto = UIImage(data: imageData)
        var imageView:UIImageView = UIImageView(image: meshiPhoto)
        imageView.frame = CGRectMake(centerX - screenWidth / 2, 0, screenWidth, imgSize)
        
        //viewに追加します
        self.view.addSubview(imageView)

        var imageView2:UIImageView = UIImageView(image: meshiPhoto)
        imageView2.frame = CGRectMake(centerX - screenWidth / 2, imgSize, screenWidth, imgSize)
        self.view.addSubview(imageView2)
        
        var imageView3:UIImageView = UIImageView(image: meshiPhoto)
        imageView3.frame = CGRectMake(centerX - screenWidth / 2, imgSize * 2, screenWidth, imgSize)
        //viewに追加します
        self.view.addSubview(imageView3)
        addButton(0, title: "Back")
        addButton(0, title: "Tweet")
        addButton(shareBtnWidth + shareBtnMargin, title: "LINE")
        addButton(-shareBtnWidth - shareBtnMargin, title: "FB")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addButton(x:CGFloat,title:String){
        var centerX: CGFloat = self.view.bounds.size.width / 2
        var centerY: CGFloat = self.view.bounds.size.height / 2
        var screenWidth: CGFloat = self.view.bounds.size.width
        var screenHeight: CGFloat = self.view.bounds.size.height
        var buttonWidth: CGFloat = self.view.bounds.size.width * 0.8
        var buttonHeight: CGFloat = 50
        var btnMarginY: CGFloat = 20
        var btnFontSize: CGFloat = 22
        var cornerRadius: CGFloat = 10
        var borderWidth: CGFloat = 1
        
        var shareBtnWidth: CGFloat = self.view.bounds.size.width * 0.2
        var shareBtnHeight: CGFloat = buttonHeight
        var shareBtnMargin: CGFloat = 30
        var shareBtnFontSize:CGFloat = 18
        
        var shareCenterY:CGFloat!
        if screenWidth > 320 {
            shareCenterY = centerY * 1.3
        }else{
            shareCenterY = centerY * 1.3
        }
        
        var actionName:Selector!
        
        var btn = UIButton.buttonWithType(UIButtonType.System) as UIButton
        
        if title == "Back"{
            //backボタンの大きさ
            if screenHeight <= 480{
                btn.frame = CGRectMake(centerX - buttonWidth / 2, screenHeight - buttonHeight * 3, buttonWidth, buttonHeight)
            }else{
                btn.frame = CGRectMake(centerX - buttonWidth / 2, screenHeight - buttonHeight * 2, buttonWidth, buttonHeight)
            }
        }else{
            btn.frame = CGRectMake(centerX - shareBtnWidth / 2 + x, shareCenterY, shareBtnWidth, shareBtnHeight)
            
        }
        
        btn.backgroundColor = UIColor.blackColor()
        btn.layer.cornerRadius = cornerRadius
        btn.layer.borderWidth = borderWidth
        btn.layer.borderColor = UIColor.whiteColor().CGColor
        
        btn.setTitle(title,forState: UIControlState.Normal)
        btn.titleLabel!.font =  UIFont(name: "Kailasa", size: shareBtnFontSize)
        btn.tintColor = UIColor.whiteColor()
        btn.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Center
        
        //セレクターの判定
        switch title{
            case "Tweet":
                actionName = "tweetBtnAction:"
            case "LINE":
                actionName = "lineBtnAction:"
            case "FB":
                actionName = "fbBtnAction:"
            case "Back":
                actionName = "backBtnAction:"
            default:
                break;
        }
        
        btn.addTarget(self, action: actionName, forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    func fbBtnAction(sender:UIButton!){
        var vc:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        var shareText:String = "sample"
        //テキストを設定
        vc.setInitialText(shareText)
        //投稿画像を設定
        vc.addImage(meshiPhoto)
        self.presentViewController(vc,animated:true,completion:nil)
    }
    
    func tweetBtnAction(sender:UIButton!){
        var vc:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        var shareText:String = "sample"
        //テキストを設定
        vc.setInitialText(shareText)
        //投稿画像を設定
        vc.addImage(meshiPhoto)
        self.presentViewController(vc,animated:true,completion:nil)
    }
    
    func lineBtnAction(sender:UIButton!){
        var pasteboard:UIPasteboard = UIPasteboard.generalPasteboard()
        //投稿画像を設定
        pasteboard.image = meshiPhoto
        
        var imageURL: NSURL! = NSURL(string: "line://msg/image/" + pasteboard.name)
        
        if (UIApplication.sharedApplication().canOpenURL(imageURL)) {
            UIApplication.sharedApplication().openURL(imageURL)
        }
    }
    
    func backBtnAction(sender:UIButton!){
        //リトライする
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
