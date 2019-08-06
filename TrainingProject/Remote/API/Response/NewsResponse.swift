//

import ObjectMapper

class NewsResponse: Mappable {
    var news = [News]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        news <- map["response.news"]
    }
}
