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

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        var adHeight:CGFloat = 100
        var shareCenterY:CGFloat!
        if screenWidth > 320 {
            shareCenterY = centerY
        }else{
            shareCenterY = centerY - adHeight / 2
        
        }
        
        //背景色
        self.view.backgroundColor = UIColor.blackColor()
        println("photoView")

        // Do any additional setup after loading the view.
        //リトライボタン
        var button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        if screenHeight <= 480{
            button.frame = CGRectMake(centerX - buttonWidth / 2, screenHeight - buttonHeight * 3 - adHeight / 2 - 5, buttonWidth, buttonHeight)
            
        }else{
            button.frame = CGRectMake(centerX - buttonWidth / 2, screenHeight - buttonHeight * 2 - adHeight / 2 - 5, buttonWidth, buttonHeight)
            
        }
        button.backgroundColor = UIColor.whiteColor()
        
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = UIColor.blackColor().CGColor
        button.setTitle("もう一回する",forState: UIControlState.Normal)
        button.titleLabel!.font =  UIFont(name: "Futura-CondensedExtraBold", size: btnFontSize)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button.tag = 1
        self.view.addSubview(button)
        
        //twitter
        var tweetBtn = UIButton.buttonWithType(UIButtonType.System) as UIButton
        tweetBtn.frame = CGRectMake(centerX - shareBtnWidth / 2, shareCenterY, shareBtnWidth, shareBtnHeight)
        tweetBtn.backgroundColor = UIColor.whiteColor()
        tweetBtn.layer.cornerRadius = cornerRadius
        tweetBtn.layer.borderWidth = borderWidth
        tweetBtn.layer.borderColor = UIColor.blackColor().CGColor
        tweetBtn.setTitle("Tweet",forState: UIControlState.Normal)
        tweetBtn.titleLabel!.font =  UIFont(name: "Futura-CondensedMedium", size: shareBtnFontSize)
        tweetBtn.addTarget(self, action: "tweetBtnAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(tweetBtn)
        
        
        //LINE
        var lineBtn = UIButton.buttonWithType(UIButtonType.System) as UIButton
        lineBtn.frame = CGRectMake(centerX - shareBtnWidth / 2 + shareBtnWidth + shareBtnMargin, shareCenterY, shareBtnWidth, shareBtnHeight)
        lineBtn.backgroundColor = UIColor.whiteColor()
        lineBtn.layer.cornerRadius = cornerRadius
        lineBtn.layer.borderWidth = borderWidth
        lineBtn.layer.borderColor = UIColor.blackColor().CGColor
        lineBtn.setTitle("LINE",forState: UIControlState.Normal)
        lineBtn.titleLabel!.font =  UIFont(name: "Futura-CondensedMedium", size: shareBtnFontSize)
        lineBtn.addTarget(self, action: "lineBtnAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(lineBtn)
        
        //Facebook
        var fbBtn = UIButton.buttonWithType(UIButtonType.System) as UIButton
        fbBtn.frame = CGRectMake(centerX - shareBtnWidth / 2 - shareBtnWidth - shareBtnMargin, shareCenterY, shareBtnWidth, shareBtnHeight)
        fbBtn.backgroundColor = UIColor.whiteColor()
        fbBtn.layer.cornerRadius = cornerRadius
        fbBtn.layer.borderWidth = borderWidth
        fbBtn.layer.borderColor = UIColor.blackColor().CGColor
        fbBtn.setTitle("Facebook",forState: UIControlState.Normal)
        fbBtn.titleLabel!.font =  UIFont(name: "Futura-CondensedMedium", size: shareBtnFontSize)
        fbBtn.addTarget(self, action: "fbBtnAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(fbBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fbBtnAction(sender:UIButton!){
        var vc:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        var shareText:String = "sample"
        vc.setInitialText(shareText)
        self.presentViewController(vc,animated:true,completion:nil)
    }
    
    func tweetBtnAction(sender:UIButton!){
        var vc:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        var shareText:String = "sample"
        vc.setInitialText(shareText)
        self.presentViewController(vc,animated:true,completion:nil)
    }
    
    func lineBtnAction(sender:UIButton!){
        var shareText:String = "sample"
        var encodeMessage: String! = shareText.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        var messageURL: NSURL! = NSURL( string: "line://msg/text/" + encodeMessage )
        
        if (UIApplication.sharedApplication().canOpenURL(messageURL)) {
            UIApplication.sharedApplication().openURL( messageURL )
        }
    }
    
    func buttonAction(sender:UIButton!){
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
