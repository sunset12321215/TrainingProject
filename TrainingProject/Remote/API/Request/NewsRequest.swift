//
//  NewsRequest.swift

import Foundation

class NewsRequest: BaseRequest {
    required init() {
        super.init(url: URLs.APINewsURL, requestType: .get)
    }
}
