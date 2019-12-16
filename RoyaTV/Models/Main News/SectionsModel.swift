//
//  SectionsModel.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import Foundation
import ObjectMapper

struct SectionsModel:Mappable {
    
    var section_id:Int?
    var section_name: String?
    var newsModels: [NewsModel]?
    
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        section_id      <- map["section_id"]
        section_name    <- map["section_name"]
        newsModels      <- map["news"]
    }
    
    
}
