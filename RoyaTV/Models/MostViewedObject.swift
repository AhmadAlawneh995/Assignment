//
//  MostViewedObject.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import Foundation
import ObjectMapper

struct MostViewedObject:Mappable {
    
    var mostViewed: [NewsModel]
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        news  <- map["most_viewed"]
    }
    
    
}
