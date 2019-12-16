//
//  LatestNewsModel.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import Foundation
import ObjectMapper

struct LatestNewsModel: Mappable {
    
    var latest_news: LatestNewsObject?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        latest_news   <- map["latest_news"]
    }
    
    
}
