//
//  UIBarBtnItem_extension.swift
//  DouYu-swift
//
//  Created by ck on 2016/12/30.
//  Copyright © 2016年 like. All rights reserved.
//

import UIKit


extension UIBarButtonItem {
    //封装方法
    //类方法
    //但是不是最好的方便，用构造方法
    
    
//    class func creatItem (imgName : String, hightImgNmae : String, point : CGPoint,size : CGSize) -> UIBarButtonItem {
//        
//        let btn = UIButton()
//        btn.setImage(UIImage(named: imgName), for: .normal)
//        btn.setImage(UIImage(named: hightImgNmae), for: .highlighted)
//        btn.frame = CGRect(origin: point, size: size)
//        
//        return UIBarButtonItem(customView: btn)
//    
//    }
    
    
    //便利构造函数
    //1.convenience 开头
    //2.在构造函数中必须明确调用一个设计的构造函数self
    
   convenience init(imgName : String, hightImgNmae : String = "", point : CGPoint ,size : CGSize) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imgName), for: .normal)
    
//        if hightImgNmae != nil {
            btn.setImage(UIImage(named: hightImgNmae), for: .highlighted)
//        }
    
        btn.frame = CGRect(origin: point, size: size)
        
        self.init(customView: btn)
    }
}
