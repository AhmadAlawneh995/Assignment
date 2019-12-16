//
//  PaletineViewController.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/2/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit

class PalestineViewController: UIViewController {
    
    @IBOutlet weak var pelstineNewsTV: UITableView!
    
    var palestineNews: [NewsModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = palestineTitle
        getPalestineNews()
        
        // Do any additional setup after loading the view.
    }
    
    func getPalestineNews() {
        showIndicator(view: self.view)
        NewsCaller.getPalestineNews{ (isSuccess, palestineNewsModel) in
            if isSuccess {
                if palestineNewsModel != nil {
                    if let palestineNews = palestineNewsModel?.section_info {
                        self.palestineNews = palestineNews
                        self.pelstineNewsTV.reloadWithAnimation()
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

extension PalestineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return palestineNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PalestineTableViewCell", for: indexPath) as! PalestineTableViewCell
        
        let palestineNew = palestineNews[indexPath.row]
        
        cell.palestineTitleLabel.text = palestineNew.news_title ?? ""
        cell.palestineSectionLabel.text = palestineNew.section_name ?? ""
        cell.palestineImageView.kf.indicatorType = .activity
        cell.palestineImageView.kf.setImage(with: palestineNew.imageLink)
        cell.palestineAgeLabel.text = palestineNew.created_age ?? ""
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableCellAnimation(cell: cell)
     }
    
}
