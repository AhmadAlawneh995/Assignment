//
//  EconomicsViewController.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/2/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit

class EconomicsViewController: UIViewController {
    
    @IBOutlet weak var economicsTV: UITableView!
    
    var economicsModels: [NewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = economicTitle
        getAllEconomicNews()
        // Do any additional setup after loading the view.
    }
    
    func getAllEconomicNews() {
        showIndicator(view: self.view)
        NewsCaller.getEconomicsNews { (isSuccess, economicsNewsModel) in
            if isSuccess {
                if economicsNewsModel != nil {
                    if let economicsNews = economicsNewsModel?.section_info {
                        self.economicsModels = economicsNews
                        self.economicsTV.reloadWithAnimation()
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
    @IBAction func closeBtn_tapped(_ sender: Any) {
        let userInfo = [tabIndex:0]
        NotificationCenter.default.post(name: .userDidSelectIndex, object: nil, userInfo: userInfo)
        self.dismiss(animated: true, completion: nil)
    }
}

extension EconomicsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return economicsModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EconomicsTableViewCell") as! EconomicsTableViewCell
        let economicModel = economicsModels[indexPath.row]
        cell.economicsTitleLabel.text = economicModel.news_title ?? ""
        cell.economicsImageView.kf.indicatorType = .activity
        cell.economicsImageView.kf.setImage(with: economicModel.imageLink)
        cell.economicsSectionLabel.text = economicModel.section_name ?? ""
        cell.economicsAgeLabel.text = economicModel.created_age ?? ""
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableCellAnimation(cell: cell)
     }
}
