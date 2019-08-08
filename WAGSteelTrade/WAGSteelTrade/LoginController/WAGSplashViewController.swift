//
//  WAGSplashViewController.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/4/27.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit
import SnapKit

class WAGSplashViewController: UIViewController {

    var splashImageView : UIImageView!
    var imageObj: UIImage?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
         }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print( )
        
        let imageName = "LaunchImage_" + "\(CLong(Screen_Width))" + "_" + "\(CLong(Screen_Height))"
       
        self.imageObj =  UIImage.init(named: imageName)
        
        if imageObj == nil{
            imageObj = UIImage.init(named: "LaunchImage_375_667")
        }
        
        var  imageObj2:UIImage?
           imageObj2 =  UIImage.init(named: imageName)
        
        if imageObj2 == nil{
            imageObj2 = UIImage.init(named: "LaunchImage_375_667")
        }
        
        self.splashImageView = UIImageView.init(image: self.imageObj)
        
        self.view .addSubview(self.splashImageView)
        
        self.splashImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        
//        guard  imageObj != nil else{
////            ("LaunchImage_375_667")
//            imageObj = UIImage.init(named: "LaunchImage_375_667")
//        }

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
