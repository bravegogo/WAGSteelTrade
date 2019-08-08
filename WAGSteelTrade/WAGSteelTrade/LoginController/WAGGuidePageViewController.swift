//
//  WAGGuidePageViewController.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/4/27.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit
import SnapKit

class WAGGuidePageViewController: UIViewController,UIScrollViewDelegate {

    var pageContentView : UIScrollView!
    var pageControl : UIPageControl!
    var currentPage : Int!
    var dataSource : Array<Any>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageContentView = UIScrollView()
        // Do any additional setup after loading the view.
        self.view .addSubview(self.pageContentView)
        self.pageContentView.snp.makeConstraints { (make) -> Void in
            make.top.bottom.left.right.equalTo(self.view)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
