//
//  Home.swift
//  RestartTech
//
//  Created by Riad Mohamed on 17/03/2021.
//

import Foundation

struct HomeResponse: Codable {
    var statusCode: Int
    private enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case message = "message"
        case data = "data"
    }
    var message: String
    var data: HomeData?
}

struct HomeData: Codable {
    var attractions: [SectionData] = []
    var events: [SectionData] = []
    var hotSpots: [SectionData] = []
    private enum CodingKeys: String, CodingKey {
        case hotSpots = "hot_spots"
        case events = "events"
        case attractions = "attractions"
    }
}

struct SectionData: Codable {
        var name: String?
        var desc: String?
        private enum CodingKeys: String, CodingKey {
            case name = "name"
            case desc = "description"
        }
}

struct HomeSection: Codable {
    var name: String?
    var imageString: String?
    var elements:[SectionData]?
}

struct MySection {
    var name: String
    var imageName: String
    var data: [String]
}

//
//struct Attraction: Codable {
//    var name: String?
//    var desc: String?
//    private enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case desc = "description"
//    }
//}
//
//struct Event: Codable {
//    var name: String?
//    var desc: String?
//    private enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case desc = "description"
//    }
//}
//
//struct HotSpot: Codable {
//    var name: String?
//    var desc: String?
//    private enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case desc = "description"
//    }
//}
