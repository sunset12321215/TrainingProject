//
//  PopularRequest.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/26/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import Foundation

class PopularRequest: BaseRequest {
    required init() {
        super.init(url: URLs.APIPopularURL, requestType: .get)
    }
}
