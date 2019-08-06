//
//  Popular.swift
//  TrainingProject
//
//  Created by CuongVX-D1 on 7/26/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import ObjectMapper

struct Popular: Mappable {
    var id: Int = 0
    var status = 0
    var photo: String = ""
    var name: String = ""
    var descriptionRaw: String = ""
    var descriptionHtml: String = ""
    var scheduleStartDate: Date = Date()
    var scheduleStartTime: Date = Date()
    var scheduleEndDate: Date = Date()
    var scheduleEndTime: Date = Date()
    var goingCount: Int = 0
    var wentCount: Int = 0
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        status <- map["status"]
        photo <- map["photo"]
        name <- map["name"]
        descriptionRaw <- map["description_raw"]
        descriptionHtml <- map["description_html"]
        scheduleStartDate <- map["schedule_start_date"]
        scheduleStartTime <- map["schedule_start_time"]
        scheduleEndDate <- map["schedule_end_date"]
        scheduleEndTime <- map["schedule_end_time"]
        goingCount <- map["going_count"]
        wentCount <- map["went_count"]
    }
}
