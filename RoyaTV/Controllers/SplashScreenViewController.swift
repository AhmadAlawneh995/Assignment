//
//  SplashScreenViewController.swift
//  RoyaTV
//
//  Created by Ahmad Alawneh on 12/12/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var ImageContenerView: UIView!
    
  


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
           //ImageContenerView.transform = CGAffineTransform(rotationAngle: CGFloat(0.2))  // rotation line

            let animationKey = "position.y"
            CATransaction.begin()
            let moveYAnimation = CABasicAnimation( keyPath:  animationKey)
            moveYAnimation.fromValue = self.view.bounds.size.height
        moveYAnimation.toValue = ImageContenerView.frame.origin.y + (ImageContenerView.frame.size.height / 2)
            moveYAnimation.duration = 1
            ImageContenerView.layer.add( moveYAnimation, forKey: animationKey )

            // Callback function
            CATransaction.setCompletionBlock {
                //print("end animation")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let MyTabBarController = storyboard.instantiateViewController(withIdentifier: "MyTabBarController") as! MyTabBarController
                MyTabBarController.modalPresentationStyle = .fullScreen
                self.present(MyTabBarController, animated: true, completion: nil)

            }

            // Do the actual animation and commit the transaction
            ImageContenerView.layer.add(moveYAnimation, forKey: animationKey)
            CATransaction.commit()
        
        
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
