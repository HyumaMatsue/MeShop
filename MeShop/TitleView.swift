//
//  TitleView.swift
//  MeShop
//
//  Created by hyuma on 2016/12/16.
//  Copyright © 2016年 hyuma. All rights reserved.
//

import Foundation
import UIKit

protocol TitleViewDelegate : NSObjectProtocol {}

class TitleView : UIView{
    var delegate : TitleViewDelegate?
    
    required init() {
        super.init(frame: CGRectMake( 0, 0, 0, 0 ))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}