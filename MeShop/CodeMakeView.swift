//
//  CodeMakeView.swift
//  MeShop
//
//  Created by hyuma on 2016/12/16.
//  Copyright © 2016年 hyuma. All rights reserved.
//

import Foundation
import UIKit

protocol CodeMakeViewDelegate : NSObjectProtocol{
}

class CodeMakeView : UIView{
    var delegate : CodeMakeViewDelegate?
    
    
    required override init(frame: CGRect) {
        super.init(frame: CGRectMake(0, 0, 0, 0))
        //self.backgroundColor = .greenColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}