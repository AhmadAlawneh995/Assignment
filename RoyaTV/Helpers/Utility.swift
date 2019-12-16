//
//  Helpers.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import Foundation
import MBProgressHUD


func showIndicator(view:UIView){
    UIApplication.shared.beginIgnoringInteractionEvents()
    let progressBar = MBProgressHUD.showAdded(to: view, animated: true)
    progressBar.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    progressBar.label.text = "جاري التحميل..."
    
}
func hideIndicator(view:UIView){
    MBProgressHUD.hide(for: view, animated: true)
    UIApplication.shared.endIgnoringInteractionEvents()
}

func closeDrawer() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.drawerContainer?.closeDrawer(animated: true, completion: nil)
}

func openDrawer() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.drawerContainer?.toggle(MMDrawerSide.right, animated: true, completion: nil)
}


func showAlert(_ title:String = "",message:String,buttonTitle:String){
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
    
    let alertWindow = UIWindow(frame: UIScreen.main.bounds)
    alertWindow.rootViewController = UIViewController()
    alertWindow.windowLevel = UIWindow.Level.alert + 1
    alertWindow.makeKeyAndVisible()
    DispatchQueue.main.async {
        alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

func showServerErrorAlert(){
    
    showAlert(message: "حصل خطا في الخادم", buttonTitle: "موافق")
    
}

