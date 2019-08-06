//
//  PopularResponse.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/26/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import ObjectMapper

class PopularResponse: Mappable {
    var populars = [Popular]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        populars <- map["response.events"]
    }
}
