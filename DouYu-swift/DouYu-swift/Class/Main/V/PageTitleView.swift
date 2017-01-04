//
//  PageTitleView.swift
//  DouYu-swift
//
//  Created by ck on 2017/1/3.
//  Copyright © 2017年 like. All rights reserved.
//

import UIKit

let kScrollLineH : CGFloat = 2

class PageTitleView: UIView {

    //保存 标题数组
    var titles: [String]
    
    //自定义 构造函数
    init(frame: CGRect, titles : [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //懒加载  属性
    lazy var scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.scrollsToTop = false
        scroll.bounces = false
        return scroll
    }()
    
    lazy var scrollLine : UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.orange
        return line
    }()
    
    
    lazy var titlsArr : [UILabel] = [UILabel]()
}

//设置UI界面
extension PageTitleView {
    
    func setupUI() {
        
        
        addSubview(scrollView)
        
        scrollView.frame  =  bounds
        
        setUpLab()
        
        //设置下划线和滑块
        setUpDownLine()
    }
    
    func setUpLab() {
        let labW : CGFloat = frame.width / CGFloat(titles.count)
        let labH : CGFloat = frame.height - kScrollLineH
        let labY : CGFloat = 0
        
        for (index , title) in titles.enumerated(){
            let lab = UILabel()
            lab.text = title
            lab.tag = index
            lab.font = UIFont.systemFont(ofSize: 16)
            lab.textColor = UIColor.darkGray
            lab.textAlignment = NSTextAlignment.center
            
            let labX = labW * CGFloat(index)
            lab.frame = CGRect(x: labX, y: labY, width: labW, height: labH)
        
            //添加到scrollview上
            scrollView.addSubview(lab)
            //把数据添加到数组中
            titlsArr.append(lab)
        }
    }
    
    
    func  setUpDownLine() {
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.darkGray
        bottomLine.frame = CGRect(x: 0, y: frame.height-0.5, width: frame.width, height: 0.5)
        addSubview(bottomLine)
        
        
        //滚动条
        //长度 取第一个lab的内容
        guard let fristLab = titlsArr.first else { return }
        fristLab.textColor = UIColor.orange
        
        //设置属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: fristLab.frame.origin.x, y: frame.height - kScrollLineH, width: fristLab.frame.size.width, height: kScrollLineH)
    }
}
