//
//  Collecrion.swift
//  MeShop
//
//  Created by hyuma on 2016/12/19.
//  Copyright © 2016年 hyuma. All rights reserved.
//

import Foundation
import UIKit

var collectMgr: Collection = Collection()


struct collections {
    var name = "Un-Named"
    var date = "Un-Described"
    var qrCode = UIImage()
}

class Collection: NSObject {
    var ud = NSUserDefaults.standardUserDefaults()
    var collection : [collections] = []
    
    func addCollction(name : String, date: String, qrCode : UIImage ){
        collection.append(collections(name: name, date: date, qrCode : qrCode))
        //ud.setObject( collection as? AnyObject, forKey : "data")
    }
}