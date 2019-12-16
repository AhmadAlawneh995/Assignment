//
//  RightSideViewController.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/2/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit

class RightSideMenuViewController: UIViewController {
    
    var userInfo:[String: Int] = [tabIndex:0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func mainNews_tapped(_ sender: Any) {
        
        //to close the side menu
        closeSideMenu()
        userInfo[tabIndex] = 0
        NotificationCenter.default.post(name: .userDidSelectIndex, object: nil, userInfo: userInfo)
        
    }
    @IBAction func myNews_tapped(_ sender: Any) {
        
        closeSideMenu()
        userInfo[tabIndex] = 1
        NotificationCenter.default.post(name: .userDidSelectIndex, object: nil, userInfo: userInfo)
    }
    
    @IBAction func latestNews_tapped(_ sender: Any) {
        
        closeSideMenu()
        userInfo[tabIndex] = 2
        NotificationCenter.default.post(name: .userDidSelectIndex, object: nil, userInfo: userInfo)
    }
    
    @IBAction func mostCommonNews_tapped(_ sender: Any) {
        
        closeSideMenu()
        userInfo[tabIndex] = 3
        NotificationCenter.default.post(name: .userDidSelectIndex, object: nil, userInfo: userInfo)
    }
    @IBAction func economics_tapped(_ sender: Any) {
        
        closeSideMenu()
        let economicsVC = storyboard?.instantiateViewController(withIdentifier: ViewControllers.EconomicsViewController.rawValue) as! EconomicsViewController
        economicsVC.modalPresentationStyle = .fullScreen
        self.present(economicsVC, animated: true, completion: nil)
        
    }
    @IBAction func palestine_tapped(_ sender: Any) {
        
        closeSideMenu()
        let palestineVC = storyboard?.instantiateViewController(withIdentifier: ViewControllers.PalestineViewController.rawValue) as! PalestineViewController
        palestineVC.modalPresentationStyle = .fullScreen

        self.present(palestineVC, animated: true, completion: nil)
    }
    
    @IBAction func hideSideMenu(_ sender: Any) {
        closeSideMenu()
    }
    
    
    func closeSideMenu(){
           //self.delayButton.backgroundColor = .clear
           UIView.animate(withDuration: 0.7, animations: {
               

                   self.view.frame = CGRect(x: self.view.frame.size.width*2, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
               
           },completion: {(value: Bool) in
               self.removeView()
           })
       }
    
    func removeView()  {
           self.willMove(toParent: nil)
           self.view.removeFromSuperview()
           self.removeFromParent()
       }
}
