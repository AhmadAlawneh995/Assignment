//
//  MyTabBarController.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/2/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit


class MyTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectTabBarIndex), name: .userDidSelectIndex, object: nil)
        
    }

    
    
    @objc func selectTabBarIndex(notification: NSNotification) {
        
        switch notification.userInfo?[tabIndex] as? Int {
        case 0:
            self.selectedIndex = 0
        case 1:
            self.selectedIndex = 1
        case 2:
            self.selectedIndex = 2
        case 3:
            self.selectedIndex = 3
        default:
            self.selectedIndex = 0
        }
    }
}
