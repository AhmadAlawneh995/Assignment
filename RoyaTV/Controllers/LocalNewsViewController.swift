//
//  LocalNewsViewController.swift
//  RoyaTV
//
//  Created by Ahmad Alawneh on 12/11/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit



class LocalNewsViewController: UIViewController {
    @IBOutlet weak var localNewsTV: UITableView!
    var localNews:[NewsModel]!

    override func viewDidLoad() {
        super.viewDidLoad()

        localNewsTV.dataSource = self
        localNewsTV.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        localNewsTV.reloadWithAnimation()

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


extension LocalNewsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 90
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return localNews.count
       
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
              let cell = tableView.dequeueReusableCell(withIdentifier: "LocalNewsTableViewCell", for: indexPath) as! LocalNewsTableViewCell
              let localNew = localNews[indexPath.row]
              cell.localNewsTitleLabel.text = localNew.news_title ?? ""
              cell.localNewsImageView.kf.indicatorType = .activity
              cell.localNewsImageView.kf.setImage(with: localNew.imageLink)
              cell.localNewsAgeLabel.text = "منذ اسبوع"
              cell.localNewsSectionLabel.text = localNew.section_name ?? ""
              cell.selectionStyle = .none
              
              return cell
          
          
      }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableCellAnimation(cell: cell)
     }
}
