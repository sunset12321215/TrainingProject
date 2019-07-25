//

import ObjectMapper

struct News: Mappable {
    var id: Int = 0
    var feed: String = ""
    var title: String = ""
    var thumb_img: String = ""
    var detail_url: String = ""
    var description: String = ""
    var author: String = ""
    var publish_date: Date = Date()
    var created_at: Date = Date()
    var updated_at: Date = Date()
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        feed <- map["feed"]
        title <- map["title"]
        thumb_img <- map["thumb_img"]
        detail_url <- map["detail_url"]
        description <- map["description"]
        author <- map["author"]
        publish_date <- map["publish_date"]
        created_at <- map["created_at"]
        updated_at <- map["updated_at"]
    }
}
