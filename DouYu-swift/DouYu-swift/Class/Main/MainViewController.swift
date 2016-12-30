//
//  MainViewController.swift
//  DouYu-swift
//
//  Created by ck on 2016/12/29.
//  Copyright © 2016年 like. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVc(storyboardName: "Home")
        addChildVc(storyboardName: "live")
        addChildVc(storyboardName: "Follow")
        addChildVc(storyboardName: "My")
    }
    
    
    private func addChildVc(storyboardName : String) {
        //instantiateInitialViewController xib箭头所指的
        let viewC = UIStoryboard.init(name: storyboardName, bundle: nil).instantiateInitialViewController()!
        addChildViewController(viewC)
    }
    
}
