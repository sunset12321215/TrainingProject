//
//  CategoryResponse.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/31/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import Foundation
import ObjectMapper

class CategoriesResponse: Mappable {
    var categories = [Category]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        categories <- map["response.categories"]
    }
}
