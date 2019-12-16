//
//  PagerMainNewsViewController.swift
//  RoyaTV
//
//  Created by Ahmad Alawneh on 12/11/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import UIKit


class PagerMainNewsViewController: UIViewController {
    
    @IBOutlet weak var mainNewsTV: UITableView!
    var sliderNews:[SliderNewsModel]!


    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)

//        mainNewsTV.delegate = self
//        mainNewsTV.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if sliderNews != nil {
            mainNewsTV.reloadWithAnimation()

        }
    }

    @objc func showSpinningWheel(_ notification: NSNotification) {

                mainNewsTV.delegate = self
                mainNewsTV.dataSource = self
        mainNewsTV.reloadWithAnimation()
        
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


extension PagerMainNewsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 90
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return sliderNews.count
       
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
                        let sliderNew = sliderNews[indexPath.row]
                        cell.newsTitleLabel.text = sliderNew.news_title ?? ""
                        cell.newsImageView.kf.indicatorType = .activity
                        cell.newsImageView.kf.setImage(with: sliderNew.imageLink)
                        cell.newsAgesLabel.text = "منذ اسبوع"
                        cell.newsSectionLabel.text = sliderNew.section_name ?? ""
                        cell.selectionStyle = .none
        
                        return cell
          
          
      }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       tableCellAnimation(cell: cell)
      

    }
    
}

extension UIViewController{
    
    func tableCellAnimation(cell: UITableViewCell)  {
//        cell.alpha = 0
//                     UIView.animate(withDuration: 0.8) {
//                         cell.alpha = 1
//                     }
        
        var  rotation = CATransform3DMakeRotation( CGFloat((90.0 * .pi)/180), 0.0, 0.7, 0.4)
                     rotation.m34 = 1.0 / -600
                     cell.layer.shadowColor = UIColor.black.cgColor
                     cell.layer.shadowOffset = CGSize(width: 10, height: 10)
                     cell.alpha = 0

                     cell.layer.transform = rotation
                     cell.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
                     UIView.beginAnimations("rotation", context: nil)
                     UIView.setAnimationDuration(0.8)
                     cell.layer.transform = CATransform3DIdentity
                     cell.alpha = 1
                     cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                     UIView.commitAnimations()
//        
//        let tableViewHeight = cell.bounds.size.height
//          let cell = cell
//          var delayCounter = 0
//              cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
//          
//              UIView.animate(withDuration: 1.6, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//                  cell.transform = CGAffineTransform.identity
//              }, completion: nil)
//              delayCounter += 1
          
        
    }
}
