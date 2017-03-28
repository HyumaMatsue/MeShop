//
//  CodeMakeViewController.swift
//  MeShop
//
//  Created by hyuma on 2016/12/16.
//  Copyright © 2016年 hyuma. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

class CodeMakeViewController : UIViewController,UITextFieldDelegate, CodeMakeViewDelegate{
    let codeMakeView = CodeMakeView()
    let collectionView = CollectionView()
    var name : String = ""
    var nameText =  UITextField()
    var button =  UIButton( frame: CGRectMake(0, 0, 100, 50 ))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //codeMakeView.delegate = self
        //self.view = codeMakeView
        
       // nameText!.delegate = self
        button.addTarget( self, action: "makeCode:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
    }
    
    //qrコード表示
    func makeCode( sender: UIButton ){
        var qrData = [UIImage]()
        if name == "" {
            return
        }
        let dataName = name
        // NSString から NSDataへ変換
        let data = dataName.dataUsingEncoding(NSUTF8StringEncoding)!
        
        // QRコード生成のフィルター
        // NSData型でデーターを用意
        // inputCorrectionLevelは、誤り訂正レベル
        let qr = CIFilter(name: "CIQRCodeGenerator", withInputParameters: ["inputMessage": data, "inputCorrectionLevel": "M"])!
        let sizeTransform = CGAffineTransformMakeScale(10, 10)
        let qrImage = qr.outputImage!.imageByApplyingTransform(sizeTransform)
        let image  = UIImageView(frame: CGRectMake(0, 0, 200, 200))
        image.image = UIImage(CIImage: qrImage)
        image.layer.position = CGPointMake(100, 300)
        self.view.addSubview(image)
        //
        let context = CIContext(options: nil)
        let cgImage = context.createCGImage(qrImage, fromRect: qrImage.extent)
        let qrCode = UIImage(CGImage: cgImage)
        
        let pasteboard: UIPasteboard = UIPasteboard.generalPasteboard()
        pasteboard.image = qrCode
        print(pasteboard.name)
        let imageURL: NSURL! =  NSURL( string:"line://msg/image/" + pasteboard.name)
        
        if UIApplication.sharedApplication().canOpenURL(imageURL) {
            UIApplication.sharedApplication().openURL( imageURL )
        }
        
        collectMgr.addCollction(name, date: name, qrCode: qrCode);
        /*
        let ud = NSUserDefaults.standardUserDefaults()
        if ud.objectForKey("data") != nil {
            qrData = ud.objectForKey("data") as! [UIImage]
        }
        ud.setObject(qrData, forKey: "data")
        //collectionView.dataImg.append(qrCode)
        //collectionView.myTableView.reloadData()*/
    }
    
    //
    func transitionView (){
        let transitionView = CollectionViewController()
        //transitionView.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        self.navigationController?.pushViewController(transitionView, animated: true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField){}
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + textField.text!)
        self.name = textField.text!
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}