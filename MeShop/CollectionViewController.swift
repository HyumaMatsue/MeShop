//
//  CollectionViewController.swift
//  MeShop
//
//  Created by hyuma on 2016/12/16.
//  Copyright © 2016年 hyuma. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController : UIViewController, CollectionViewDelegate{
    var collectionView = CollectionView()
    
    override func viewDidLoad() {
        print("collectionm画面")
        super.viewDidLoad()
        collectionView.delegate = self
        self.view = collectionView
    }
    
    //QRコード作成画面に遷移
    func addCode(sender : UIButton ){
        let transitionViewController: UIViewController = CodeMakeViewController()
        //transitionViewController.modalTransitionStyle = .CoverVertical
        self.navigationController?.pushViewController(transitionViewController, animated: true)
    }
    
    func reloadData(){
        collectionView.myTableView.reloadData()
    }
    
    func setDate(img : CIImage){
        print(img)
        let image = UIImage(CIImage: img)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRectMake(0, 0, 200, 200)
        imageView.layer.position = CGPointMake(200, 200)
        self.view.addSubview(imageView)
        //collectionView.dataImg.append(img)
        //collectionView.myTableView.reloadData()
    }
    
    func getData() -> [ UIImage ]{
        return collectionView.dataImg
    }
    func hoge(){
        let ud = NSUserDefaults.standardUserDefaults()
        if ud.objectForKey("data") != nil {
            collectionView.dataImg = ud.objectForKey("data") as! [UIImage]!
        }
        print("save data : ", ud.objectForKey("data"))
        
    }
    
    override func viewWillAppear(animated: Bool) {
        collectionView.myTableView.reloadData();
    }
    
}