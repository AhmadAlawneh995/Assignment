//
//  PalestineNewsModel.swift
//  RoyaTV
//
//  Created by Ali Shaker on 9/2/19.
//  Copyright © 2019 Ali Shaker. All rights reserved.
//

import Foundation
import ObjectMapper

struct PalestineNewsModel: Mappable {
    
    var section_info: [NewsModel]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        section_info    <- map["section_info"]
        
    }
    
    
}
