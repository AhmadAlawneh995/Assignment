//
//  MainNewsViewController.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit
import Kingfisher
import PageMenu



class MainNewsViewController: UIViewController,CAPSPageMenuDelegate {
   
    
    
    @IBOutlet weak var mainNewsImageView: UIImageView!
    @IBOutlet weak var mainNewsHeadlineLabl: UILabel!
    @IBOutlet weak var mainNewSectionLabel: UILabel!
    @IBOutlet weak var mainNewAgeLabel: UILabel!

    
    var drawerContainer: MMDrawerController?
     var window: UIWindow?
    
    @IBOutlet weak var underLiveView: UIView!
    var pageMenu : CAPSPageMenu?

    
    var mainObject:MainObject?
    var sliderNews:[SliderNewsModel] = []
    var localNews:[NewsModel] = []
    var mainNews:MainNewsModel?
    var sections:[SectionsModel] = []
    
    var pagerMainNewsViewController:PagerMainNewsViewController!
    var localNewsViewController:LocalNewsViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = mainNewsTitle
        mainNewsImageView.setBlackGradient()
            setUpPageMenu()
        getMainNews()

        // Do any additional setup after loading the view.
    }
    


    
    
    func setUpPageMenu()  {

        // Array to keep track of controllers in page menu
         var controllerArray : [UIViewController] = []

         // Create variables for all view controllers you want to put in the
         // page menu, initialize them, and add each to the controller array.
         // (Can be any UIViewController subclass)
         // Make sure the title property of all view controllers is set
         // Example:
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
        pagerMainNewsViewController = storyboard.instantiateViewController(withIdentifier: "PagerMainNewsViewControllerID") as? PagerMainNewsViewController
         pagerMainNewsViewController.title = "الرئيسية"

        localNewsViewController = storyboard.instantiateViewController(withIdentifier: "LocalNewsViewControllerID") as? LocalNewsViewController
        localNewsViewController.title = "محليات"

         
         controllerArray.append(pagerMainNewsViewController)
         controllerArray.append(localNewsViewController)


         // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
         // Example:
         
         let parameters: [CAPSPageMenuOption] = [
             .menuItemSeparatorWidth(4.3),
             .useMenuLikeSegmentedControl(true),
             .menuItemSeparatorPercentageHeight(0.1)
         ]

         // Initialize page menu with controller array, frame, and optional parameters
    

        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: underLiveView.frame.origin.y , width: self.view.frame.width, height: self.view.frame.height/2 - (tabBarController?.tabBar.frame.size.height ?? 0) / 2 + 50 ), pageMenuOptions: parameters)
               pageMenu!.delegate = self

         // Lastly add page menu as subview of base view controller view
         // or use pageMenu controller in you view hierachy as desired
         self.view.addSubview(pageMenu!.view)
    }
    
    
    func getMainNews() {
        showIndicator(view: self.view)
        NewsCaller.getMainNews { (isSuccess, mainObject) in
            if isSuccess {
                if mainObject != nil {
                    if let sliderNews = mainObject?.SliderNews {
                        self.sliderNews = sliderNews
                        self.pagerMainNewsViewController.sliderNews = sliderNews
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil, userInfo: nil)

                    }
                    if let mainNews = mainObject?.mainNews {
                        self.mainNews = mainNews
                        
                        self.updateMainNews(mainNewsObject: self.mainNews!)
                    }
                    
                    if let sections = mainObject?.sections {
                        if let localNews = sections[0].newsModels {
                            self.localNews = localNews
                            self.localNewsViewController.localNews = localNews

                        }
                    }
                } else {
                    hideIndicator(view: self.view)
                    showServerErrorAlert()
                }
                
            } else {
                hideIndicator(view: self.view)
                showServerErrorAlert()
            }
        }
        
    }
    
    func updateMainNews(mainNewsObject: MainNewsModel) {
        mainNewsHeadlineLabl.text = mainNewsObject.news_title ?? ""
        mainNewsImageView.kf.indicatorType = .activity
        mainNewsImageView.kf.setImage(with: mainNewsObject.imageLink)
        mainNewsImageView.contentMode = .scaleAspectFill
        mainNewSectionLabel.text = mainNewsObject.section_name ?? ""
        mainNewAgeLabel.text = mainNewsObject.created_age ?? ""
        hideIndicator(view: self.view)
        
    }
    
    @IBAction func menu_tapped(_ sender: Any) {
       setSideMenu()

    }
    
}




extension UITableView {
func reloadWithAnimation() {
    self.reloadData()
    let tableViewHeight = self.bounds.size.height
    let cells = self.visibleCells
    var delayCounter = 0
    for cell in cells {
        cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
    }
    for cell in cells {
        UIView.animate(withDuration: 1.6, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            cell.transform = CGAffineTransform.identity
        }, completion: nil)
        delayCounter += 1
    }
}
}

extension UIViewController{
        func setSideMenu() {
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if let sideMenu = storyboard.instantiateViewController(withIdentifier: "RightSideMenuViewController") as? RightSideMenuViewController {
                        sideMenu.loadView()
                        let finalFrame = sideMenu.view.frame
    //                    if MOLHLanguage.currentAppleLanguage() == "en" {
    //                        sideMenu.view.frame = CGRect(x: -UIScreen.main.bounds.size.height/2, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    //                    }else{
                            sideMenu.view.frame = CGRect(x: UIScreen.main.bounds.size.height/2, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                        //}
                        UIView.animate(withDuration: 0.4, animations: {
                            let window = UIApplication.shared.keyWindow!
                            sideMenu.willMove(toParent: self)
                            window.addSubview(sideMenu.view)
                            self.addChild(sideMenu)
                            sideMenu.view.frame = finalFrame
                            sideMenu.didMove(toParent: self)
                        })
                    }
          
        }
}
