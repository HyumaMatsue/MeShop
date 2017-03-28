//
//  ScanViewController.swift
//  MeShop
//
//  Created by hyuma on 2016/12/16.
//  Copyright © 2016年 hyuma. All rights reserved.
//

import Foundation
import UIKit

class ScanViewController : UIViewController,ScanViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let scanView = ScanView()
        scanView.delegate = self
        self.view = scanView
    }
    func alert(){
        // UIAlertControllerを作成する.
        let myAlert: UIAlertController = UIAlertController(title: "読み取り", message: "success", preferredStyle: .Alert)
        
        // OKのアクションを作成する.
        let myOkAction = UIAlertAction(title: "OK", style: .Default) { action in
            //let viewContorller = TitleView()
            
        }
        
        // OKのActionを追加する.
        myAlert.addAction(myOkAction)
        
        // UIAlertを発動する.
        presentViewController(myAlert, animated: true, completion: nil)
    }
    
}