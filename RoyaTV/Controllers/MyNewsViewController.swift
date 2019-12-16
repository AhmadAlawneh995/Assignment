//
//  MyNewsViewController.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit

class MyNewsViewController: UIViewController {
    
    @IBOutlet weak var myNewsTV: UITableView!
    
    var myNews: [NewsModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = myNewsTitle
        getMyNews()
        
        // Do any additional setup after loading the view.
    }
    
    
    func getMyNews() {
        showIndicator(view: self.view)
        NewsCaller.getMyNews { (isSuccess, mainObject) in
            if isSuccess {
                if mainObject != nil {
                    if let myNews = mainObject?.news {
                        self.myNews = myNews
                        self.myNewsTV.reloadWithAnimation()
                        hideIndicator(view: self.view)
                    } else {
                        hideIndicator(view: self.view)
                        showServerErrorAlert()
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
    @IBAction func menu_tapped(_ sender: Any) {
        setSideMenu()
    }
    
}

extension MyNewsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyNewsTableViewCell", for: indexPath) as! MyNewsTableViewCell
        
        let myNewsObject = myNews[indexPath.row]
        
        cell.myNewsTitleLabel.text = myNewsObject.news_title ?? ""
        cell.mynewsImageView.kf.indicatorType = .activity
        cell.mynewsImageView.kf.setImage(with: myNewsObject.imageLink)
        cell.myNewsSectionLabel.text = myNewsObject.section_name ?? ""
        cell.myNewsAgeLabel.text = myNewsObject.created_age ?? ""
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableCellAnimation(cell: cell)
     }
}
