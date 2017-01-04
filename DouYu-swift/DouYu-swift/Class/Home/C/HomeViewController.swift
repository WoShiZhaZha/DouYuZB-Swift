//
//  HomeViewController.swift
//  DouYu-swift
//
//  Created by ck on 2016/12/30.
//  Copyright © 2016年 like. All rights reserved.
//

import UIKit


let kTitleViewH : CGFloat =  40

class HomeViewController: UIViewController {
    
    //懒加载 自定义view
    lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["图片","美女","嘿嘿","啪啪","哈哈"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        
        return titleView
    }()
    
    //系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
}

extension HomeViewController {
    func setUpUI() {
        //调整坐标，取消scrollview的内边距
        automaticallyAdjustsScrollViewInsets = false
        
    //设置导航栏
        setUpNavBar()
        
        self.view.addSubview(pageTitleView)
    }
    
    private func setUpNavBar() {
        let origin = CGPoint(x: 0, y: 0)
        let sizeRight = CGSize(width: 50, height: 50)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "logo", hightImgNmae: "", point: origin, size: sizeRight)
        
        
        //右侧图标
        let size = CGSize(width: 40, height: 40)
        
        let historyItem = UIBarButtonItem(imgName: "image_my_history", hightImgNmae: "Image_my_history_click", point: origin, size: size)


        let searchItem = UIBarButtonItem(imgName: "btn_search", hightImgNmae: "btn_search_clicked", point: origin, size: size)
        
        
        let qrcodeItem = UIBarButtonItem(imgName: "Image_scan", hightImgNmae: "Image_scan_click", point: origin, size: size)
        
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }

}
