//
//  NewsCaller.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import Foundation
import Alamofire

class NewsCaller {
    
    static let sessionManager: SessionManager = {
            let trustPolicies = MyServerTrustPolicyManager(policies: [:])
         let configuration = URLSessionConfiguration.default
         configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
         configuration.urlCache = nil
         configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
         let s = SessionManager(configuration: configuration, delegate: SessionDelegate(), serverTrustPolicyManager: trustPolicies)
         
         return s
     }()
    
    //Get main news
    static func getMainNews(completion:@escaping (_ isSuccess:Bool,_ mainObject : MainObject? ) -> Void) {
        sessionManager.request("\(BaseCaller.BASE_URL)", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.error == nil {
                if response.response?.statusCode == 200 {
                    if let mainObjectResponse = response.result.value as? Dictionary<String, Any> {
                        let mainObject = MainObject(JSON: mainObjectResponse)
                        completion(true, mainObject)
                        return
                    } else {
                        completion(false, nil)
                        return
                    }
                } else {
                    completion(false, nil)
                    return
                }
            } else {
                completion(false, nil)
                return
            }
        }
    }
    
    //Get my news
    static func getMyNews(completion:@escaping (_ isSuccess:Bool,_ mainObject : MyNewsModel? ) -> Void) {
        sessionManager.request("\(BaseCaller.BASE_URL)/my-news", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.error == nil {
                if response.response?.statusCode == 200 {
                    if let myNewsResponse = response.result.value as? Dictionary<String, Any> {
                        let myNews = MyNewsModel(JSON: myNewsResponse)
                        completion(true, myNews)
                        return
                    } else {
                        completion(false, nil)
                        return
                    }
                } else {
                    completion(false, nil)
                    return
                }
            } else {
                completion(false, nil)
                return
            }
        }
    }
    
    //Get latest news
    static func getLatestNews(pageNumber: String, completion:@escaping (_ isSuccess:Bool,_ mainObject : LatestNewsModel? ) -> Void) {
        sessionManager.request("\(BaseCaller.BASE_URL)/latest-news/" + pageNumber, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.error == nil {
                if response.response?.statusCode == 200 {
                    if let latestNewsResponse = response.result.value as? Dictionary<String, Any> {
                        let latestNews = LatestNewsModel(JSON: latestNewsResponse)
                        completion(true, latestNews)
                        return
                    } else {
                        completion(false, nil)
                        return
                    }
                } else {
                    completion(false, nil)
                    return
                }
            } else {
                completion(false, nil)
                return
            }
        }
    }
    
    //Get most viewed news
    static func getMostViewedNews(completion:@escaping (_ isSuccess:Bool,_ mainObject : MostViewedModel? ) -> Void) {
        sessionManager.request("\(BaseCaller.BASE_URL)/most-viewed/", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.error == nil {
                if response.response?.statusCode == 200 {
                    if let mostViewedResponse = response.result.value as? Dictionary<String, Any> {
                        let mostViewed = MostViewedModel(JSON: mostViewedResponse)
                        completion(true, mostViewed)
                        return
                    } else {
                        completion(false, nil)
                        return
                    }
                } else {
                    completion(false, nil)
                    return
                }
            } else {
                completion(false, nil)
                return
            }
        }
    }
    
    //Get economics news
    static func getEconomicsNews(completion:@escaping (_ isSuccess:Bool,_ mainObject : EconomicsNewsModel? ) -> Void) {
        sessionManager.request("\(BaseCaller.BASE_URL)/sections-show/12", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.error == nil {
                if response.response?.statusCode == 200 {
                    if let economicsNewsResponse = response.result.value as? Dictionary<String, Any> {
                        let economicsNews = EconomicsNewsModel(JSON: economicsNewsResponse)
                        completion(true, economicsNews)
                        return
                    } else {
                        completion(false, nil)
                        return
                    }
                } else {
                    completion(false, nil)
                    return
                }
            } else {
                completion(false, nil)
                return
            }
        }
    }
    
    //Get palestine news
    static func getPalestineNews(completion:@escaping (_ isSuccess:Bool,_ mainObject : PalestineNewsModel? ) -> Void) {
        sessionManager.request("\(BaseCaller.BASE_URL)/sections-show/8", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.error == nil {
                if response.response?.statusCode == 200 {
                    if let palestineNewsResponse = response.result.value as? Dictionary<String, Any> {
                        let palestineNews = PalestineNewsModel(JSON: palestineNewsResponse)
                        completion(true, palestineNews)
                        return
                    } else {
                        completion(false, nil)
                        return
                    }
                } else {
                    completion(false, nil)
                    return
                }
            } else {
                completion(false, nil)
                return
            }
        }
    }
    
}
open class MyServerTrustPolicyManager: ServerTrustPolicyManager {

    // Override this function in order to trust any self-signed https
    open override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
        return ServerTrustPolicy.disableEvaluation
    }
}
