//
//  CategoryRequest.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/31/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import Foundation

class CategoryRequest: BaseRequest {
    required init() {
        super.init(url: URLs.APICategoriesURL, requestType: .get)
    }
}
