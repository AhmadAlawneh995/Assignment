//
//  MyNewsModel.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import Foundation
import ObjectMapper

struct MyNewsModel: Mappable {
    
    var news: [NewsModel]?

    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        news     <- map["news"]
    }
    
    
}
