//
//  ViewController.swift
//  MeShop
//
//  Created by hyuma on 2016/12/16.
//  Copyright © 2016年 hyuma. All rights reserved.
//

import UIKit
import CoreImage

var myBoundSize: CGSize = UIScreen.mainScreen().bounds.size

class TitleViewContoller: UIViewController, TitleViewDelegate{
    private let COLLECTION : Int = 1
    private let SCAN : Int = 2
    private let QR : Int = 3
    
    @IBOutlet weak var collection: UIButton!
    @IBOutlet weak var scan: UIButton!
    @IBOutlet weak var qr: UIButton!
    
    let collectionViewController = CollectionViewController()
    let scanViewController = ScanViewController()
    let codemakeViewController = CodeMakeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "title"
        let titleView = TitleView()
        titleView.delegate = self
        //self.view = titleView
        collection.addTarget( self, action: "transition:", forControlEvents: .TouchUpInside )
        scan.addTarget(self, action: "transition:", forControlEvents: .TouchUpInside )
        qr.addTarget(self, action: "transition:", forControlEvents: .TouchUpInside )
    }
    
    func transition(sender : UIButton ){
        switch sender.tag {
        case COLLECTION:
            let transitionViewController: UIViewController = collectionViewController
            self.presentViewController(transitionViewController, animated: true, completion: nil)
            break
        case SCAN:
            let transitionViewController: UIViewController = scanViewController
            self.presentViewController(transitionViewController, animated: true, completion: nil)
            break
        case QR:
            let transitionViewController: UIViewController = codemakeViewController
            self.presentViewController(transitionViewController, animated: true, completion: nil)
            break
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
