//
//  MostViewedModel.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import Foundation
import ObjectMapper

struct MostViewedModel: Mappable {
    
    var most_viewed: [NewsModel]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        most_viewed   <- map["most_viewed"]
    }
    
    
}
