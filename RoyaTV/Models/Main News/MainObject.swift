//
//  MainNewsModel.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/1/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import Foundation
import ObjectMapper

struct MainObject: Mappable{
    
    var mainNews: MainNewsModel?
    var SliderNews: [SliderNewsModel]?
    var sections: [SectionsModel]?
    
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        mainNews        <- map["main_news"]
        SliderNews      <- map["SliderNews"]
        sections        <- map["sections"]
    }
    
    
}
