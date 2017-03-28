//
//  CollectionView.swift
//  MeShop
//
//  Created by hyuma on 2016/12/16.
//  Copyright © 2016年 hyuma. All rights reserved.
//

import Foundation
import UIKit

protocol CollectionViewDelegate : NSObjectProtocol {
    func addCode(sender : UIButton )
}

class CollectionView : UIView, UITableViewDelegate, UITableViewDataSource{
    var delegate : CollectionViewDelegate?
    var myTableView : UITableView!
    var dataImg : [UIImage] = []
    let myBoundSize: CGSize = UIScreen.mainScreen().bounds.size
    
    required init() {
        super.init(frame: CGRectMake(0, 0, 0, 0))
        self.backgroundColor = UIColor.redColor()
        let displayWidth: CGFloat = myBoundSize.width
        let displayHeight: CGFloat = myBoundSize.height
        let button = UIButton(frame: CGRectMake(0,0,100,200))
        button.layer.position = CGPointMake(200, 500)
        button.setTitle("追加", forState: .Normal)
        myTableView = UITableView(frame: CGRect(x: 0, y: 100, width: displayWidth, height: displayHeight - 100))
        myTableView.backgroundColor = .blueColor()
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        
        // Viewに追加する.
        self.addSubview(myTableView)
        // action
        button.addTarget(delegate, action: "addCode:", forControlEvents: .TouchUpInside )
        // add
        self.addSubview(button)
    }
    
    /*
    Cellが選択された際に呼び出されるデリゲートメソッド.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(collectMgr.collection[indexPath.row])")
    }
    
    /*
    Cellの総数を返すデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count : ", dataImg.count)
        return collectMgr.collection.count
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        let img = UIImageView( image: collectMgr.collection[indexPath.row].qrCode )
        img.frame = CGRectMake(0, 0, cell.frame.height, cell.frame.height)
        img.layer.position = CGPointMake(cell.frame.height / 2, cell.frame.height / 2)
        cell.addSubview(img)
        cell.backgroundColor = .greenColor()
        print("cell", indexPath.row)
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            collectMgr.collection.removeAtIndex(indexPath.row)
            myTableView.reloadData();
        }
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}