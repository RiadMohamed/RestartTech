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
//    var attractions: [Attraction] = []
    var events: [Event] = []
    var hotSpots: [HotSpot] = []
    private enum CodingKeys: String, CodingKey {
        case hotSpots = "hot_spots"
        case events = "events"
    }
}

//struct Attraction: Codable {
//    var id: Int = 0
//    var name: String = ""
//    var is_active: Boolean = true
//    var description: String? = nil
//
//}

struct Event: Codable {
    var name: String?
    var desc: String?
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case desc = "short_description"     // Using short desc from the JSON response instead of description
    }
}

struct HotSpot: Codable {
    var name: String?
    var categories: [Category]?
}

struct Category: Codable {
    var name: String?
    private enum Codingkeys: String, CodingKey {
        case name = "name"
    }
}

