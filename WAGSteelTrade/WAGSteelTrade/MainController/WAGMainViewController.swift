//
//  WAGMainViewController.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/4/27.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit

//let Screen_Width = UIScreen.main.bounds.size.width
//let Screen_Height = UIScreen.main.bounds.size.height


class WAGMainViewController: UIViewController {

    var splashViewContrllor : WAGSplashViewController!
    var loginViewController : WAGLoginViewController!
    var guideView : WAGGuidePageControl!
    var tabBarViewController : WAGTabBarViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(WAGMainViewController.notificationAction(notification:)), name: NSNotification.Name(rawValue: "user_logout"), object: nil)
        
        setupSplash()

        weak var weakSelf = self
         DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            weakSelf!.removeSplash()
            weakSelf!.setupGuidePage()
        }
        self.loginViewController =  WAGLoginViewController()
        

        
        let tabBarViewController : WAGTabBarViewController = WAGTabBarViewController()
        self.tabBarViewController = tabBarViewController
//        self.navigationController?.pushViewController(tabBarViewController, animated: true)
//        let nav = WAGNavigatioViewController.init(rootViewController: vc)
        weak  var  weak_self = self
        self.loginViewController.loginCallbackBlock = {
            weak_self?.addSubController(with: tabBarViewController)
        }
        
   
        
    }
    
    func setupGuidePage() {
        // Do any additional setup after loading the view.
        var imageNameArray: [String]! = [String]()
        
        let imgW :Int = Int(min(750 , Screen_Width * UIScreen.main.scale))
        let imgH :Int = Int(min(1334, Screen_Height * UIScreen.main.scale))
        let fileName_Seq : String = "\(imgW)"+"*" + "\(imgH)"
        
        for  index  in 1...3{
            imageNameArray.append("roadtrain_"+"\(index)_"+fileName_Seq)
        }
        
        let guideView = WAGGuidePageControl.init(imageNameArray: imageNameArray, isHiddenSkipButton: false)
        self.guideView = guideView
        
          weak  var  weak_self = self
          guideView.callback = {
            weak_self?.guideView.removeFromSuperview()
            weak_self?.addSubController(with: (weak_self?.loginViewController)!)
        }
        self.view.addSubview(guideView)
        
    }
    
    func  setupSplash(){
        self.splashViewContrllor = WAGSplashViewController()
        self .addChildViewController(self.splashViewContrllor)
        self.view .addSubview(self.splashViewContrllor.view)
         self.splashViewContrllor.view .snp .makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
         self.splashViewContrllor.didMove(toParentViewController: self)
        
        
//        self.splashViewContrllor = WAGSplashViewController()
//        self.addSubController(with: self.splashViewContrllor)
    }
    
    func removeSplash( )
    {
//        self.splashViewContrllor.willMove(toParentViewController:nil)
//        self.splashViewContrllor.removeFromParentViewController()
//        self.splashViewContrllor.view .removeFromSuperview()
        self.removeSubController(with: self.splashViewContrllor)
    }
    
    
    func addSubController(with subController:UIViewController){
        
        self.addChildViewController(subController)
        self.view .addSubview(subController.view)
        subController.view .snp .makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        subController.didMove(toParentViewController: self)

    }
    
    func removeSubController(with subController:UIViewController){
        subController.willMove(toParentViewController: nil)
        subController.removeFromParentViewController()
        subController.view.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func notificationAction(notification:Notification){
         self.removeSubController(with: self.tabBarViewController)
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
