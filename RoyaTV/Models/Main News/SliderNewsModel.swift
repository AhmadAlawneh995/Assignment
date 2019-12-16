//
//  SliderNewsModel.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import Foundation
import ObjectMapper

struct SliderNewsModel: Mappable {
    
    var news_id: Int?
    var news_title: String?
    var section_id: Int?
    var section_name: String?
    var imageLink: URL?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        news_id             <- map["news_id"]
        news_title          <- map["news_title"]
        section_id          <- map["section_id"]
        section_name        <- map["section_name"]
        imageLink           <- (map["imageLink"],URLTransform())
    }
    
    
}
