//
//  MostViewedNewsViewController.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit

class MostViewedNewsViewController: UIViewController {
    
    @IBOutlet weak var mostViewedTV: UITableView!
    
    var mostViewedNews: [NewsModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = mostViewedNewsTitle
        getMostViewedNews()
        
        // Do any additional setup after loading the view.
    }
    
    func getMostViewedNews() {
        showIndicator(view: self.view)
        NewsCaller.getMostViewedNews { (isSuccess, mostViewedNewsModel) in
            if isSuccess {
                if mostViewedNewsModel != nil {
                    if let mostViewedNews = mostViewedNewsModel?.most_viewed {
                        self.mostViewedNews = mostViewedNews
                        self.mostViewedTV.reloadWithAnimation()
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


extension MostViewedNewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mostViewedNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MostViewedTableViewCell", for: indexPath) as! MostViewedTableViewCell
        
        let mostViewedNew = mostViewedNews[indexPath.row]
        
        cell.mostViewedTitleLabel.text = mostViewedNew.news_title ?? ""
        cell.mostViewedSectionLabel.text = mostViewedNew.section_name ?? ""
        cell.mostViewedImageView.kf.indicatorType = .activity
        cell.mostViewedImageView.kf.setImage(with: mostViewedNew.imageLink)
        cell.selectionStyle = .none
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableCellAnimation(cell: cell)
     }
}
