//
//  LatestNewsViewController.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit

class LatestNewsViewController: UIViewController {
    
    @IBOutlet weak var latestNewsTV: UITableView!
    
    var latestNews: [NewsModel] = []
    var pageLimit = 3
    var pageNum:Int = 1
    var loadMoreNews = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = latestNewsTitle
        getLatestNews()
        
    }
    
    func getLatestNews() {
        showIndicator(view: self.view)
        NewsCaller.getLatestNews(pageNumber: String(pageNum)) { (isSuccess, latestNewsModel) in
            if isSuccess {
                if latestNewsModel != nil {
                    if let latestNews = latestNewsModel?.latest_news?.news {
                        if latestNews.count != 0 {
                            self.latestNews.append(contentsOf: latestNews)
                            self.latestNewsTV.reloadWithAnimation()
                            self.loadMoreNews = true
                        } else {
                            self.loadMoreNews = false
                        }
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
    
    func loadMoreData(){
        pageNum += 1
        getLatestNews()
    }
    
    @IBAction func menu_tapped(_ sender: Any) {
       setSideMenu()
    }
    
}

extension LatestNewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return latestNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LatestNewsTableViewCell", for: indexPath) as! LatestNewsTableViewCell
        
        let latestNew = latestNews[indexPath.row]
        
        cell.latestNewsTitleLabel.text = latestNew.news_title ?? ""
        cell.latestNewsImageView.kf.indicatorType = .activity
        cell.latestNewsImageView.kf.setImage(with: latestNew.imageLink)
        cell.latestNewsSectionLabel.text = latestNew.section_name ?? ""
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableCellAnimation(cell: cell)

        if indexPath.row == latestNews.count - 2 {
            if loadMoreNews && pageNum < pageLimit{
                loadMoreData()

            }
        }
    }
   
    
}
