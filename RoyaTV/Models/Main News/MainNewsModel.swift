//
//  MainNewsModel.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import Foundation
import ObjectMapper

struct MainNewsModel: Mappable {
    
    var id: Int?
    var title: String?
    var section_id: Int?
    var visible: Int?
    var views: Int?
    var image: String?
    var image_description: String?
    var main_news: Int?
    var section_name: String?
    var news_title: String?
    var created_age: String?
    var imageLink: URL?

    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id                      <- map["id"]
        title                   <- map["title"]
        section_id              <- map["section_id"]
        visible                 <- map["visible"]
        views                   <- map["views"]
        image                   <- map["image"]
        image_description       <- map["image_description"]
        main_news               <- map["main_news"]
        section_name            <- map["section_name"]
        news_title              <- map["news_title"]
        created_age             <- map["created_age"]
        imageLink               <- (map["imageLink"],URLTransform())
    }
    
    
}
