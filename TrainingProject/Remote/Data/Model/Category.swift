//
//  Category.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/31/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import Foundation
import ObjectMapper

struct Category: Mappable {
    var id: Int = 0
    var name: String = ""
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}
