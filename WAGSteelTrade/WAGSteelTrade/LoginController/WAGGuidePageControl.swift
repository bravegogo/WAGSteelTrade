//
//  WAGGuidePageControl.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/4/27.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit
import SnapKit

typealias CallbackBlock =  () -> Void


class WAGGuidePageControl: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var callback: CallbackBlock?
    
    
    var imageArray:[String]?
    var guidePageView: UIScrollView!
    var imagePageControl: UIPageControl?
    var currentPage :Int!;
 
    init(imageNameArray:[String], isHiddenSkipButton: Bool) {
        let frame = CGRect.init(x: 0, y: 0, width: Screen_Width, height: Screen_Height)
        super.init(frame: frame)
        self.currentPage = 0;
        self.imageArray = imageNameArray
        if self.imageArray == nil || self.imageArray?.count == 0 {
            return
        }
        self.addScrollView()
        self.addSkipBtn()
        self.addImages()
        self.addPageControl()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension WAGGuidePageControl: UIScrollViewDelegate{
    func addScrollView() ->  Void{
        self.guidePageView = UIScrollView();
//        self.guidePageView = UIScrollView.init(frame: frame)
        guidePageView.backgroundColor = UIColor.lightGray
        guidePageView.contentSize = CGSize.init(width: Screen_Width * (CGFloat)((self.imageArray?.count)!), height: Screen_Height)
        guidePageView.bounces = false
        guidePageView.isPagingEnabled = true
        guidePageView.showsHorizontalScrollIndicator = false
        guidePageView.delegate = self
        self.addSubview(guidePageView)
        
        self.guidePageView.snp.makeConstraints { (make) in
            make.edges.edges.equalTo(self)
        }
    }
    
    func addSkipBtn() -> Void {
        let skipBtn = UIButton();
        skipBtn.setTitle("跳过", for: UIControlState.normal)
        skipBtn.backgroundColor = UIColor.gray
        skipBtn.setTitleColor(UIColor.white, for: .normal)
        skipBtn.layer.cornerRadius = skipBtn.frame.size.height * 0.5
        skipBtn.addTarget(self, action: #selector(skipBtnAction), for: .touchUpInside)
        self.addSubview(skipBtn)
    }
    
    @objc func skipBtnAction() -> Void {
        UIView.animate(withDuration: 1, animations: {
            self.alpha = 0
        }) { (finish) in
            self.removeFromSuperview()
        }
    }
    
    
    func addPageControl( ) -> Void {
//        self.imagePageControl = UIPageControl.init(frame: CGRect.init(x: 0, y: HHScreenHeight*0.9, width: HHScreenWidth, height: HHScreenHeight*0.1))
        self.imagePageControl = UIPageControl()
        self.imagePageControl?.currentPage = 0
        self.imagePageControl?.numberOfPages = self.imageArray?.count ?? 0
        self.imagePageControl?.pageIndicatorTintColor = UIColor.black
        self.imagePageControl?.currentPageIndicatorTintColor = UIColor.red
        self.addSubview(self.imagePageControl!)
        
        self.imagePageControl?.snp .makeConstraints({ (make) in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(Screen_Height * 0.1)
            make.bottom.equalTo(self)
         })
        
        
    }
    
    // 图片
    func addImages() -> Void {
        guard let imageArray = self.imageArray else {
            return
        }
        for i in 0..<imageArray.count {
            let imageView =  UIImageView.init(frame: CGRect.init(x: Screen_Width * CGFloat(i), y: 0, width: Screen_Width, height: Screen_Height))
//            let idString = (imageArray[i] as NSString).substring(from: imageArray[i].count - 3)
//            if idString == "gif" {
//                imageView.image = UIImage.gifImageWithName(imageArray[i])
//                self.guidePageView.addSubview(imageView)
//            } else {
                imageView.image = UIImage.init(named: imageArray[i])
                self.guidePageView.addSubview(imageView)
//            }
            
//           //  在最后一张图片上显示开始体验按钮
//            if i == imageArray.count - 1 {
//                imageView.isUserInteractionEnabled = true
//                let startButton = UIButton.init(frame: CGRect.init(x: Screen_Width*0.1, y: Screen_Height*0.8, width: Screen_Width*0.8, height: Screen_Height*0.08))
//
//                startButton.setTitle("开始体验", for: .normal)
//                startButton.setTitleColor(UIColor.white, for: .normal)
//                startButton.setBackgroundImage(UIImage.init(named: "guide_btn_bg"), for: .normal)
//                startButton.addTarget(self, action: #selector(skipBtnAction), for: .touchUpInside)
//                imageView.addSubview(startButton)
//            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        
        let oldPage :Int = self.currentPage
        self.currentPage = Int(page)
        
        print("page" + ":\(page)")
        if (oldPage > 0 &&  oldPage == ((self.imageArray?.count)! - 1)) {
            // 跳转到下一页。
            if((callback) != nil){
                self.callback!()
            }
        }
        self.imagePageControl?.currentPage = Int(page)
    }
}

// MARK: - /************************代理方法************************/
//extension HHGuidePageHUD: UIScrollViewDelegate {
//
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let page = scrollView.contentOffset.x / scrollView.frame.size.width
//        self.imagePageControl?.currentPage = Int(page)
//    }
//
//}
