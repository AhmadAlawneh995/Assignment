//
//  NewsModel.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import Foundation
import ObjectMapper

struct NewsModel:Mappable {
    
    var news_title: String?
    var section_id: Int?
    var section_name: String?
    var created_age: String?
    var imageLink: URL?
    
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        news_title          <- map["news_title"]
        section_id          <- map["section_id"]
        section_name        <- map["section_name"]
        created_age         <- map["created_age"]
        imageLink           <- (map["imageLink"],URLTransform())
    }
    
    
}
